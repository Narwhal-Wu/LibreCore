//========================================
// 4. Memory阶段：数据访问
//========================================
`timescale 1ns / 1ps
`include "config.vh"

`define LUI     7'b0110111
`define AUIPC   7'b0010111
`define JAL     7'b1101111
`define JALR    7'b1100111
`define BCC     7'b1100011
`define LCC     7'b0000011
`define SCC     7'b0100011
`define MCC     7'b0010011
`define RCC     7'b0110011
`define SYS     7'b1110011
`define CUS     7'b0001011 

module memory (
    input         CLK,
    input         HLT,
    input  [31:0] DATAI,
    input  [31:0] EX_MEM_pc,
    input  [31:0] EX_MEM_inst,
    input  [31:0] EX_MEM_alu,
    input  [4:0]  EX_MEM_rd,
    input  [31:0] EX_MEM_rs2,
    input         EX_MEM_is_load,
    input         EX_MEM_is_store,
    input         EX_MEM_is_sys,
    input  [31:0] EX_MEM_csr_data,
    input         forward_rs1_L_1,
    input         forward_rs1_L_2,
    input  [31:0] forward_rs1_L_1_datai,
    input  [31:0] forward_rs1_L_2_datai,


    output [31:0] MEM_WB_inst,
    output [31:0] MEM_WB_data,   
    output [4:0]  MEM_WB_rd,
    output [31:0] MEM_WB_alu,
    output [31:0] MEM_WB_pc,
    output [31:0] DADDR,
    output [31:0] DATAO,
    output [2:0]  DLEN,
    output        DRW,
    output        DRD,
    output        DWR,
    output        DAS
);

reg [31:0] mem_wb_inst = 0;    // MEM-WB流水线寄存器
reg [31:0] mem_wb_data;   
reg [4:0]  mem_wb_rd;
reg [31:0] mem_wb_alu;
reg [31:0] mem_wb_pc;

assign MEM_WB_inst = mem_wb_inst;
assign MEM_WB_pc = mem_wb_pc;
assign MEM_WB_data = mem_wb_data;
assign MEM_WB_rd = mem_wb_rd;
assign MEM_WB_alu = mem_wb_alu;
assign DADDR = EX_MEM_alu;
assign DATAO = EX_MEM_rs2;
assign DLEN  = (EX_MEM_is_load || EX_MEM_is_store) ? 
               ((EX_MEM_inst[14:12] == 3'b000 || EX_MEM_inst[14:12] == 3'b100) ? 3'b001 : // LB
                (EX_MEM_inst[14:12] == 3'b001 || EX_MEM_inst[14:12] == 3'b101) ? 3'b010 : // LH
                                                3'b100  // LW
               ) : 3'b000;
assign DRW   = EX_MEM_is_store;
assign DRD   = EX_MEM_is_load;
assign DWR   = EX_MEM_is_store;
assign DAS   = EX_MEM_is_load || EX_MEM_is_store;

// 数据对齐与符号扩�?
wire [31:0] load_data;
assign load_data = (forward_rs1_L_1 && (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101)) ? ((DLEN == 3'b001) ? {{24{1'b0}}, forward_rs1_L_1_datai[7:0]} :
                                                                                                          (DLEN == 3'b010) ? {{16{1'b0}}, forward_rs1_L_1_datai[15:0]} : forward_rs1_L_1_datai) :
                   (forward_rs1_L_2 && (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101)) ? ((DLEN == 3'b001) ? {{24{1'b0}}, forward_rs1_L_2_datai[7:0]} :
                                                                                                          (DLEN == 3'b010) ? {{16{1'b0}}, forward_rs1_L_2_datai[15:0]} : forward_rs1_L_2_datai) :
                   (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101) ? ((DLEN == 3'b001) ? {{24{1'b0}}, DATAI[7:0]} :
                                                                                     (DLEN == 3'b010) ? {{16{1'b0}}, DATAI[15:0]} : DATAI) :
                   forward_rs1_L_1 ? ((DLEN == 3'b001) ? {{24{forward_rs1_L_1_datai[7]}}, forward_rs1_L_1_datai[7:0]} :
                                      (DLEN == 3'b010) ? {{16{forward_rs1_L_1_datai[15]}}, forward_rs1_L_1_datai[15:0]} : forward_rs1_L_1_datai) :
                   forward_rs1_L_2 ? ((DLEN == 3'b001) ? {{24{forward_rs1_L_2_datai[7]}}, forward_rs1_L_2_datai[7:0]} :
                                      (DLEN == 3'b010) ? {{16{forward_rs1_L_2_datai[15]}}, forward_rs1_L_2_datai[15:0]} : forward_rs1_L_2_datai) :
                                     ((DLEN == 3'b001) ? {{24{DATAI[7]}}, DATAI[7:0]} :
                                      (DLEN == 3'b010) ? {{16{DATAI[15]}}, DATAI[15:0]} : DATAI);

always @(posedge CLK) begin
    if (!HLT) begin
        mem_wb_data <= EX_MEM_is_load ? load_data : 
                       EX_MEM_is_sys  ? EX_MEM_csr_data : 
                                        EX_MEM_alu;
        mem_wb_rd   <= EX_MEM_rd;
        mem_wb_alu  <= EX_MEM_alu;
        mem_wb_inst <= EX_MEM_inst;
        mem_wb_pc <= EX_MEM_pc;
    end
end    
endmodule
