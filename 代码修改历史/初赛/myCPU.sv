//====================================================================================
//根据RV32I指令集，定义每一种opcode
//====================================================================================
`define LUI   7'b0110111
`define AUIPC 7'b0010111
`define JAL   7'b1101111
`define JALR  7'b1100111
`define BCC   7'b1100011
`define LCC   7'b0000011
`define SCC   7'b0100011
`define MCC   7'b0010011
`define RCC   7'b0110011
`define SYS   7'b1110011



//====================================================================================
module myCPU (
  //基本接口
  input             CLK,                 // 时钟信号
  input             RES,                 // 全局复位信号
  //指令接口
  input      [31:0] IDATA,               // 从instruction memory中传入的指令数据
  output     [31:0] IADDR,               // 传给instruction memory的指令地址
  //数据接口
  input      [31:0] DATAI,               // 从data memory中传入的输入数据
  output     [31:0] DATAO,               // 传给data memory的输出数据
  output     [31:0] DADDR,               // 传给data memory的数据地址
  output     [2:0]  DLEN,                // 数据长度（1/2/4字节）
  output            DRD,                 // 读使能
  output            DWR,                 // 写使能
  //trace测试接口
  output     [1:0]  DLENO,               //匹配trace的数据长度信号
  output            perip_wen,
  output            we,                  //匹配trace的写使能信号
  output            debug_wb_have_inst,  //匹配trace的需要检测信号
  output     [31:0] debug_wb_pc,         //匹配trace的需要检测的pc信号
  output            debug_wb_ena,        //匹配trace的需要检测的写使能信号
  output     [4:0]  debug_wb_reg,        //匹配trace的需要检测的写回地址信号
  output     [31:0] debug_wb_value       //匹配trace的需要检测的写回值信号
);

//====================================================================================
//匹配trace的数据长度信号的产生逻辑
//====================================================================================
assign DLENO = (DLEN == 3'b100) ? 2'b10 : 
               (DLEN == 3'b010) ? 2'b01 : 
               (DLEN == 3'b001) ? 2'b00 : 2'b11; 



//====================================================================================
//匹配trace的写使能信号的产生逻辑
//====================================================================================
logic [3:0] mem_we_internal;
always_comb begin
  if (DWR) begin
    case (DLEN)
      3'd0: mem_we_internal = 4'b0001 << DADDR[1:0];
      3'd1: mem_we_internal = 4'b0011 << {DADDR[1],1'b0};
      3'd2: mem_we_internal = 4'b1111;
      default: mem_we_internal = 4'b0000;
    endcase
  end 
  else begin
    mem_we_internal = 4'b0000;
  end
end
assign we = |mem_we_internal; // 对外的单 bit we：只要任何一个 byte enable 为 1，就产生写使能
assign perip_wen = DWR ? 1: 0;



//====================================================================================
//匹配trace的需要检测信号的产生逻辑
//====================================================================================
reg        inst;
reg        branch_taken_1,branch_taken_2,branch_taken_3,branch_taken_4;
reg [2:0]  count;
reg [31:0] pc;
reg        ena;
reg [4:0]  Reg;
reg [31:0] value;

assign debug_wb_have_inst = inst; 
assign debug_wb_pc        = pc;
assign debug_wb_ena       = ena;
assign debug_wb_reg       = Reg;
assign debug_wb_value     = value;
  
always @(posedge CLK) begin
  branch_taken_1 <= branch_taken;
  branch_taken_2 <= branch_taken_1;
  branch_taken_3 <= branch_taken_2;
  branch_taken_4 <= branch_taken_3;

  if      (RES)        count <= 0;
  else if (count != 5) count <= count + 1;

  if       (count == 4)             inst <= 1;
  else if ((count == 5) && 
           (branch_taken_3 == 0) && 
           (branch_taken_4 == 0))   inst <= 1;
  else                              inst <= 0;

  pc    <= MEM_WB_pc;
  ena   <= (MEM_WB_inst[6:0] == `LUI)   ||
           (MEM_WB_inst[6:0] == `AUIPC) ||
           (MEM_WB_inst[6:0] == `JAL)   ||
           (MEM_WB_inst[6:0] == `JALR)  ||
           (MEM_WB_inst[6:0] == `LCC)   ||
           (MEM_WB_inst[6:0] == `RCC)   ||
           (MEM_WB_inst[6:0] == `MCC)   ||
           (MEM_WB_inst[6:0] == `SYS); 
  Reg   <= MEM_WB_rd;
  value <= REGS_MEM_WB_rd;
end



//====================================================================================
// 1. Fetch阶段：指令预取与PC管理
//==================================================================================== 
wire [31:0] PC;             //当前PC——fetch阶段的pc
wire [31:0] PC_next;        //下一条PC
wire [31:0] IF_ID_pc;       //存入IF-ID流水线的pc——decode阶段的pc
wire [31:0] IF_ID_inst;     //存入IF-ID流水线的指令——decode阶段的指令
wire        branch_taken;   //跳转标识

fetch myfetch (
  .CLK             (CLK),
  .RES             (RES),
  .IDATA           (IDATA),
  .PC_next         (PC_next),
  .branch_taken    (branch_taken),

  .PC              (PC),
  .IADDR           (IADDR),
  .IF_ID_pc        (IF_ID_pc),
  .IF_ID_inst      (IF_ID_inst)
);



//====================================================================================
// 2. Decode阶段：寄存器读取与指令译码
//====================================================================================
wire [31:0] ID_EX_pc;       //存入ID-EX流水线的pc——decode阶段的pc
wire [31:0] ID_EX_inst;     //存入ID-EX流水线的指令——decode阶段的指令
wire [31:0] ID_EX_rs1;      //存入ID-EX流水线的rs1的值
wire [31:0] ID_EX_rs2;      //存入ID-EX流水线的rs2的值
wire [ 4:0] ID_EX_rd;       //存入ID-EX流水线的rd的地址
wire [31:0] ID_EX_imm;      //存入ID-EX流水线的立即数
wire [31:0] ID_EX_alu;      //返回ID-EX流水线的alu模块计算结果——数据前推需要
wire        ID_EX_is_jalr;  //存入ID-EX流水线的JALR标志
wire        ID_EX_is_jal;   //存入ID-EX流水线的JAL标志
wire        ID_EX_is_sys;   //存入ID-EX流水线的SYS标志
wire        ID_EX_is_branch;//存入ID-EX流水线的跳转标志
wire [31:0] load_data;

reg  [31:0] REGS [31:0];    //cpu内部的file register
integer i;
initial for (i = 0; i != 32; i = i + 1) REGS[i] = 0;//初始化

reg  [31:0] rs1;
reg  [31:0] rs2;
always @(*) begin
  rs1 = REGS[IF_ID_inst[19:15]];
  rs2 = REGS[IF_ID_inst[24:20]];
end                             //取出当前指令对应的rs1和rs2的地址

decode mydecode (
  .CLK            (CLK),
  .IF_ID_pc       (IF_ID_pc),
  .IF_ID_inst     (IF_ID_inst),
  .rs1            (rs1),
  .rs2            (rs2),
  .ID_EX_alu      (ID_EX_alu),
  .EX_MEM_rd      (EX_MEM_rd),
  .EX_MEM_alu     (EX_MEM_alu),
  .EX_MEM_inst    (EX_MEM_inst),
  .MEM_WB_rd      (MEM_WB_rd),
  .branch_taken   (branch_taken),
  .load_data      (load_data),
  
  .ID_EX_pc       (ID_EX_pc),
  .ID_EX_inst     (ID_EX_inst),
  .ID_EX_rs1      (ID_EX_rs1),
  .ID_EX_rs2      (ID_EX_rs2),
  .ID_EX_rd       (ID_EX_rd),
  .ID_EX_imm      (ID_EX_imm),
  .ID_EX_is_jalr  (ID_EX_is_jalr),
  .ID_EX_is_jal   (ID_EX_is_jal),
  .ID_EX_is_sys   (ID_EX_is_sys),
  .ID_EX_is_branch(ID_EX_is_branch)
);



//====================================================================================
// 3. Execute阶段：运算与跳转
//====================================================================================
wire [31:0] EX_MEM_pc;            //存入EX-MEM流水线的pc——execute阶段的pc
wire [31:0] EX_MEM_inst;          //存入EX-MEM流水线的指令——execute阶段的指令
wire [31:0] EX_MEM_alu;           //存入EX-MEM流水线的alu模块计算结果
wire [31:0] EX_MEM_rs2;           //存入EX-MEM流水线的rs2的值
wire [ 4:0] EX_MEM_rd;            //存入EX-MEM流水线的rd的地址
wire        EX_MEM_is_load;       //存入EX-MEM流水线的读取标志
wire        EX_MEM_is_store;      //存入EX-MEM流水线的写入标志
wire        EX_MEM_is_jalr;       //存入EX-MEM流水线的JALR标志
wire        EX_MEM_is_jal;        //存入EX-MEM流水线的JAL标志
wire        EX_MEM_is_sys;        //存入EX-MEM流水线的SYS标志
wire [31:0] EX_MEM_csr_data;      //存入EX-MEM流水线的系统指令的值
wire        branch_cond_taken;    //存入EX-MEM流水线的b型指令判断成功标志
wire        forward_rs1_L_1;      //数据前推信号-与读写有关的情况-一级标志
wire        forward_rs1_L_2;      //数据前推信号-与读写有关的情况-二级标志
wire [31:0] forward_rs1_L_1_datai;//数据前推信号-与读写有关的情况-一级数据
wire [31:0] forward_rs1_L_2_datai;//数据前推信号-与读写有关的情况-二级数据

execute myexecute (
  .CLK                   (CLK),
  .RES                   (RES),
  .ID_EX_pc              (ID_EX_pc),
  .ID_EX_inst            (ID_EX_inst),
  .ID_EX_rs1             (ID_EX_rs1),
  .ID_EX_rs2             (ID_EX_rs2),
  .ID_EX_rd              (ID_EX_rd),
  .ID_EX_imm             (ID_EX_imm),
  .ID_EX_is_jal          (ID_EX_is_jal),
  .ID_EX_is_jalr         (ID_EX_is_jalr),
  .ID_EX_is_sys          (ID_EX_is_sys),
  .ID_EX_is_branch       (ID_EX_is_branch),
  .PC                    (PC),
  .DATAI                 (DATAI),
  .MEM_WB_inst           (MEM_WB_inst),

  .ID_EX_alu             (ID_EX_alu),
  .EX_MEM_pc             (EX_MEM_pc),
  .EX_MEM_inst           (EX_MEM_inst),
  .EX_MEM_alu            (EX_MEM_alu),
  .EX_MEM_rs2            (EX_MEM_rs2),
  .EX_MEM_rd             (EX_MEM_rd),
  .EX_MEM_is_load        (EX_MEM_is_load),
  .EX_MEM_is_store       (EX_MEM_is_store),
  .EX_MEM_is_jalr        (EX_MEM_is_jalr),
  .EX_MEM_is_jal         (EX_MEM_is_jal),
  .EX_MEM_is_sys         (EX_MEM_is_sys),
  .EX_MEM_csr_data       (EX_MEM_csr_data),
  .PC_next               (PC_next),
  .branch_taken          (branch_taken),
  .branch_cond_taken     (branch_cond_taken),
  .forward_rs1_L_1       (forward_rs1_L_1),
  .forward_rs1_L_2       (forward_rs1_L_2),
  .forward_rs1_L_1_datai (forward_rs1_L_1_datai),
  .forward_rs1_L_2_datai (forward_rs1_L_2_datai)
);



//====================================================================================
// 4. Memory阶段：数据访问
//====================================================================================
wire [31:0] MEM_WB_pc;  //存入MEM-WB流水线的pc——memory阶段的pc
wire [31:0] MEM_WB_inst;//存入MEM-WB流水线的指令——memory阶段的指令
wire [31:0] MEM_WB_alu; //存入MEM-WB流水线的alu模块计算结果
wire [ 4:0] MEM_WB_rd;  //存入MEM-WB流水线的rd的地址
wire [31:0] MEM_WB_data;//存入MEM-WB流水线的写回数据

memory mymemory (
  .CLK                   (CLK),
  .DATAI                 (DATAI),
  .EX_MEM_pc             (EX_MEM_pc),
  .EX_MEM_inst           (EX_MEM_inst),
  .EX_MEM_alu            (EX_MEM_alu),
  .EX_MEM_rs2            (EX_MEM_rs2),
  .EX_MEM_rd             (EX_MEM_rd),
  .EX_MEM_is_load        (EX_MEM_is_load),
  .EX_MEM_is_store       (EX_MEM_is_store),
  .EX_MEM_is_sys         (EX_MEM_is_sys),
  .EX_MEM_csr_data       (EX_MEM_csr_data),
  .forward_rs1_L_1       (forward_rs1_L_1),
  .forward_rs1_L_2       (forward_rs1_L_2),
  .forward_rs1_L_1_datai (forward_rs1_L_1_datai),
  .forward_rs1_L_2_datai (forward_rs1_L_2_datai),

  .MEM_WB_pc             (MEM_WB_pc),
  .MEM_WB_inst           (MEM_WB_inst),
  .MEM_WB_alu            (MEM_WB_alu),
  .MEM_WB_rd             (MEM_WB_rd),
  .MEM_WB_data           (MEM_WB_data),
  .DADDR                 (DADDR),
  .DATAO                 (DATAO),
  .DLEN                  (DLEN),
  .DRD                   (DRD),
  .DWR                   (DWR),
  .load_data             (load_data)
);



//====================================================================================
// 5. Writeback阶段：寄存器写回
//====================================================================================
wire [31:0] REGS_MEM_WB_rd;

writeback mywriteback (
  .CLK           (CLK),
  .RES           (RES),
  .MEM_WB_pc     (MEM_WB_pc),
  .MEM_WB_inst   (MEM_WB_inst),
  .MEM_WB_alu    (MEM_WB_alu),
  .MEM_WB_rd     (MEM_WB_rd),
  .MEM_WB_data   (MEM_WB_data),

  .REGS_MEM_WB_rd(REGS_MEM_WB_rd)
);

//根据指令写回file register
always @(*) begin
  if (!RES && MEM_WB_rd != 0) begin
    case (MEM_WB_inst[6:0])
      `LUI:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `AUIPC: REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `JAL:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `JALR:  REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `LCC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `RCC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `MCC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
    endcase
  end
end
endmodule