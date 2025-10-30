//========================================
// 1. Fetch阶段：指令预取与PC管理
//========================================
`timescale 1ns / 1ps
`include "config.vh"

module fetch (
    input         CLK,
    input         RES,
    input         HLT,
    input         branch_taken,
    input         ID_EX_is_jalr,
    input         ID_EX_is_jal,
    input         ID_EX_is_branch,
    input  [31:0] IDATA,
    input  [31:0] PC_next,
    
    output [31:0] IADDR,
    output [31:0] PC,
    output [31:0] IF_ID_pc,
    output [31:0] IF_ID_inst
);

reg [31:0] pc; 
reg [31:0] pc_next;
reg [31:0] if_id_inst = 32'd0; 
reg [31:0] if_id_pc;  
reg [1:0]  count_1    = 2'b00;

assign PC         = pc;
assign IF_ID_pc   = if_id_pc;
assign IF_ID_inst = if_id_inst;
assign IADDR      = pc;

always @(posedge CLK) begin
    if (RES) begin
        pc         <= `__RESETPC__;
        if_id_inst <= 32'd0;
        if_id_pc   <= `__RESETPC__;
    end else if (!HLT) begin
        pc       <= PC_next;
        if_id_pc <= PC; 
        if (branch_taken) if_id_inst <= 32'h00000000;
        else if (!HLT)    if_id_inst <= IDATA;
    end    
end
endmodule