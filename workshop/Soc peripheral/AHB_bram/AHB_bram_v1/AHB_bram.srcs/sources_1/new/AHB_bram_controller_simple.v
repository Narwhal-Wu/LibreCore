`timescale 1ns/1ps
`include "ahb_defines.vh"
module AHB_bram_controller #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 32,
    //from vivado AXI 
    // Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
    parameter integer ADDR_LSB = (DATA_WIDTH/32) + 1 // 2 for 32 bits  

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
    output reg  [ADDR_WIDTH-1:0]       bram_addra,   // BRAM address port (write/read address)
    output reg  [DATA_WIDTH-1:0]       bram_dina,    // BRAM data input port (write data)
    input  wire [DATA_WIDTH-1:0]       bram_douta,   // BRAM data output port (read data)
    output reg                         bram_ena,     // BRAM enable signal
    output reg  [(DATA_WIDTH/8)-1 : 0]  bram_wea     // BRAM write enable (byte-wise)
    // BRAM interface
    // ports
);

localparam  bus_FREE = 2'b00,
            bus_WRITE = 2'b01,
            bus_READ = 2'b10,
            bus_IDLE = 2'b11;

localparam  bram_IDLE = 2'b00,
            bram_FREE = 2'b01,
            bram_WORK = 2'b10,
            bram_BUSY = 2'b11;

// HRESP: 1'b0 = OKAY, 1'b1 = ERROR
// Only support HSIZE <= 2 (word) and HBURST == 3'b000 (SINGLE)

reg HRESP_reg;
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HRESP_reg <= 1'b0;
    end else begin
        if ((HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY &&
            ((HSIZE > 3'd2) || (HBURST != 3'b000))) || (bram_2BUSY == 2'b10)) begin
            HRESP_reg <= 1'b1;
        end else begin
            HRESP_reg <= 1'b0;
        end
    end
end
assign HRESP = HRESP_reg;
               
assign HREADYOUT = 1'b1; // always ready

reg [1:0] bus_state_d1;
reg [1:0] bus_state;

reg [1:0] bram_state;

reg [2:0] hsize_r;

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        bus_state_d1 <= bus_IDLE;
        hsize_r <= 3'b000;
    end else begin
        bus_state_d1 <= bus_state;
        if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ)) begin
            hsize_r <= HSIZE;
        end else begin
            hsize_r <= hsize_r;
        end
    end
end

always @(*) begin
    if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
       bus_state = bus_WRITE;
    end
    else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
        bus_state = bus_READ;
    end
    else begin
       bus_state = bus_FREE;
    end
end

always @(*) begin
    if(bus_state_d1 == bus_WRITE && bus_state == bus_READ) begin
        bram_state = bram_BUSY;
    end else if((bus_state == bus_FREE) ||(bus_state_d1 == bus_READ && bus_state == bus_WRITE)) begin
        bram_state = bram_FREE;
    end else if((bus_state_d1 == bus_READ && bus_state == bus_READ) || (bus_state_d1 == bus_WRITE && bus_state == bus_WRITE) 
              ||(bus_state_d1 == bus_FREE && bus_state == bus_WRITE) || (bus_state_d1 == bus_FREE && bus_state == bus_READ)) begin
        bram_state = bram_WORK;
    end else begin
        bram_state = bram_IDLE;
    end
end

reg [1:0] bram_2BUSY;

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        bram_2BUSY <= 2'b0;
    end else if (bram_state == bram_BUSY && bram_2BUSY == 2'b01) begin
        bram_2BUSY <= 2'b10;
    end else if (bram_state == bram_BUSY && bram_2BUSY == 2'b00) begin
        bram_2BUSY <= 2'b01;
    end else if (bram_state == bram_FREE) begin
        bram_2BUSY <= 2'b0;
    end else begin
        bram_2BUSY <= bram_2BUSY;
    end
end

// generate the addr_r for write operation
reg [ADDR_WIDTH-1 : 0] addr_r;

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_r <= {ADDR_WIDTH{1'b0}};
    end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ)) begin
        addr_r <= HADDR;
    end else begin
        addr_r <= addr_r;
    end
end

always @(*) begin
    if (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY && !HWRITE) begin
        bram_addra = HADDR;
    end else if (write_pending) begin
        bram_addra = addr_r; // use the registered address for write operation
    end else if (register_active_d1 && bram_state == bram_FREE) begin
        bram_addra = addr_reg; // use the registered address when in free state
    end else begin
        bram_addra = {ADDR_WIDTH{1'b0}};
    end
end

// bram_ena control 
always @(*) begin
    if (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY && !HWRITE) begin
        bram_ena = 1'b1; // read operation, valid immediately
    end else if (write_pending) begin
        bram_ena = 1'b1; // write operation, delayed by one cycle
    end else if (register_active_d1 && bram_state == bram_FREE) begin
        bram_ena = 1'b1; // register active and state is free
    end else begin
        bram_ena = 1'b0;
    end
end

// bram_wea control

reg [(DATA_WIDTH/8)-1:0] bram_wea_busy;

always @(*) begin
    if (!HRESETn) begin
        bram_wea = {(DATA_WIDTH/8){1'b0}};
    end else if (write_pending) begin
        if(bram_state == bram_BUSY) begin
            bram_wea_busy = bram_wea_decode; // hold write enable during busy state
            bram_wea = {(DATA_WIDTH/8){1'b0}};
        end
        else begin
            bram_wea = bram_wea_decode;
        end
    end else if (register_active_d1 && bram_state == bram_FREE) begin
        bram_wea = bram_wea_reg;
    end else begin
        bram_wea = {(DATA_WIDTH/8){1'b0}};
    end
end


reg [ADDR_WIDTH-1:0] addr_reg;
reg [DATA_WIDTH-1:0] data_reg;
reg [(DATA_WIDTH/8)-1:0] bram_wea_reg;

reg register_active;
reg register_active_d1;

always @(posedge HCLK or negedge HRESETn) begin
    if(!HRESETn) begin
        register_active_d1 <= 1'b0;
    end else begin
        register_active_d1 <= register_active;
    end
end

always @(*) begin
    if (!HRESETn) begin
        register_active = 1'b0;
    end else if (bram_state == bram_BUSY) begin
        register_active = 1'b1;
    end else if (bram_state == bram_FREE) begin
        register_active = 1'b0;
    end else begin
        register_active = register_active;
    end
    
end
    
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_reg <= {ADDR_WIDTH{1'b0}};
        data_reg <= {DATA_WIDTH{1'b0}};
        bram_wea_reg <= {(DATA_WIDTH/8){1'b0}};
    end else if (bram_state == bram_BUSY) begin
        addr_reg <= addr_r;
        data_reg <= HWDATA;
        bram_wea_reg <= bram_wea_busy;
    end else if (bram_state == bram_FREE) begin
        addr_reg <= {ADDR_WIDTH{1'b0}};
        data_reg <= {DATA_WIDTH{1'b0}};
        bram_wea_reg <= {(DATA_WIDTH/8){1'b0}};
    end
    
end

// read_pending address delay one cycle
reg read_pending;
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        read_pending <= 1'b0;
    end else begin
        read_pending <= HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE;
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


reg [(DATA_WIDTH/8)-1:0] bram_wea_decode;

// bram_wea_decode control
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        bram_wea_decode <= {(DATA_WIDTH/8){1'b0}};
    end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin // write operation, delayed by one cycle
        case (HSIZE)
            3'b000: bram_wea_decode <= ({{(DATA_WIDTH/8-1){1'b0}},1'b1} << HADDR[ADDR_LSB-1:0]);
            // 3'b001: bram_wea_decode <= 4'b0011 << {word_enable[1],1'b0};
            3'b001: bram_wea_decode <= ({{(DATA_WIDTH/8-2){1'b0}},2'b11} << {HADDR[1],1'b0});
            3'b010: bram_wea_decode <= {(DATA_WIDTH/8){1'b1}};
            default: bram_wea_decode <= {(DATA_WIDTH/8){1'b0}};
        endcase
    end else begin
        bram_wea_decode <= {(DATA_WIDTH/8){1'b0}};
    end
end

// bram_dina control
always @(*) begin
    if (!HRESETn) begin
        bram_dina = {DATA_WIDTH{1'b0}};
    end else if (write_pending) begin
        bram_dina = HWDATA;
    end else if (register_active_d1 && bram_state == bram_FREE) begin
        bram_dina = data_reg;
    end else begin
        bram_dina = {DATA_WIDTH{1'b0}};
    end
end

// HRDATA control

reg [1:0] offset;
reg [ADDR_WIDTH-1:0] bram_addra_d1;
always @(posedge HCLK or HRESETn ) begin
    if(!HRESETn) begin
        offset <= 2'b0;
        bram_addra_d1 <= {ADDR_WIDTH{1'b0}};
    end else begin
        offset <= bram_addra[ADDR_LSB-1:0];
        bram_addra_d1 <= bram_addra;
    end
end

always @(*) begin
    if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (read_pending) begin
    if(register_active_d1 && (bram_addra_d1[ADDR_WIDTH-1:ADDR_LSB] == addr_reg[ADDR_WIDTH-1:ADDR_LSB])) begin
            // according bram_wea_reg combine data_reg and bram_douta read write circle
            case (hsize_r)
                3'b000: begin
                    HRDATA = {24'b0, (bram_wea_reg[offset] ? data_reg[8*offset +: 8] : bram_douta[8*offset +: 8])};
                end
                3'b001: begin
                    HRDATA = {16'b0,
                        (bram_wea_reg[offset+1]   ? data_reg[8*(offset+1) +: 8] : bram_douta[8*(offset+1) +: 8]),
                        (bram_wea_reg[offset]     ? data_reg[8*offset +: 8]     : bram_douta[8*offset +: 8])};
                end
                3'b010: begin
                    HRDATA = {
                        (bram_wea_reg[3]   ? data_reg[24 +: 8] : bram_douta[24 +: 8]),
                        (bram_wea_reg[2]   ? data_reg[16 +: 8] : bram_douta[16 +: 8]),
                        (bram_wea_reg[1]   ? data_reg[8 +: 8]  : bram_douta[8 +: 8]),
                        (bram_wea_reg[0]   ? data_reg[0 +: 8]  : bram_douta[0 +: 8])};
                end
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
        end else begin
            case (hsize_r)
                3'b000: HRDATA = {24'b0, bram_douta[8*offset +: 8]};
                3'b001: HRDATA = {16'b0, bram_douta[8*offset +: 16]};
                3'b010: HRDATA = bram_douta;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
        end
    end
    else begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end
end


endmodule