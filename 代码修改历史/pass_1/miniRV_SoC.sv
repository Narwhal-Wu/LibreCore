`timescale 1ns / 1ps

module miniRV_SoC (
    input  logic         fpga_rst,   // High active
    input  logic         fpga_clk,

    output logic         debug_wb_have_inst, // 当前时钟周期是否有指令写回
    output logic [31:0]  debug_wb_pc,        // 当前写回的指令的PC
    output               debug_wb_ena,       // 指令写回时，寄存器堆的写使能
    output logic [ 4:0]  debug_wb_reg,       // 指令写回时，写入的寄存器号
    output logic [31:0]  debug_wb_value      // 指令写回时，写入寄存器的值
);

    logic        cpu_clk;
    assign cpu_clk = fpga_clk;
    
    // 中间信号定义
    logic [31:0] inst_addr;         // CPU 输出的指令地址
    logic [31:0] inst;              // IROM 输出的指令
    logic [31:0] mem_addr;          // CPU 输出的数据地址
    // logic [31:0] mem_read_data;     // DRAM 输出的读数据
    // logic [31:0] mem_write_data;    // CPU 输出的写数据
    // logic we;            // CPU 输出的写使能

    // CPU 实例化
    myCPU Core_cpu (
        .RES            (fpga_rst),
        .CLK            (cpu_clk),
        .HLT            (1'b0),

        .IDATA               (inst),
        .IADDR          (inst_addr),

        .DADDR           (mem_addr),
        .DATAI      (dram_rdata),
        .DATAO      (perip_wdata),

        // .we             (we),
        .debug_wb_have_inst (debug_wb_have_inst),
        .debug_wb_pc        (debug_wb_pc),
        .debug_wb_ena       (debug_wb_ena),
        .debug_wb_reg       (debug_wb_reg),
        .debug_wb_value     (debug_wb_value),
        .DLENO              (perip_mask),
        .perip_wen          (perip_wen)


    );
    // wire cpu_rst;
    // assign cpu_rst = !fpga_rst;
    wire [15:0] ains;
    // wire [15:0] adat;
    assign ains = inst_addr[17:2];
    // assign adat = mem_addr[15:0];
    // IROM 实例化
    IROM Mem_IROM (
        .a          (ains), 
        .spo        (inst)
    );

///////////////////////dram_driver//////////////////////////////////////////////
////////////interface/////////////////
////////////interface/////////////////
////////////interface/////////////////
   logic         clk;
   assign clk = cpu_clk;

   logic [17:0]  perip_addr;//also perip_addr
   assign perip_addr = mem_addr[17:0];
   logic [31:0]  perip_wdata;//also perip_wdata
   logic [1:0]	 perip_mask;//also perip_musk
   logic         dram_wen;
   assign dram_wen = perip_wen;

   logic [31:0]  dram_rdata;
//    logic [31:0]  dram_data_bridge;
//    assign dram_data_bridge = dram_rdata;		
////////////interface/////////////////

    logic [15:0] dram_addr;
    logic [ 1:0] offset;
    logic [31:0] dram_data, dram_rdata_raw;

    assign dram_addr = perip_addr[17:2];
    assign offset = perip_addr[1:0];

    DRAM Mem_DRAM (
        .clk        (clk),
        .a          (dram_addr),
        .spo        (dram_rdata_raw),
        .we         (dram_wen),
        .d          (dram_data)
    );

    // dram_rdata_raw process, lh lb
    always_comb begin
        dram_rdata = 0;
        case (perip_mask)
            2'b00: // lb/lbu
                case (offset)
                    2'b00:  dram_rdata = {24'b0, dram_rdata_raw[7:0]};
                    2'b01:  dram_rdata = {24'b0, dram_rdata_raw[15:8]};
                    2'b10:  dram_rdata = {24'b0, dram_rdata_raw[23:16]};
                    2'b11:  dram_rdata = {24'b0, dram_rdata_raw[31:24]};
                endcase
            2'b01: // lh/lhu
                case (offset[1])
                    1'b0:  dram_rdata = {16'b0, dram_rdata_raw[15:0]};
                    1'b1:  dram_rdata = {16'b0, dram_rdata_raw[31:16]};
                endcase
            2'b10: dram_rdata = dram_rdata_raw;
            default: dram_rdata = 0;
        endcase
    end

    // dram_data_raw process, sh, sb
    always_comb begin
        case (perip_mask)
            2'b10: dram_data = perip_wdata;  // sw
            2'b01: begin           // sh
                case (offset[1])
                    1'b0: dram_data = {dram_rdata_raw[31:16], perip_wdata[15:0]};
                    1'b1: dram_data = {perip_wdata[15:0], dram_rdata_raw[15:0]};
                endcase
            end
            2'b00: begin           // sb
                case (offset)
                    2'b00: dram_data = {dram_rdata_raw[31:8], perip_wdata[7:0]};
                    2'b01: dram_data = {dram_rdata_raw[31:16], perip_wdata[7:0], dram_rdata_raw[7:0]};
                    2'b10: dram_data = {dram_rdata_raw[31:24], perip_wdata[7:0], dram_rdata_raw[15:0]};
                    2'b11: dram_data = {perip_wdata[7:0], dram_rdata_raw[23:0]};
                endcase
            end
            default: dram_data = perip_wdata;
        endcase
    end
    ///////////////////////////////////////////////////////////////////////////////////////////////
    // DRAM 实例化

endmodule