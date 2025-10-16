# RISC-V rv32ui -> COE 构建工具 (Windows)

本工具用于在 Windows 环境下将 `riscv-tests/isa/rv32ui` 目录下的汇编测试 (`*.S`) 编译为 Xilinx Vivado Block Memory 可用的 `.coe` 文件，同时生成 ELF/BIN/HEX 和反汇编 `.asm` 以便比对。

## 依赖
- RISC-V 嵌入式交叉编译工具链 (已知可用前缀: `riscv-none-embed-*`)
  - 示例安装路径: `D:\gnu-mcu-eclipse-riscv-none-gcc\RISC-V Embedded GCC\bin`
- Windows PowerShell (用于 BIN->COE 转换的备用路径)

## 生成内容
- `*.elf`  编译产物 (RV32I, 无标准库)
- `*.bin`  裸二进制
- `*.hex`  Verilog hex (如果 objcopy 支持)
- `*.coe`  Vivado 初始化文件
- `*.asm`  反汇编，便于与源 `.S` 对照检查

## 链接脚本与内存布局
- 工具会临时生成 `rv32ui.ld`，将 `.text` 放在 `0x8000_0000`，并导出符号 `_tohost=0x8000_1000`。
- 如需与 SoC 地址映射严格对齐，可自行修改 `tools/build_rv32ui_to_coe.bat` 中生成的链接脚本部分。

## 使用
```bat
cd workshop\riscv-tests\tools
build_rv32ui_to_coe.bat "D:\gnu-mcu-eclipse-riscv-none-gcc\RISC-V Embedded GCC\bin" out
```
- 第一个参数: 工具链 bin 目录 (可省略，脚本内置默认路径)
- 第二个参数: 输出目录名，位于 `tools/` 下 (默认 `out`)

产物位于 `tools/out/`，将 `*.coe` 填入 Vivado 的 Block Memory Generator IP 作为初始化文件即可。

## 验证
- 查看 `*.asm` 确认反汇编与期望一致
- 可用 `readelf`/`objdump` 检查入口 `_start` 地址是否为 `0x8000_0000`

## 常见问题
1. 找不到 GCC/objcopy/objdump
   - 确认传入的工具链路径正确，或修改脚本开头的默认路径
2. 无法生成 `*.hex`
   - 某些版本 `objcopy` 无 `-O verilog`，脚本会自动回落到 `BIN -> COE` 的路径
3. COE 行末逗号
   - 脚本为简化未去掉最后一行逗号；Vivado 通常可接受。如需严格格式，可后处理替换最后一个逗号为 `;`

## 后续集成建议
- 在 Testbench 中监测 `tohost` 地址(0x8000_1000)的写入判定测试通过/失败
- IROM/DRAM 对应 0x8000_0000 映射，如需不同映射，请更改链接脚本或总线译码
