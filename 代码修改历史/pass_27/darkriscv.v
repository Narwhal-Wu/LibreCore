`timescale 1ns / 1ps
`include "config.vh"

// RISC-V 操作码定义
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
`define CUS     7'b0001011  // 自定义操作码

module darkriscv #(
    parameter CPTR = 0
)(
    input         CLK,    // 主时钟
    input         RES,    // 全局复位
    input         HLT,    // 流水线暂停
    // 中断接口
`ifdef __INTERRUPT__
    input         IRQ,    // 中断请求
`endif
    // 指令接口
    input  [31:0] IDATA,  // 指令数据
    output [31:0] IADDR,  // 指令地址
    // 数据接口
    input  [31:0] DATAI,  // 内存输入数据
    output [31:0] DATAO,  // 内存输出数据
    output [31:0] DADDR,  // 数据地址
    output [2:0]  DLEN,   // 数据长度（1/2/4字节）
    output        DRW,    // 读写方向
    output        DRD,    // 读使能
    output        DWR,    // 写使能
    output        DAS,    // 地址有效
    input         BERR,   // 总线错误
`ifdef SIMULATION
    input             ESIMREQ,  // end simulation req
    output reg        ESIMACK = 0,  // end simulation ack
`endif 
    // 调试接口
    output [3:0]  DEBUG
);

//========================================
// 1. Fetch阶段：指令预取与PC管理
//======================================== 
wire [31:0] PC_next;      // 下一条PC
wire [31:0] PC;           // 当前PC
wire [31:0] IF_ID_inst;   // IF-ID流水线寄存器（存储指令）
wire [31:0] IF_ID_pc;     // 保存当前PC�?
wire        branch_taken;

fetch myfetch(
    .CLK          (CLK),
    .RES          (RES),
    .HLT          (HLT),
    .branch_taken (branch_taken),
    .ID_EX_is_jalr (ID_EX_is_jalr),
    .ID_EX_is_jal (ID_EX_is_jal),
    .ID_EX_is_branch (ID_EX_is_branch),
    .IDATA        (IDATA),
    .PC_next      (PC_next),
    
    .IADDR        (IADDR),
    .PC           (PC),
    .IF_ID_pc     (IF_ID_pc),
    .IF_ID_inst   (IF_ID_inst)
);

//========================================
// 2. Decode阶段：寄存器读取与指令译�?
//========================================
wire [31:0] ID_EX_inst;   // ID-EX流水线寄存器
wire [31:0] ID_EX_pc;     // 传�?�PC�?
wire [31:0] ID_EX_rs1;    // 源寄存器1
wire [31:0] ID_EX_rs2;    // 源寄存器2
wire [4:0]  ID_EX_rd;     // 目标寄存�?
wire [31:0] ID_EX_imm;    // 立即�?
wire        ID_EX_is_jalr;// JALR标志
wire        ID_EX_is_jal;// JALR标志
wire        ID_EX_is_sys; // SYS标志
wire        ID_EX_is_cus; // CUS标志
wire        ID_EX_is_branch;

reg [31:0] REGS [0:`RLEN-1];

wire [31:0] REGS0 = REGS[0];
wire [31:0] REGS1 = REGS[1];
wire [31:0] REGS2 = REGS[2];
wire [31:0] REGS3 = REGS[3];
wire [31:0] REGS4 = REGS[4];
wire [31:0] REGS5 = REGS[5];
wire [31:0] REGS6 = REGS[6];
wire [31:0] REGS7 = REGS[7];
wire [31:0] REGS8 = REGS[8];
wire [31:0] REGS9 = REGS[9];
wire [31:0] REGS10 = REGS[10];
wire [31:0] REGS11 = REGS[11];
wire [31:0] REGS12 = REGS[12];
wire [31:0] REGS13 = REGS[13];
wire [31:0] REGS14 = REGS[14];
wire [31:0] REGS15 = REGS[15];
wire [31:0] REGS16 = REGS[16];
wire [31:0] REGS17 = REGS[17];
wire [31:0] REGS18 = REGS[18];
wire [31:0] REGS19 = REGS[19];
wire [31:0] REGS20 = REGS[20];
wire [31:0] REGS21 = REGS[21];
wire [31:0] REGS22 = REGS[22];
wire [31:0] REGS23 = REGS[23];
wire [31:0] REGS24 = REGS[24];
wire [31:0] REGS25 = REGS[25];
wire [31:0] REGS26 = REGS[26];
wire [31:0] REGS27 = REGS[27];
wire [31:0] REGS28 = REGS[28];
wire [31:0] REGS29 = REGS[29];
wire [31:0] REGS30 = REGS[30];
wire [31:0] REGS31 = REGS[31];


reg [31:0] rs1;
reg [31:0] rs2;
always @(*) begin
    rs1 = REGS[IF_ID_inst[19:15]];
    rs2 = REGS[IF_ID_inst[24:20]];
end

integer i;
initial for(i=0;i!=`RLEN;i=i+1) REGS[i] = 0;

decode mydecode(
    .CLK           (CLK),
    .HLT           (HLT),
    .branch_taken  (branch_taken),
    .IF_ID_pc      (IF_ID_pc),
    .IF_ID_inst    (IF_ID_inst),
    .rs1           (rs1),
    .rs2           (rs2),
    .EX_MEM_rd     (EX_MEM_rd),
    .MEM_WB_rd     (MEM_WB_rd),
    .ID_EX_alu     (ID_EX_alu),
    .EX_MEM_alu    (EX_MEM_alu),
    
    .ID_EX_pc      (ID_EX_pc),
    .ID_EX_inst    (ID_EX_inst),
    .ID_EX_rs1     (ID_EX_rs1),
    .ID_EX_rs2     (ID_EX_rs2),
    .ID_EX_rd      (ID_EX_rd),
    .ID_EX_imm     (ID_EX_imm),
    .ID_EX_is_jalr (ID_EX_is_jalr),
    .ID_EX_is_jal  (ID_EX_is_jal),
    .ID_EX_is_sys  (ID_EX_is_sys),
    .ID_EX_is_cus  (ID_EX_is_cus),
    .ID_EX_is_branch  (ID_EX_is_branch)
);

//========================================
// 3. Execute阶段：运算与跳转
//========================================
wire [31:0] EX_MEM_inst;    // EX-MEM流水线寄存器
wire [31:0] EX_MEM_alu;    // 存储数据
wire [31:0] ID_EX_alu;
wire [31:0] EX_MEM_rs2;    
wire [4:0]  EX_MEM_rd;
wire [31:0] REGS_ID_EX_rd = REGS[ID_EX_rd];
wire [31:0] EX_MEM_pc;
wire        EX_MEM_is_load;
wire        EX_MEM_is_store;
wire        EX_MEM_is_jalr;
wire        EX_MEM_is_jal;
wire        EX_MEM_is_sys;
wire [31:0] EX_MEM_csr_data;

execute myexecute(
    .CLK             (CLK),
    .RES             (RES),
    .ID_EX_inst      (ID_EX_inst),
    .ID_EX_pc        (ID_EX_pc),
    .ID_EX_rs1       (ID_EX_rs1),
    .ID_EX_rs2       (ID_EX_rs2),
    .ID_EX_rd        (ID_EX_rd),
    .REGS_ID_EX_rd   (REGS_ID_EX_rd),
    .ID_EX_imm       (ID_EX_imm),
    .ID_EX_is_cus    (ID_EX_is_cus),
    .ID_EX_is_jal    (ID_EX_is_jal),
    .ID_EX_is_jalr   (ID_EX_is_jalr),
    .ID_EX_is_sys    (ID_EX_is_sys),
    .ID_EX_is_branch    (ID_EX_is_branch),
    .PC              (PC),

    .EX_MEM_inst     (EX_MEM_inst),
    .EX_MEM_pc       (EX_MEM_pc),
    .EX_MEM_alu      (EX_MEM_alu),
    .ID_EX_alu       (ID_EX_alu),
    .EX_MEM_rs2      (EX_MEM_rs2),
    .EX_MEM_rd       (EX_MEM_rd),
    .EX_MEM_is_load  (EX_MEM_is_load),
    .EX_MEM_is_store (EX_MEM_is_store),
    .EX_MEM_is_jalr  (EX_MEM_is_jalr),
    .EX_MEM_is_jal   (EX_MEM_is_jal),
    .EX_MEM_is_sys   (EX_MEM_is_sys),
    .EX_MEM_csr_data (EX_MEM_csr_data),
    .PC_next         (PC_next),
    .branch_taken    (branch_taken)
);

//========================================
// 4. Memory阶段：数据访�?
//========================================
wire [31:0] MEM_WB_inst;    // MEM-WB流水线寄存器
wire [31:0] MEM_WB_data;   
wire [4:0]  MEM_WB_rd;
wire [31:0] MEM_WB_alu;
wire [31:0] MEM_WB_pc;

memory mymemory(
    .CLK             (CLK),
    .DATAI           (DATAI),
    .EX_MEM_pc       (EX_MEM_pc),
    .EX_MEM_inst     (EX_MEM_inst),
    .EX_MEM_alu      (EX_MEM_alu),
    .EX_MEM_rd       (EX_MEM_rd),
    .EX_MEM_rs2      (EX_MEM_rs2),
    .EX_MEM_is_load  (EX_MEM_is_load),
    .EX_MEM_is_store (EX_MEM_is_store),
    .EX_MEM_is_sys   (EX_MEM_is_sys),
    .EX_MEM_csr_data (EX_MEM_csr_data),

    .MEM_WB_inst     (MEM_WB_inst),
    .MEM_WB_data     (MEM_WB_data),   
    .MEM_WB_rd       (MEM_WB_rd),
    .MEM_WB_alu      (MEM_WB_alu),
    .MEM_WB_pc       (MEM_WB_pc),
    .DADDR           (DADDR),
    .DATAO           (DATAO),
    .DLEN            (DLEN),
    .DRW             (DRW),
    .DRD             (DRD),
    .DWR             (DWR),
    .DAS             (DAS)
);

//========================================
// 5. Writeback阶段：寄存器写回
//========================================
wire [31:0] REGS_MEM_WB_rd;

writeback mywriteback(
    .CLK            (CLK),
    .RES            (RES),
    .HLT            (HLT),
    .MEM_WB_pc      (MEM_WB_pc),
    .EX_MEM_pc      (EX_MEM_pc),
    .MEM_WB_inst    (MEM_WB_inst),
    .MEM_WB_alu     (MEM_WB_alu),
    .MEM_WB_rd      (MEM_WB_rd),
    .MEM_WB_data    (MEM_WB_data),

    .REGS_MEM_WB_rd (REGS_MEM_WB_rd)
);

always @(*) begin
    if (!RES && !HLT && MEM_WB_rd != 0) begin
        case (MEM_WB_inst[6:0])
            `LUI:     REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
            `AUIPC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
            `JAL:     REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
            `JALR:    REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
            `LCC:     REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
            `RCC:     REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
            `MCC:     REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
        endcase
    end
end

endmodule



