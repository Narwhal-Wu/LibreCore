# FPGA创新设计大赛 AMD赛道 - 自主选题初级赛道设计报告

**竞赛名称：** 2025年全国大学生嵌入式芯片与系统设计竞赛——FPGA创新设计大赛 AMD赛道
**赛道类型：** 自主选题 - 初级赛道
**项目名称：** [请填写项目名称]
**提交日期：** [YYYY-MM-DD]

---

## 摘要

[300-500字的项目摘要，包括：研究背景、技术方案、实验结果和结论]

**关键词：** [3-5个关键词]

## 1. 项目概述

### 1.1 选题背景与意义

[详细描述选题的背景、现实意义和应用价值]

### 1.2 项目目标

**功能目标：**

- [描述项目要实现的主要功能]
- [描述项目的技术指标要求]

**学习目标：**

- [描述通过本项目要掌握的FPGA设计技能]
- [描述要提升的工程实践能力]

### 1.3 技术规格

- **目标器件：** [选用的AMD FPGA/ZYNQ器件型号]
- **开发环境：** [Vivado/Vitis，如Vivado 2024.1]
- **编程语言：** [Verilog/VHDL/HLS C++]
- **验证平台：** [仿真环境和硬件平台]
- **应用领域：** [如数字信号处理、图像处理、通信等]

---

## 2. 需求分析与系统设计

### 2.1 功能需求分析

[详细分析项目的功能需求]

实现能够与AHB-Lite协议适配的访存模块包括用于vivado bram转换AHB-Lite协议的bram_controller,跟简易的AHB_arbiter用于总线仲裁，使用AMBA总线协议提升项目模块的可复用性让模块能够更好地进行扩展跟适配不同模块。
**核心功能模块：**

1. **功能模块1：** [详细描述]
2. **功能模块2：** [详细描述]
3. **AHB-Lite存储系统：** 
     - 地址译码和数据路由
     - 支持字节、半字、字访问
     - 传输仲裁和控制

**性能需求：**

- 工作频率：[MHz]
- 数据吞吐率：支持AHB pipeline能够实现连续读写
- 延迟要求：单时钟周期存储读写延迟，符合AHB接口标准
- 精度要求：[具体指标]

### 2.2 系统架构设计

#### 2.2.1 顶层架构

[描述整体系统架构，重点展示FPGA基本设计能力]

```
[系统架构图]
┌─────────────────────────────────────────────────────┐
│                    顶层模块                          │
├─────────────┬─────────────┬─────────────┬─────────────┤
│  输入接口    │   控制逻辑   │   数据处理   │  输出接口    │
│  模块       │   模块      │   模块      │   模块      │
└─────────────┴─────────────┴─────────────┴─────────────┘
```

#### 2.2.2 状态机设计

在AHB_bram_controller模块使用状态机对当前周期跟前一周期主机发起的传输事务进行标记，反映当前控制模块数据传输状态，实现当AHB流水线传输当读请求紧随着写请求发起，BRAM不能及时处理数据，在不产生等待的情况下符合AHB协议正确读写数据。具体而言，代码显式展现的状态有IDLE，WRITE，READ跟FREE。而在实际的控制中基于前一时钟周期跟当前状态进行控制，实际上实现了IDLE，WRITE，READ，WRITE -> READ(BUSY)，READ -> WRITE(FREE)，NO TASK(FREE)六个状态。这么做的原因是标准的状态机需要在状态转换信号的下一个时钟周期进行状态转换，而这样不能满足当作为状态转换信号的控制信号到来就直接对其进行响应，进行对应控制的设计要求，因此采用这种设计逻辑。

**状态转换图：**

![AHB_bram_controller状态机](figure/fsm_AHB.svg)

**状态说明：**

注：带有【等效态｜非真实状态】标注的条目为组合等效表达，用于说明行为关系，不对应寄存器化的实际状态值。

- IDLE：代表当前HRESETn为低，存储读写模块在被重置，没有在工作状态
- WRITE：代表当前主机发起一个写传输请求，在等效状态中用于判断下一步状态跳转
- READ：代表当前主机发起一个读传输请求，在等效状态中用于判断下一步状态跳转
- FREE：代表读写模块在工作状态，主机没有发起传输任务。代表存储读写模块在工作且主机没有发起读写传输请求，如果之前有由主机发起写传输请求之后连续发起读传输请求产生的未决事务写传输，此时能够在读传输的数据阶段进行写操作，完成之前的写传输，释放寄存器。
- 【等效态｜非真实状态】WRITE → READ（BUSY）：代表主机发起写传输请求之后连续发起读传输请求，由于BRAM读操作需要一个时钟周期而AHB接口协议读操作同样也是一个时钟周期，为了不拉低HREADYOUT产生等待减慢主机速度，这时候控制BRAM先进行读操作而将当前写操作存入寄存器进行缓冲，等BRAM空闲再发起当前写操作。而在等待BRAM有空闲能够进行之前的写操作的过程中，如果再次有读操作访问了之前写操作对应的地址会基于写操作的偏移跟写数据跟读出数据组合输出读数据实现前推避免读数据错误。
- 【等效态｜非真实状态】READ → WRITE（FREE）：代表主机发起读传输请求之后连续发起写传输请求，由于读传输请求在控制阶段已经被BRAM处理完在数据阶段输出数据，而写传输在控制阶段不需要对BRAM进行操作。因此如果之前有由主机发起写传输请求之后连续发起读传输请求产生的未决事务写传输，此时能够在读传输的数据阶段进行写操作，完成之前的写传输，释放寄存器。
- 【等效态｜非真实状态】NO TASK（FREE）：与实际状态 FREE 为同一状态

**展示外围模块AHB_bram_controller状态机设计而不是核心控制逻辑的原因：**
cpu部分采用5级流水线架构代码内部没有标准的状态机部分

#### 2.2.3 时序设计

对于cpu跟外设BRAM的数据读写时序，参照AMBA AHB协议进行实现，将数据传输分成控制阶段跟数据阶段，实现在控制阶段下一个时钟周期进行数据传输，每个传输需要2个时钟周期，但能够通过流水线形式运行这样每个周期都有控制信号跟数据传输。

### 2.3 接口设计

采用AMBA AHB接口协议进行设计，但未对所有信号进行处理，因当前系统只需要满足APB功能使用流水线传输就能满足cpu数据传输要求，节省资源。但保留AHB接口准备下一步增加burst跟cache部分提升项目速度。

**输入接口规格：**

- 数据位宽：[位数]
- 时钟域：[时钟频率]
- 控制信号：[信号列表]

**输出接口规格：**

- 数据位宽：[位数]
- 时序关系：[描述]
- 状态指示：[信号说明]

---

## 3. 详细设计与实现

### 3.1 核心算法设计

[描述项目中用到的核心算法]

**算法原理：**
[用数学公式或伪代码描述算法]

**硬件实现策略：**
[描述如何将算法映射到硬件]

### 3.2 关键模块设计

#### 3.2.1 AHB_bram_controller
(AHB_irom_controller与之类似只是删去部分代码节省资源)

**功能描述：**
实现对vivado block memory IP进行控制，能够作为AHB从机被主机进行读写，作为bridge将BRAM Native接口转换成AHB接口。并且能够正确处理主机时序跟BRAM时序，当BRAM不能及时处理读写传输能够对未决事务进行暂存跟后续执行，对数据进行前推，实现不暂停条件下连续读写。

**端口定义：**

```verilog
module AHB_bram_controller #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 32
    )(

    //=====AHB-Lite slave interface=========================================================================
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
    //=====AHB-Lite slave interface=========================================================================

    //=====single port ram BRAM interface=========================================================================
    output reg  [ADDR_WIDTH-1:0]       bram_addra,   // BRAM address port (write/read address)
    output reg  [DATA_WIDTH-1:0]       bram_dina,    // BRAM data input port (write data)
    input  wire [DATA_WIDTH-1:0]       bram_douta,   // BRAM data output port (read data)
    output reg                         bram_ena,     // BRAM enable signal
    output reg  [(DATA_WIDTH/8)-1 : 0]  bram_wea     // BRAM write enable (byte-wise)
    //=====single port ram BRAM interface=========================================================================
);
```

**逻辑设计：**
AHB_bram_controller 面向 AHB-Lite 与单端口 BRAM 的桥接，遵循 AHB“控制阶段+数据阶段”的两拍传输模型，并在不拉低 HREADYOUT 的前提下处理读后写/写后读的紧邻流水事务。

- 传输阶段与对齐
    - 控制阶段采样 `HSELx/HTRANS/HWRITE/HSIZE/HADDR`，数据阶段完成 `HRDATA/写入 BRAM`。
    - 仅支持单拍（`HBURST=Single`）且不支持 `HLOCK`；`HSIZE` 支持字节/半字/字（≤word）。
    - 对齐检查：半字需 `HADDR[0]=0`，字需 `HADDR[1:0]=0`，违规置 `HRESP=1`（ERROR）。

- 写路径（字节使能与延迟对齐）
    - 控制阶段锁存 `HADDR->addr_r`、`HSIZE->hsize_r`，解码字节写使能 `bram_wea_decode`（按 `HSIZE` 与地址低位选择字节使能信号）。
    - 数据阶段驱动 `bram_addra/ena/wea/dina`，确保与 `HWDATA` 对齐写入。

- 读路径与前推（forwarding）
    - 读控制到达即拉高 `bram_ena` 并给出 `bram_addra`，下拍从 `bram_douta` 取数。
    - 若出现“写→读”紧邻（RAW hazard），写操作暂存到寄存器（`addr_reg/data_reg/bram_wea_reg`），读返回阶段按 `HSIZE/offset` 将 `data_reg` 与 `bram_douta` 按字节粒度合成，保证读到最新值。

- 无等待策略与轻量状态
    - `HREADYOUT` 恒为 1，实现总线无等待；用组合态 `bus_state`（FREE/WRITE/READ）+ 上拍 `bus_state_d1` 描述序列关系。
    - 发生“写→读”时置 `register_active=1`，等到“FREE 或 读→写”窗口将暂存写一次性回放至 BRAM，清空寄存器。
    - 以 `bram_2BUSY` 监控未决回放是否溢出；若超过可承载阈值（变为 `2'b10`），置 `HRESP=1` 报错。

- 协议与限制
    - `HRESP=1` 条件：不支持的 `HSIZE`、非 SINGLE 的 `HBURST`、未决事务溢出、地址未对齐。
    - 设计假设：单端口 BRAM、32-bit 数据宽、1 拍读延迟；参数化 `ADDR_WIDTH/DATA_WIDTH` 与 `ADDR_LSB` 适配不同位宽。
    - 未实现：突发传输、锁定传输、保护位/缓存一致性等高级特性。

#### 3.2.2 AHB_interconnect


**功能描述：**
AHB_interconnect 为 AHB-Lite 提供轻量级两从机互连，集成地址译码与返回路径多路复用。将主机侧地址 `HADDR` 译码为从机片选 `HSEL[1:0]`，并依据片选从对应从机回传 `HRDATA/HRESP/HREADY` 至主机侧。模块本身不引入等待，握手与延迟完全由被选从机决定；聚焦在“片选+响应返回”。

**端口定义：**

```verilog
module AHB_interconnect #(
        parameter ADDR_WIDTH = 32,
        parameter DATA_WIDTH = 32
)(
        input  wire HCLK,
        input  wire HRESETn,
        input  wire [ADDR_WIDTH -1:0] HADDR,
        input  wire [DATA_WIDTH-1:0] HRDATA0,
        input  wire HRESP0,
        input  wire HREADYOUT0,
        input  wire [DATA_WIDTH-1:0] HRDATA1,
        input  wire HRESP1,
        input  wire HREADYOUT1,

        output wire [DATA_WIDTH-1:0] HRDATA,
        output wire HRESP,
        output wire [1:0] HSEL,
        output wire HREADY
);
```

**逻辑设计：**
AHB_interconnect 由两部分组成：

- 地址译码器（AHB_decoder）
    - 输入：`HADDR`、`HRESETn`；输出：`HSEL[1:0]`（one-hot 片选）。
    - 地址映射策略在译码器内部定义，可通过高位地址划分存储器与外设窗口。

- 响应多路复用器（AHB_multiplexor）
    - 根据 `HSEL` 选择对应从机返回路径，将 `HRDATAx/HRESPx/HREADYOUTx` 直通到主机侧输出 `HRDATA/HRESP/HREADY`。
    - 命名说明：本模块输出端口为 `HREADY`（等价主机侧 HREADY），其值来自被选从机的 `HREADYOUTx`，不额外插入等待。

特性与限制：

- 支持参数化 `ADDR_WIDTH/DATA_WIDTH`；当前实现为两从机，易扩展至 N 从机（扩大 `HSEL` 位宽与多路复用输入）。
- 不负责写数据/控制信号的路由与仲裁，写通路由顶层直接依 `HSEL` 连接到各从机；无多主机支持。
- 不改变 AHB-Lite 的握手与时序，系统整体等待与错误由被选从机的 `HREADYOUT/HRESP` 决定。
- 未实现突发/锁定等高级特性，本模块对这些特性透明；


### 3.3 资源使用设计

存储读写部分遵照AHB协议但未完全实现所有功能只实现了满足当前处理器数据吞吐的功能，节省FPGA资源，缩短项目开发时间。

**逻辑资源规划：**

- LUT使用策略：[描述]
- 寄存器使用：[描述]
- 时钟资源：[描述]

**存储资源规划：**

- BRAM使用：[描述用途和大小]
- 分布式RAM：[描述]

---

## 4. LLM 辅助优化记录

### 4.1 设计阶段LLM辅助

#### 4.1.1 架构设计咨询

**优化目标：** 确定最佳系统架构

**用户输入：**

```
我正在设计一个[项目类型]，需要实现[具体功能]。目标器件是[FPGA型号]，
主要性能要求是[性能指标]。请帮我分析最适合的系统架构设计方案，
并给出模块划分建议。

具体需求：
1. [需求1]
2. [需求2]
3. [需求3]

请提供架构建议和关键设计要点。
```

**LLM回答：**

```
[粘贴LLM的完整回答]
```

**采用建议：**
[列出实际采用的架构建议]

#### 4.1.3 状态机设计优化

**优化目标：** 优化控制逻辑设计

**用户输入：**

```
我需要设计一个控制[具体功能]的状态机，主要控制流程包括：
[描述控制流程]

当前设计的状态机有[X]个状态，但感觉状态转换比较复杂。
请帮我优化状态机设计，简化控制逻辑。

[当前状态机描述或代码]
```

**LLM回答：**

```
[粘贴LLM的回答]
```

**优化实施：**
[描述实际的状态机优化结果]

### 4.2 实现阶段LLM辅助

#### 4.2.4 代码优化

**优化目标：** 提升代码质量和性能

**用户输入：**

```
对于ahb的按位读取是否要像写入那通过掩码进行偏移读取寻址数据?

[LLM实际上读取了整个文件这里只黏贴部分代码]
if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (read_pending) begin
        if(register_active && bram_addra == addr_reg) begin
            case (hsize_r)
                3'b000: HRDATA = {24'b0, data_reg[7:0]};
                3'b001: HRDATA = {16'b0, data_reg[15:0]};
                3'b010: HRDATA = data_reg;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
        end else begin
            case (hsize_r)
                3'b000: HRDATA = {24'b0, bram_douta[7:0]};
                3'b001: HRDATA = {16'b0, bram_douta[15:0]};
                3'b010: HRDATA = bram_douta;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
```

**LLM回答：**

```
你的疑问很专业。
确实，当前实现（如{24'b0, bram_douta[7:0]}）只取了最低字节，没有考虑地址的低位偏移（即HADDR[ADDR_LSB-1:0]），这样只能从低位对齐读取，不能支持高位字节的读取。

在AHB协议中，按位（byte/halfword）读取时，应该根据地址的低位偏移，选择对应的字节或半字。例如，HADDR[1:0]（对于32位数据）决定了你要读哪一个字节。

标准做法应为：

读取时根据HADDR[ADDR_LSB-1:0]偏移，选择bram_douta的对应字节或半字。
例如，byte读取时，HRDATA = {24'b0, bram_douta[8*offset +: 8]}，offset=HADDR[1:0]。
你的当前实现不完全符合AHB标准的“非对齐访问”要求。
如果要完全支持AHB协议的按位/半字读取，建议修改为根据地址偏移动态选择数据位。

需要我帮你修改为支持地址偏移的标准实现吗？
```

**代码改进：**

```verilog
if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (read_pending) begin
        if(register_active && bram_addra == addr_reg) begin
            case (hsize_r)
                3'b000: HRDATA = {24'b0, data_reg[7:0]};
                3'b001: HRDATA = {16'b0, data_reg[15:0]};
                3'b010: HRDATA = data_reg;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
        end else begin
            case (hsize_r)
                3'b000: HRDATA = {24'b0, bram_douta[7:0]};
                3'b001: HRDATA = {16'b0, bram_douta[15:0]};
                3'b010: HRDATA = bram_douta;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
[原始代码]

[LLM 提供]
if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (read_pending) begin
        // 计算字节偏移，不用integer，直接用wire表达式
        wire [1:0] offset = bram_addra[ADDR_LSB-1:0];
        if(register_active && bram_addra == addr_reg) begin
            case (hsize_r)
                3'b000: case(offset)
                    2'd0: HRDATA = {24'b0, data_reg[7:0]};
                    2'd1: HRDATA = {24'b0, data_reg[15:8]};
                    2'd2: HRDATA = {24'b0, data_reg[23:16]};
                    2'd3: HRDATA = {24'b0, data_reg[31:24]};
                    default: HRDATA = {DATA_WIDTH{1'b0}};
                endcase
                3'b001: case(offset[1])
                    1'b0: HRDATA = {16'b0, data_reg[15:0]};
                    1'b1: HRDATA = {16'b0, data_reg[31:16]};
                    default: HRDATA = {DATA_WIDTH{1'b0}};
                endcase
                3'b010: HRDATA = data_reg;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase
        end else begin
            case (hsize_r)
                3'b000: case(offset)
                    2'd0: HRDATA = {24'b0, bram_douta[7:0]};
                    2'd1: HRDATA = {24'b0, bram_douta[15:8]};
                    2'd2: HRDATA = {24'b0, bram_douta[23:16]};
                    2'd3: HRDATA = {24'b0, bram_douta[31:24]};
                    default: HRDATA = {DATA_WIDTH{1'b0}};
                endcase
                3'b001: case(offset[1])
                    1'b0: HRDATA = {16'b0, bram_douta[15:0]};
                    1'b1: HRDATA = {16'b0, bram_douta[31:16]};
                    default: HRDATA = {DATA_WIDTH{1'b0}};
                endcase
                3'b010: HRDATA = bram_douta;
                default: HRDATA = {DATA_WIDTH{1'b0}};
            endcase

[最终使用代码]
    if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (read_pending) begin
    if(register_active && (bram_addra_d1[ADDR_WIDTH-1:ADDR_LSB] == addr_reg[ADDR_WIDTH-1:ADDR_LSB])) begin
            // according bram_wea_reg combine data_reg and bram_douta read write circle
            // if there is a not done write due to read after write and the address is the same
            // then the read data should be combine of the write data and the bram_dout
            case (hsize_r)
                3'b000: begin
                    HRDATA = {24'b0, (bram_wea_reg[offset] ? data_reg[8*offset +: 8] : bram_douta[8*offset +: 8])};
                end
                3'b001: begin
                    if (offset < (DATA_WIDTH/8 - 1)) begin
                        HRDATA = {16'b0,
                            (bram_wea_reg[offset+1]   ? data_reg[8*(offset+1) +: 8] : bram_douta[8*(offset+1) +: 8]),
                            (bram_wea_reg[offset]     ? data_reg[8*offset +: 8]     : bram_douta[8*offset +: 8])};
                    end else begin
                        HRDATA = {DATA_WIDTH{1'b0}}; // out of range, return zero
                    end
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
[改进后代码]
```
#### 4.1.3 状态机设计优化

**优化目标：** 优化控制逻辑设计


**用户输入：**

```
查看整个代码提出你觉得能够节省资源简化的地方
(LLM读取了整个文件)

```

**LLM回答：**
(展示部分进行了代码修改的回答)
```
下面给出对当前 AHB_bram_controller_simple.v 代码的全面精简与资源优化建议（功能不变前提下），分层说明：状态/控制、写路径、读路径与数据旁路、时序/复位、可综合性、参数化与可移植性、潜在隐患与可测性补强。可按需挑选实施。

1. 状态与控制逻辑精简
bus_state / bram_state / bram_2BUSY 三套状态过重

现在：bus_state 只是区分本拍是否是写/读/空闲；bram_state 又对前后拍组合做状态判定；bram_2BUSY 再次扩展 busy 层数并用于 HRESP。
可选优化：
方案A：删除 bram_state 和 bram_2BUSY，直接用 write_pending 和 read_pending（当前拍+上一拍）推导“冲突/忙”条件。例如：
busy_condition = write_pending & read_request_next 或 write_request与读请求交叠。
方案B：保留一个 2bit 状态（例如 IDLE / WRITE / READ / TRANSITION），用上拍的写请求和本拍读请求判断是否需要产生 HRESP。
好处：减少组合比较 + 减少两个寄存器 + 去掉多余 MUX。
register_active / register_active_d1 双寄存器是否必要

你只用它们表示：之前进入 BUSY 保存了一份写数据，FREE 后再驱动 BRAM。

......
(省略部分)
......

12. 实施优先级建议
按“收益/改动风险”排序：

修正不规范时序敏感列表（or HRESETn → or negedge HRESETn）。
加入地址对齐检测，避免非法访问。
合并 register_active* / bram_2BUSY 逻辑。
HRDATA 旁路统一字节合成，删除重复 case。
去除无必要清零输出，减少翻转。
参数化 offset 计算，准备可扩展性。
引入断言（仿真专用）验证 corner case。
如果你希望，我可以下一步直接帮你：

A) 先做“低风险修正包”（复位/对齐/HRESP简化）
B) 再做“结构重构包”（统一旁路/删除多余状态）
告诉我你想执行哪一步或希望我直接提交第一阶段修改。需要的话我可以按阶段打补丁。

要不要继续我来动手？
```

**代码改进：**

```verilog

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

......

always @(posedge HCLK or negedge HRESETn) begin
    if(!HRESETn) begin
        register_active_d1 <= 1'b0;
    end else begin
        register_active_d1 <= register_active;
    end
end

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

[原始代码]
(将原来bram_state状态表示改成组合表示更直接反映控制逻辑)
(删去多余的register_active_d1状态寄存器，改成用其他判断逻辑正确表示)

always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        register_active <= 1'b0;
    end else if (bus_state_d1 == bus_WRITE && bus_state == bus_READ) begin
        register_active <= 1'b1;
    end else if (((bus_state == bus_FREE) || (bus_state_d1 == bus_READ && bus_state == bus_WRITE))) begin
        register_active <= 1'b0;
    end else begin
        register_active <= register_active;
    end
end

......

// always @(posedge HCLK or negedge HRESETn) begin
//     if(!HRESETn) begin
//         register_active_d1 <= 1'b0;
//     end else begin
//         register_active_d1 <= register_active;
//     end
// end

if (!HRESETn) begin
        bram_wea = {(DATA_WIDTH/8){1'b0}};
    end else if (write_pending) begin
        if(bus_state_d1 == bus_WRITE && bus_state == bus_READ) begin
            bram_wea_busy = bram_wea_decode; // hold write enable during busy state
            bram_wea = {(DATA_WIDTH/8){1'b0}};
        end
        else begin
            bram_wea = bram_wea_decode;
        end
    end else if (register_active && ((bus_state == bus_FREE) ||(bus_state_d1 == bus_READ && bus_state == bus_WRITE))) begin
        bram_wea = bram_wea_reg;
    end else begin
        bram_wea = {(DATA_WIDTH/8){1'b0}};
    end

[改进后代码]
```

#### 4.2.2 时序优化

**优化目标：** 解决时序违例

**用户输入：**

```
我的设计在综合后出现时序违例，关键路径延迟为[X]ns，
目标时钟周期为[Y]ns。违例路径主要在[描述路径]。

请帮我分析时序违例的原因，并提供优化建议。

[时序报告或相关信息]
```

**LLM回答：**

```
[粘贴LLM的回答]
```

**时序优化措施：**
[描述实际采取的时序优化措施]

### 4.3 调试阶段LLM辅助

#### 4.3.1 仿真问题解决

**问题描述：** [描述遇到的仿真问题]

**用户输入：**

```
在仿真过程中遇到以下问题：
[详细描述问题现象]

仿真波形显示：
[描述关键信号的异常行为]

请帮我分析可能的原因并提供调试建议。
```

**LLM回答：**

```
[粘贴LLM的回答]
```

**问题解决：**
[描述问题的最终解决方案]

### 4.4 LLM辅助总结

**效果评估：**

- 设计效率提升：[具体描述]
- 代码质量改善：[具体描述]
- 学习效果：[描述通过LLM辅助学到的知识]

**使用心得：**

- 有效的prompt技巧：[总结]
- LLM擅长的领域：[总结]
- 需要人工判断的方面：[总结]

---

## 5. 仿真验证与测试

### 5.1 仿真环境搭建

**仿真工具：** [如ModelSim, Vivado Simulator]
**测试平台：** [描述测试环境]

### 5.2 功能验证

#### 5.2.1 单元测试

[描述各个模块的单元测试]

**测试模块1：AHB_bram_controller**

- 测试目标：
    - 验证 AHB_bram_controller 支持字节、半字、字的单次读写，连续非突发写/读，读写交错（RAW hazard）等典型 AHB-Lite 访存场景，确保数据正确性与协议时序。
- 测试用例：
    1. 单字写入与读取（地址对齐，数据回读校验）
    2. 半字写入与读取（不同地址偏移，覆盖高/低半字）
    3. 字节写入与读取（不同字节偏移，覆盖所有 byte lane）
    4. 连续多字写入与顺序读取（非突发 pipeline，验证流水线能力）
    5. 写后紧跟读（RAW hazard，验证前推/旁路机制）
    6. 非法访问/对齐检测（如半字/字未对齐，HRESP=1）
- 测试结果：✅ 通过
    - 所有功能点均通过 ModelSim/Vivado 仿真，读写数据与预期一致，HRESP/HREADYOUT 行为正确。

**测试模块2：AHB_interconnect**

- 测试目标：
    - 验证 AHB_interconnect 能正确译码主机地址，驱动 HSEL 片选信号，完成主机与多个从机（如 BRAM、IROM 控制器）的数据通路切换，确保响应和数据返回路径无误。
- 测试用例：
    1. 访问 BRAM 地址空间，检查 HSEL[0] 片选、数据写入/回读、HREADY/HRESP 直通。
    2. 访问 IROM 地址空间，检查 HSEL[1] 片选、数据回读、HREADY/HRESP 直通。
    3. 地址跨区切换，连续访问 BRAM/IROM，验证片选切换和响应无毛刺。
    4. 非法/未映射地址访问，检查 HSEL 输出和主机侧响应。
    5. 片选信号与下游从机 HSELx 保持一致性（仿真断言校验）。
- 测试结果：✅ 通过
    - 所有场景均通过仿真，HSEL、HRDATA、HRESP、HREADY 等信号与预期一致，片选与下游一致性断言无误。

#### 5.2.2 集成测试

[描述系统级集成测试]

**测试场景：**
[描述各种测试场景]

**测试结果分析：**
[分析测试结果]

### 5.3 时序验证

[描述时序分析结果]

**关键路径分析：**

- 最长路径延迟：[ns]
- 建立时间裕量：[ns]
- 保持时间裕量：[ns]

### 5.4 硬件验证（如适用）

[如果进行了板级验证，描述验证过程]

---

## 6. 综合实现结果

### 6.1 资源使用报告

| 资源类型 | 使用数量 | 总数量 | 利用率 |
| -------- | -------- | ------ | ------ |
| LUT      | [数量]   | [总数] | [%]    |
| FF       | [数量]   | [总数] | [%]    |
| BRAM     | [数量]   | [总数] | [%]    |
| DSP      | [数量]   | [总数] | [%]    |
| IO       | [数量]   | [总数] | [%]    |

### 6.2 时序性能报告

| 时序指标 | 目标值 | 实际值 | 裕量  |
| -------- | ------ | ------ | ----- |
| 时钟频率 | [MHz]  | [MHz]  | [MHz] |
|          |        |        |       |

### 6.3 功耗分析（可选）

| 功耗类型 | 功耗值 |
| -------- | ------ |
| 静态功耗 | [W]    |
| 动态功耗 | [W]    |
| 总功耗   | [W]    |

---

## 7. 创新点与特色

### 7.1 设计创新点

[描述项目的创新之处，注重体现FPGA基本设计能力的创新应用]

1. **逻辑设计创新：** [描述]
2. **状态机设计创新：** [描述]
3. **时序设计创新：** [描述]
4. **接口设计创新：** [描述]

### 7.2 工程实现特色

[描述在工程实现方面的特色]

### 7.3 LLM辅助方法创新

[描述在LLM辅助设计方面的创新做法]

- 使用vscode github copilot辅助设计通过直接访问本地文件跟仓库提供上下文，让LLM能够直接了解代码逻辑跟项目要求
- 允许copilot直接调用cmd终端执行调试指令并且读取返回结果快速实现环境配置跟gnu工具链语法路径等问题解决
- 使用copilot agent PR 创建拉取请求完成任务，让智能体自动分步骤完成任务且与主工作分支隔离进行审核后合并

---



## 8. 未来改进方向

### 8.1 当前不足

[客观分析项目的不足之处]
存储部分未完全支持AHB协议未能实现burst突发传输
### 8.2 改进计划

[提出具体的改进方案]
实现cpu cache 且实现burst功能采用跨时钟实现快速存储读取
### 8.3 后续发展方向

[描述项目的进一步发展可能性]

---

## 9. 结论

### 9.1 项目完成情况

[总结项目的完成情况]

### 9.2 目标达成度

[分析预期目标的达成情况]

### 9.3 项目价值

[总结项目的技术价值和学习价值]

---

## 10. 参考文献

[1] ARM Ltd. (n.d.). *AMBA AHB Protocol Specification (IHI 0033)*. Retrieved October 30, 2025, from [https://developer.arm.com/documentation/ihi0033/latest/](https://developer.arm.com/documentation/ihi0033/latest/)

[2] darklife. (n.d.). *darkriscv: RISC-V compatible softcore implemented in Verilog*. GitHub repository. Retrieved October 30, 2025, from [https://github.com/darklife/darkriscv](https://github.com/darklife/darkriscv)

[3] RISC-V Software Source. (n.d.). *riscv-tests: RISC-V ISA tests*. GitHub repository. Retrieved October 30, 2025, from [https://github.com/riscv-software-src/riscv-tests](https://github.com/riscv-software-src/riscv-tests)


---

## 11. 附录

### 11.1 系统源代码目录树

```
project_root/
├── src/                    # 源代码目录
│   ├── rtl/               # RTL代码
│   │   ├── top_module.v   # 顶层模块
│   │   ├── core/          # 核心模块
│   │   └── utils/         # 工具模块
│   ├── constraints/       # 约束文件
│   │   └── timing.xdc
│   ├── testbench/         # 测试文件
│   │   └── tb_top.v
│   └── scripts/           # 构建脚本
├── docs/                  # 文档目录
├── simulation/            # 仿真结果
└── README.md             # 项目说明
```

### 11.2 关键LLM交互记录

[提供最重要的几次LLM交互记录，展示LLM辅助的核心价值]

**重要交互1：** [交互主题]

- 用户问题：[简化的问题描述]
- LLM建议：[关键建议摘要]
- 实施效果：[具体改进效果]

**重要交互2：** [交互主题]

- 用户问题：[简化的问题描述]
- LLM建议：[关键建议摘要]
- 实施效果：[具体改进效果]
