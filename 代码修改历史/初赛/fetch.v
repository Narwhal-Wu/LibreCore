//========================================
// 1. Fetch阶段：指令预取与PC管理
//========================================
module fetch (
    input         CLK,
    input         RES,
    input  [31:0] IDATA,
    input  [31:0] PC_next,
    input         branch_taken,
    
    output [31:0] PC,
    output [31:0] IADDR,
    output [31:0] IF_ID_pc,
    output [31:0] IF_ID_inst
);

reg [31:0] pc; 
reg [31:0] if_id_pc; 
reg [31:0] if_id_inst; 

assign PC         = pc;
assign IADDR      = pc;
assign IF_ID_pc   = if_id_pc;
assign IF_ID_inst = if_id_inst;

always @(posedge CLK) begin
    if (RES) begin          //当产生复位信号时，刷新所有pc和指令
        pc         <= 32'd0;
        if_id_pc   <= 32'd0;
        if_id_inst <= 32'd0;
    end 
    else begin              //每一个周期更新当前fetch阶段的pc和decode阶段的pc
        if_id_pc <= PC;     //当有跳转信号时，进行流水线的冲刷，否则fetch阶段正常取值
        pc       <= PC_next;
        if (branch_taken) if_id_inst <= 32'd0;
        else              if_id_inst <= IDATA;
    end    
end
endmodule