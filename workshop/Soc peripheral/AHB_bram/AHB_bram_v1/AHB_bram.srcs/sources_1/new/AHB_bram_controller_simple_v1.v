`timescale 1ns/1ps
`include "ahb_defines.vh"
module AHB_bram_controller #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
    )(
    // AHB-Lite slave interface
    //global signals
    // Clock and reset signals
    input  wire HCLK,        // AHB system clock input
    input  wire HRESETn,     // AHB system reset input, active low

    // Slave select signal
    input  wire HSELx,       // Slave select signal, asserted when this slave is selected

    // Address and control signals
    input wire     [ADDR_WIDTH-1:0] HADDR,      // Address bus, specifies the address for the current transfer
    input wire                      HWRITE,     // Transfer direction; 1 = write, 0 = read
    input wire     [2:0]            HSIZE,      //simplified here// Transfer size; indicates the size of the transfer (byte0, halfword1, word2 etc.)
    input wire     [2:0]            HBURST,     //not use now// Burst type; indicates if the transfer is single, incrementing, or wrapping burst
    input wire     [3:0]            HPROT,      //not use now// Protection control signals; provides information about the bus access type
    input wire     [1:0]            HTRANS,     // Transfer type; indicates the type of the current transfer (IDLE0, BUSY1, NONSEQ2, SEQ3)
    input wire                      HMASTLOCK,  //not use now// Locked transfer signal; indicates if the current transfer is part of a locked sequence
    input wire                      HREADY,     // Transfer ready input; indicates if the previous transfer has finished 1

    // Write data bus
    input wire     [DATA_WIDTH-1:0] HWDATA,     // Write data bus; carries data from master to slave during write operations

    // Transfer response signals
    output wire    HREADYOUT,                   // Transfer ready output; indicates if the slave is ready to complete the transfer
    output wire    HRESP,                       // Transfer response; indicates the status of the transfer (OKAY0, ERROR1)

    // Read data bus
    output reg     [DATA_WIDTH-1:0] HRDATA,     // Read data bus; carries data from slave to master during read operations
    // AHB-Lite slave interface

    // single port ram BRAM interface
    output reg  [ADDR_WIDTH-1:0]       bram_addra,
    output reg  [DATA_WIDTH-1:0]       bram_dina,
    input  wire [DATA_WIDTH-1:0]       bram_douta,
    output reg                         bram_ena,
    output reg  [(DATA_WIDTH/8)-1 : 0]  bram_wea
    // BRAM interface
    // ports
);

// HRESP: 1'b0 = OKAY, 1'b1 = ERROR
// Only support HSIZE <= 2 (word) and HBURST == 3'b000 (SINGLE)

assign HRESP = (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY &&
               ((HSIZE > 3'd2) || (HBURST != 3'b000))) ? 1'b1 : 1'b0;
               
assign HREADYOUT = 1'b1; // always ready

//from vivado AXI 
    // Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
localparam integer ADDR_LSB = (DATA_WIDTH/32) + 1; // 2 for 32 bits



// reg [1:0] read_write_state_d1;

// always @(posedge HCLK or negedge HRESETn) begin
//     if (!HRESETn) begin
//         read_write_state_d1 <= 2'b00;
//     end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
//         read_write_state_d1 <= 2'b01; // write
//     end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
//         read_write_state_d1 <= 2'b10; // read
//     end else begin
//         read_write_state_d1 <= 2'b11; // idle
//     end
    
// end

localparam FREE = 2'b00,
           WRITE = 2'b01,
           READ = 2'b10,
           IDLE = 2'b11;

reg [1:0] last_state, current_state;

localparam  IDLE = 2'b00,
            FREE = 2'b01,
            WORK = 2'b10,
            BUSY = 2'b11;
            

reg [1:0] bram_state;

always @(posedge HCLK or posedge HRESETn) begin
    if (HRESETn) begin
        last_state <= IDLE;
    end else begin
        last_state <= current_state;
    end
end

always @(*) begin
    if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
       current_state = WRITE
    end
    else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
        current_state = READ
    end
    else begin
       current_state = FREE;
    end
end

always @(*) begin
    if(last_state == WRITE || current_state == READ) begin
        bram_state = BUSY;
    end else if((current_state == FREE) ||(last_state == READ && current_state == WRITE)) begin
        bram_state = FREE;
    end else if((last_state == READ && current_state == READ) || (last_state == WRITE && current_state == WRITE)) begin
        bram_state = WORK;
    end else begin
        bram_state = IDLE;
    end
end

reg [ADDR_WIDTH-1:0] addr_reg;
reg [2:0] hsize_reg;
    
// always @(*) begin
//     case (current_state)
//         FREE: begin
//             if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
//                 next_state = WRITE
//             end
//             else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
//                 next_state = READ
//             end
//             else begin
//                 next_state = FREE;
//             end
//         end
//         WRITE: begin
//             if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
//                 next_state = WRITE
//             end
//             else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
//                 next_state = READ
//             end
//             else begin
//                 next_state = FREE;
//             end
//         end
//         READ: begin
//             if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
//                 next_state = WRITE
//             end
//             else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
//                 next_state = READ
//             end
//             else begin
//                 next_state = FREE;
//             end
//         end
//         IDLE: begin
//             if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
//                 next_state = WRITE
//             end
//             else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
//                 next_state = READ
//             end
//             else begin
//                 next_state = FREE;
//             end
//         end
//         default: begin
//             next_state = IDLE;
//         end
//     endcase
// end

// address_valid address delay one cycle
reg address_valid;
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        address_valid <= 1'b0;
    end else begin
        address_valid <= HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ);
    end
end

// write delay register
reg write_pending;
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        write_pending <= 1'b0;
    end else begin
        write_pending <= HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE;
    end
end

// bram_ena control 
always @(*) begin
    if (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY && !HWRITE) begin
        bram_ena = 1'b1; // read operation, valid immediately
    end else if (write_pending) begin
        bram_ena = 1'b1; // write operation, delayed by one cycle
    end else begin
        bram_ena = 1'b0;
    end
end

// bram_wea control
always @(posedge HCLK or negedge HRESETn) begin
    if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin // write operation, delayed by one cycle
        case (hsize_r)
            3'b000: bram_wea <= (4'b0001 << word_enable[ADDR_LSB-1:0]);
            3'b001: bram_wea <= 4'b0011 << {word_enable[1],1'b0};
            3'b010: bram_wea <= 4'b1111;
            default: bram_wea <= 4'b0000;
        endcase
    end else begin
        bram_wea <= 4'b0000;
    end
end

// bram_dina 控制
always @(*) begin
    if (!HRESETn) begin
        bram_dina = {DATA_WIDTH{1'b0}};
    end else if (write_pending) begin
        bram_dina = HWDATA;
    end else begin
        bram_dina = {DATA_WIDTH{1'b0}};
    end
end

// HRDATA 控制
always @(*) begin
    if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (address_valid && !HWRITE) begin
        case (HSIZE)
            3'b000: HRDATA = {24'b0, bram_douta[7:0]};
            3'b001: HRDATA = {16'b0, bram_douta[15:0]};
            3'b010: HRDATA = bram_douta;
            default: HRDATA = {DATA_WIDTH{1'b0}};
        endcase
    end else begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end
end



// // address processsing
// reg [ADDR_LSB-1:0] word_enable;
// reg [2:0] hsize_r;
// // reg address_valid;
// reg hwrite_r;

// always @(posedge HCLK or negedge HRESETn) begin
//     if (!HRESETn) begin
//         bram_addra <= {ADDR_WIDTH{1'b0}};
//         word_enable <= {ADDR_LSB{1'b0}};
//         // address_valid <= 1'b0;
//         hsize_r <= 3'b000;
//         hwrite_r <= 1'b0;
//     // end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ || HTRANS == `HBURST_HTRANS_SEQ)) begin // only use NONSEQ here
//     end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ ) && HWRITE) begin //write // only use NONSEQ here
//         bram_addra <= ({(ADDR_WIDTH-1){1'b0}}|HADDR[ADDR_WIDTH-1:ADDR_LSB]); // word aligned address
//         word_enable <= HADDR[ADDR_LSB-1:0];
//         // address_valid <= 1'b1;
//         hsize_r <= HSIZE;
//         hwrite_r <= HWRITE;
//     end else begin
//         bram_addra <= bram_addra;
//         word_enable <= word_enable;
//         // address_valid <= 1'b0;
//         hsize_r <= hsize_r;
//         hwrite_r <= hwrite_r;
//     end
// end

// //wea processing
// always @(*) begin
//     if (hwrite_r) begin // write_enable为写使能条件
//         case (hsize_r)
//             3'b000: // 8bit
//                 bram_wea = (4'b0001 << word_enable[ADDR_LSB-1:0]);
//             3'b001: // 16bit
//                 bram_wea = 4'b0011 << {word_enable[1],1'b0};
//             3'b010: // 32bit
//                 bram_wea = 4'b1111;
//             default:
//                 bram_wea = 4'b0000;
//         endcase
//     end
//     else begin
//         bram_wea = 4'b0000;
//     end
// end


// always @(posedge HCLK or negedge HRESETn) begin
//     if (!HRESETn) begin
//         bram_dina <= {DATA_WIDTH{1'b0}};
//         HRDATA <= {DATA_WIDTH{1'b0}};
//         bram_ena <= 1'b0;
//     end else if(address_valid && hwrite_r) begin
//         bram_dina <= HWDATA;
//         HRDATA <= {DATA_WIDTH{1'b0}};
//         bram_ena <= 1'b1;
//     end else if(address_valid && !hwrite_r) begin
//         bram_dina <= {DATA_WIDTH{1'b0}};
//         case (hsize_r)
//             3'b000: // 8bit
//                 HRDATA <= {24'b0, bram_douta[7:0]};
//             3'b001: // 16bit
//                 HRDATA <= {16'b0, bram_douta[15:0]};
//             3'b010: // 32bit
//                 HRDATA <= bram_douta;
//             default:
//                 HRDATA <= {DATA_WIDTH{1'b0}};
//         endcase
//         bram_ena <= 1'b1;
//     end else begin
//         bram_dina <= {DATA_WIDTH{1'b0}};
//         HRDATA <= {DATA_WIDTH{1'b0}};
//          bram_ena <= 1'b0;
//     end
// end


endmodule