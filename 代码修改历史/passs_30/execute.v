//========================================
// 3. Execute阶段：运算与跳转
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

module execute (
    input         CLK,
    input         RES,
    input         HLT,
    input  [31:0] ID_EX_inst,
    input  [31:0] ID_EX_pc,
    input  [31:0] ID_EX_rs1,
    input  [31:0] ID_EX_rs2,
    input  [4:0]  ID_EX_rd,
    input  [31:0] REGS_ID_EX_rd,
    input  [31:0] ID_EX_imm,
    input         ID_EX_is_cus,
    input         ID_EX_is_jal,
    input         ID_EX_is_jalr,
    input         ID_EX_is_sys,
    input         ID_EX_is_branch,
    input  [31:0] PC,

    output [31:0] EX_MEM_inst,
    output [31:0] EX_MEM_pc,
    output [31:0] EX_MEM_alu,
    output [31:0] ID_EX_alu,
    output [31:0] EX_MEM_rs2,
    output [4:0]  EX_MEM_rd,
    output        EX_MEM_is_load,
    output        EX_MEM_is_store,
    output        EX_MEM_is_jalr,
    output        EX_MEM_is_jal,
    output        EX_MEM_is_sys,
    output [31:0] EX_MEM_csr_data,
    output [31:0] PC_next,
    output        branch_taken,
    output        branch_cond_taken
);
    
reg [31:0] ex_mem_inst = 0;    // EX-MEM流水线寄存器
reg [31:0] ex_mem_alu;    // 存储数据
reg [31:0] ex_mem_rs2;    
reg [4:0]  ex_mem_rd;
reg [31:0] ex_mem_pc;
reg        ex_mem_is_load;
reg        ex_mem_is_store;
reg        ex_mem_is_jalr;
reg        ex_mem_is_jal;
reg [31:0] ex_mem_csr_data;
reg [31:0] pc_next;

assign EX_MEM_inst = ex_mem_inst;
assign EX_MEM_pc = ex_mem_pc;
assign EX_MEM_alu = ex_mem_alu;
assign ID_EX_alu = alu_result;
assign EX_MEM_rs2 = ex_mem_rs2;
assign EX_MEM_rd = ex_mem_rd;
assign EX_MEM_is_load = ex_mem_is_load;
assign EX_MEM_is_store = ex_mem_is_store;
assign EX_MEM_is_jalr = ex_mem_is_jalr;
assign EX_MEM_is_jal = ex_mem_is_jal;
assign EX_MEM_is_sys = ID_EX_is_sys;
assign EX_MEM_csr_data = ex_mem_csr_data;
assign PC_next = pc_next;

// CSR寄存�?
reg [31:0] MSTATUS = 0;
reg [31:0] MEPC    = 0;
reg [31:0] MTVEC   = 0;

// ALU操作
wire [31:0] alu_in1 = ID_EX_rs1;
wire [31:0] alu_in2 = (ID_EX_inst[6:0] == `MCC   || 
                       ID_EX_inst[6:0] == `LUI   || 
                       ID_EX_inst[6:0] == `AUIPC || 
                       ID_EX_inst[6:0] == `SCC   || 
                       ID_EX_inst[6:0] == `LCC   ||
                       ID_EX_inst[6:0] == `JALR) ? ID_EX_imm : ID_EX_rs2;
reg [31:0] alu_result;
wire is_sub = ((ID_EX_inst[31:25] == 7'b0100000)&&(ID_EX_inst[6:0] == `RCC));

always @(*) begin
    if (ID_EX_inst != 0) begin
        case (ID_EX_inst[14:12])
            3'b000: alu_result = is_sub ? (alu_in1 - alu_in2) : (alu_in1 + alu_in2);
            3'b001: alu_result = alu_in1 << alu_in2[4:0];
            3'b010: alu_result = $signed(alu_in1) < $signed(alu_in2);
            3'b011: alu_result = alu_in1 < alu_in2;
            3'b100: alu_result = alu_in1 ^ alu_in2;
            3'b101: alu_result = ID_EX_inst[30] ? ({{32{alu_in1[31]}}, alu_in1} >> alu_in2[4:0]) : (alu_in1 >> alu_in2[4:0]);  // SRA (inst[30]=1) / SRL (inst[30]=0)
            3'b110: alu_result = alu_in1 | alu_in2;
            3'b111: alu_result = alu_in1 & alu_in2;
        endcase
    end
    if (ID_EX_inst[6:0] == `LUI) alu_result = alu_in2;
    if (ID_EX_inst[6:0] == `AUIPC) alu_result = ID_EX_pc + alu_in2;
    if ((ID_EX_inst[6:0] == `SCC) || (ID_EX_inst[6:0] == `LCC)) alu_result = alu_in1 + alu_in2;
end

// JALR处理
wire [31:0] jalr_target = (alu_in1 + ID_EX_imm); //& ~32'h1;//清除�?低位

// 系统指令处理，CSR不完�?
always @(*) begin
    if (ID_EX_is_sys) begin
        case (ID_EX_inst[31:20])
            12'h302: ex_mem_csr_data = MEPC; // mret
            default: ex_mem_csr_data = 0;
        endcase
    end else begin
        ex_mem_csr_data = 0;
    end
end

// 自定义指令（乘累加）
wire [31:0] cus_result = ID_EX_rs1 * ID_EX_rs2 + REGS_ID_EX_rd;

always @(posedge CLK) begin
    if (!HLT) begin
        ex_mem_inst     <= ID_EX_inst;
        if (ID_EX_is_cus) ex_mem_alu  <= cus_result;
        else ex_mem_alu  <= alu_result;
        ex_mem_rs2      <= ID_EX_rs2;
        ex_mem_rd       <= ID_EX_rd;
        ex_mem_pc       <= ID_EX_pc;
        ex_mem_is_load  <= (ID_EX_inst[6:0] == `LCC);
        ex_mem_is_store <= (ID_EX_inst[6:0] == `SCC);
        ex_mem_is_jalr  <= ID_EX_is_jalr;
        ex_mem_is_jal   <= ID_EX_is_jal;
    end
end

// 分支预测：B类指令：条件跳转
// 判断是否是分支指�?
wire is_branch = ID_EX_is_branch;  // B-type

// 分支条件判断
wire beq_taken  = (ID_EX_rs1 == ID_EX_rs2);
wire bne_taken  = (ID_EX_rs1 != ID_EX_rs2);
wire blt_taken  = ($signed(ID_EX_rs1) <  $signed(ID_EX_rs2));
wire bge_taken  = ($signed(ID_EX_rs1) >= $signed(ID_EX_rs2));
wire bltu_taken = (ID_EX_rs1 <  ID_EX_rs2);
wire bgeu_taken = (ID_EX_rs1 >= ID_EX_rs2);

// 综合分支跳转条件
assign branch_cond_taken = 
       ((ID_EX_inst != 0) &&
       ((ID_EX_inst[14:12] == 3'b000 && beq_taken)  ||  
        (ID_EX_inst[14:12] == 3'b001 && bne_taken)  || 
        (ID_EX_inst[14:12] == 3'b100 && blt_taken)  ||  
        (ID_EX_inst[14:12] == 3'b101 && bge_taken)  ||  
        (ID_EX_inst[14:12] == 3'b110 && bltu_taken) || 
        (ID_EX_inst[14:12] == 3'b111 && bgeu_taken)));   

// 是否跳转的�?�判断：包括 JALR、JAL 和分支指�?
assign branch_taken = (ID_EX_is_jalr || ID_EX_is_jal) || 
                   (is_branch && branch_cond_taken);

// 跳转目标地址选择
wire [31:0] branch_target = ID_EX_is_jalr ? jalr_target : (ID_EX_pc + ID_EX_imm);

// 更新 PC 的�?�辑
always @(*) begin
    if(RES) pc_next=32'h8000_0004;
    else pc_next = branch_taken ? branch_target : PC + 4;
end
endmodule