//========================================
// 2. Decode阶段：寄存器读取与指令译码
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

module decode (
    input         CLK,
    input         HLT,
    input         branch_taken,
    input  [31:0] IF_ID_pc,
    input  [31:0] IF_ID_inst,
    input  [31:0] rs1,
    input  [31:0] rs2,
    input  [4:0]  EX_MEM_rd,
    input  [4:0]  MEM_WB_rd,
    input  [31:0] ID_EX_alu,
    input  [31:0] EX_MEM_alu,
    input  [31:0] EX_MEM_inst,

    output [31:0] ID_EX_pc,
    output [31:0] ID_EX_inst,
    output [31:0] ID_EX_rs1,
    output [31:0] ID_EX_rs2,
    output [4:0]  ID_EX_rd,
    output [31:0] ID_EX_imm,
    output        ID_EX_is_jalr,
    output        ID_EX_is_jal,
    output        ID_EX_is_sys,
    output        ID_EX_is_cus,
    output        ID_EX_is_branch,
    output        IHLT
);

assign ID_EX_pc      = id_ex_pc;
assign ID_EX_inst    = id_ex_inst;
assign ID_EX_rs1     = id_ex_rs1;
assign ID_EX_rs2     = id_ex_rs2;
assign ID_EX_rd      = id_ex_rd;
assign ID_EX_imm     = id_ex_imm;
assign ID_EX_is_jalr = id_ex_is_jalr;
assign ID_EX_is_jal  = id_ex_is_jal;
assign ID_EX_is_sys  = id_ex_is_sys;
assign ID_EX_is_cus  = id_ex_is_cus;
assign ID_EX_is_branch  = id_ex_is_branch;
assign IHLT          = ihlt_buffer;


reg [31:0] id_ex_inst = 32'b0; 
reg [31:0] id_ex_pc;
reg [31:0] id_ex_rs1;    
reg [31:0] id_ex_rs2;   
reg [4:0]  id_ex_rd;    
reg [31:0] id_ex_imm;   
reg        id_ex_is_jalr;
reg        id_ex_is_jal;
reg        id_ex_is_sys;
reg        id_ex_is_cus;
reg        id_ex_is_branch;
reg [31:0] id_ex_rs1_1;  
reg [31:0] id_ex_rs2_1;
reg        ihlt;
reg        ihlt_buffer;
reg        ihlt_buffer2;

wire [31:0] ALL0  = 0;
wire [31:0] ALL1  = -1;

wire [31:0] imm_i_s = { IF_ID_inst[31] ? ALL1[31:12]:ALL0[31:12], IF_ID_inst[31:20] };
wire [31:0] imm_s_s = { IF_ID_inst[31] ? ALL1[31:12]:ALL0[31:12], IF_ID_inst[31:25],IF_ID_inst[11:7] };
wire [31:0] imm_b_s = { IF_ID_inst[31] ? ALL1[31:13]:ALL0[31:13], IF_ID_inst[31],IF_ID_inst[7],IF_ID_inst[30:25],IF_ID_inst[11:8],ALL0[0] };
wire [31:0] imm_u_s = { IF_ID_inst[31:12], ALL0[11:0] };
wire [31:0] imm_j_s = { IF_ID_inst[31] ? ALL1[31:21]:ALL0[31:21], IF_ID_inst[31], IF_ID_inst[19:12], IF_ID_inst[20], IF_ID_inst[30:21], ALL0[0] };

wire [31:0] imm_i_u = { ALL0[31:12], IF_ID_inst[31:20] };
wire [31:0] imm_s_u = { ALL0[31:12], IF_ID_inst[31:25],IF_ID_inst[11:7] };
wire [31:0] imm_b_u = { ALL0[31:13], IF_ID_inst[31],IF_ID_inst[7],IF_ID_inst[30:25],IF_ID_inst[11:8],ALL0[0] };
wire [31:0] imm_u_u = { IF_ID_inst[31:12], ALL0[11:0] };
wire [31:0] imm_j_u = { ALL0[31:21], IF_ID_inst[31], IF_ID_inst[19:12], IF_ID_inst[20], IF_ID_inst[30:21], ALL0[0] };

reg forward_rs1_EX;
reg forward_rs2_EX;
reg forward_rs1_MEM;
reg forward_rs2_MEM;

always @(*) begin
    if ((ID_EX_rd == IF_ID_inst[19:15]) && (ID_EX_rd != 0) && (ID_EX_inst[6:0] != `BCC) && (ID_EX_inst != 0)) forward_rs1_EX = 1;
    else                                                    forward_rs1_EX = 0;
    if ((ID_EX_rd == IF_ID_inst[24:20]) && (ID_EX_rd != 0) && (ID_EX_inst[6:0] != `BCC) && (ID_EX_inst != 0)) forward_rs2_EX = 1;
    else                                                    forward_rs2_EX = 0;
    if ((EX_MEM_rd == IF_ID_inst[19:15]) && (EX_MEM_rd != 0) && (EX_MEM_inst[6:0] != `BCC) && (EX_MEM_inst != 0)) forward_rs1_MEM = 1;
    else                                                      forward_rs1_MEM = 0;
    if ((EX_MEM_rd == IF_ID_inst[24:20]) && (EX_MEM_rd != 0) && (EX_MEM_inst[6:0] != `BCC) && (EX_MEM_inst != 0)) forward_rs2_MEM = 1;
    else                                                      forward_rs2_MEM = 0;
end

always @(*) begin
    if            (forward_rs1_MEM)    id_ex_rs1_1 = EX_MEM_alu;
    else if       (forward_rs1_EX)     id_ex_rs1_1 = ID_EX_alu;
    else                          id_ex_rs1_1 = rs1;       

    if             (forward_rs2_MEM) id_ex_rs2_1 = EX_MEM_alu;
    else if        (forward_rs2_EX)  id_ex_rs2_1 = ID_EX_alu;
    else                        id_ex_rs2_1 = rs2;       
    
    if ((ihlt_buffer || ihlt_buffer2 ) == 1)   ihlt = 0;
    else ihlt = ((IF_ID_inst[6:0] == `BCC) && ((IF_ID_inst[14:12] == 3'b000 && (id_ex_rs1_1 == id_ex_rs2_1))  ||  
                                           (IF_ID_inst[14:12] == 3'b001 && (id_ex_rs1_1 != id_ex_rs2_1))  || 
                                           (IF_ID_inst[14:12] == 3'b100 && ($signed(id_ex_rs1_1) <  $signed(id_ex_rs2_1)))  ||  
                                           (IF_ID_inst[14:12] == 3'b101 && ($signed(id_ex_rs1_1) >= $signed(id_ex_rs2_1)))  ||  
                                           (IF_ID_inst[14:12] == 3'b110 && (id_ex_rs1_1 <  id_ex_rs2_1)) || 
                                           (IF_ID_inst[14:12] == 3'b111 && (id_ex_rs1_1 >= id_ex_rs2_1))));
end

always @(posedge CLK) begin
    ihlt_buffer <= ihlt;
end
always @(posedge CLK) begin
    ihlt_buffer2 <= ihlt_buffer;
end

always @(posedge CLK) begin
    if (!HLT) begin
        id_ex_pc <= IF_ID_pc;

        if (branch_taken) id_ex_inst <= 32'h00000000;
        else              id_ex_inst <= IF_ID_inst;

        if           (forward_rs1_EX)  id_ex_rs1 <= ID_EX_alu;
        else if      (forward_rs1_MEM) id_ex_rs1 <= EX_MEM_alu;
        else                      id_ex_rs1 <= rs1;       // rs1

        if           (forward_rs2_EX)  id_ex_rs2 <= ID_EX_alu;
        else if      (forward_rs2_MEM) id_ex_rs2 <= EX_MEM_alu;
        else                      id_ex_rs2 <= rs2;       // rs2

        id_ex_rd <= IF_ID_inst[11:7];        // rd
        
        case (IF_ID_inst[6:0])
            `JALR:    id_ex_imm <= imm_i_s;

            `JAL:     id_ex_imm <= imm_j_s;

            `BCC:     id_ex_imm <= imm_b_s;

            `LUI:     id_ex_imm <= imm_u_s;

            `AUIPC:   id_ex_imm <= imm_u_s;

            `LCC:     id_ex_imm <= imm_i_s;

            `SCC:     id_ex_imm <= imm_s_s;

            default:  id_ex_imm <= imm_i_s;
        endcase
        
        id_ex_is_jalr <= (IF_ID_inst[6:0] == `JALR);
        id_ex_is_jal  <= (IF_ID_inst[6:0] == `JAL);
        id_ex_is_sys  <= (IF_ID_inst[6:0] == `SYS);
        id_ex_is_cus  <= (IF_ID_inst[6:0] == `CUS);
        id_ex_is_branch <= (IF_ID_inst[6:0] == `BCC); 
    end
end    
endmodule
