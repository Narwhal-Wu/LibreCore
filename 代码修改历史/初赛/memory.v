//========================================
// 4. Memory阶段：数据访问
//========================================
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

module memory (
    input         CLK,
    input  [31:0] DATAI,
    input  [31:0] EX_MEM_pc,
    input  [31:0] EX_MEM_inst,
    input  [31:0] EX_MEM_alu,
    input  [31:0] EX_MEM_rs2,
    input  [4:0]  EX_MEM_rd,
    input         EX_MEM_is_load,
    input         EX_MEM_is_store,
    input         EX_MEM_is_sys,
    input  [31:0] EX_MEM_csr_data,
    input         forward_rs1_L_1,
    input         forward_rs1_L_2,
    input  [31:0] forward_rs1_L_1_datai,
    input  [31:0] forward_rs1_L_2_datai,

    output [31:0] MEM_WB_pc,
    output [31:0] MEM_WB_inst,
    output [31:0] MEM_WB_alu,
    output [4:0]  MEM_WB_rd,
    output [31:0] MEM_WB_data,   
    output [31:0] DADDR,
    output [31:0] DATAO,
    output [2:0]  DLEN,
    output        DRD,
    output        DWR,
    output [31:0] load_data
);

reg [31:0] mem_wb_pc;
reg [31:0] mem_wb_inst; 
reg [31:0] mem_wb_alu;
reg [4:0]  mem_wb_rd;
reg [31:0] mem_wb_data;   

assign MEM_WB_pc   = mem_wb_pc;
assign MEM_WB_inst = mem_wb_inst;
assign MEM_WB_alu  = mem_wb_alu;
assign MEM_WB_rd   = mem_wb_rd;
assign MEM_WB_data = mem_wb_data;
assign DADDR       = EX_MEM_alu;
assign DATAO       = EX_MEM_rs2;
assign DLEN        = (EX_MEM_is_load || EX_MEM_is_store) ? 
                     ((EX_MEM_inst[14:12] == 3'b000 || EX_MEM_inst[14:12] == 3'b100) ? 3'b001 : // LB
                      (EX_MEM_inst[14:12] == 3'b001 || EX_MEM_inst[14:12] == 3'b101) ? 3'b010 : // LH
                                                                                       3'b100   // LW
                                                                                   ) : 3'b000;
assign DRD         = EX_MEM_is_load;
assign DWR         = EX_MEM_is_store;

//根据读写数据前推情况确定读写的写回数据
assign load_data = (forward_rs1_L_1 && (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101)) ? 
                   ((DLEN == 3'b001) ? {{24{1'b0}}, forward_rs1_L_1_datai[7:0]} : (DLEN == 3'b010) ? {{16{1'b0}}, forward_rs1_L_1_datai[15:0]} : forward_rs1_L_1_datai) :
                   (forward_rs1_L_2 && (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101)) ? 
                   ((DLEN == 3'b001) ? {{24{1'b0}}, forward_rs1_L_2_datai[7:0]} : (DLEN == 3'b010) ? {{16{1'b0}}, forward_rs1_L_2_datai[15:0]} : forward_rs1_L_2_datai) :
                   (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101) ? ((DLEN == 3'b001) ? {{24{1'b0}}, DATAI[7:0]} :
                                                                                     (DLEN == 3'b010) ? {{16{1'b0}}, DATAI[15:0]} : DATAI) :
                   forward_rs1_L_1 ? ((DLEN == 3'b001) ? {{24{forward_rs1_L_1_datai[7]}}, forward_rs1_L_1_datai[7:0]} :
                                      (DLEN == 3'b010) ? {{16{forward_rs1_L_1_datai[15]}}, forward_rs1_L_1_datai[15:0]} : forward_rs1_L_1_datai) :
                   forward_rs1_L_2 ? ((DLEN == 3'b001) ? {{24{forward_rs1_L_2_datai[7]}}, forward_rs1_L_2_datai[7:0]} :
                                      (DLEN == 3'b010) ? {{16{forward_rs1_L_2_datai[15]}}, forward_rs1_L_2_datai[15:0]} : forward_rs1_L_2_datai) :
                                     ((DLEN == 3'b001) ? {{24{DATAI[7]}}, DATAI[7:0]} :
                                      (DLEN == 3'b010) ? {{16{DATAI[15]}}, DATAI[15:0]} : DATAI);

always @(posedge CLK) begin
    mem_wb_pc   <= EX_MEM_pc;
    mem_wb_inst <= EX_MEM_inst;
    mem_wb_alu  <= EX_MEM_alu;
    mem_wb_rd   <= EX_MEM_rd;
    mem_wb_data <= EX_MEM_is_load ? load_data : 
                   EX_MEM_is_sys  ? EX_MEM_csr_data : 
                                    EX_MEM_alu;
end    
endmodule
