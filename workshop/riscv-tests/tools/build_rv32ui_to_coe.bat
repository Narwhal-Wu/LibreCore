@echo off
REM ==============================================================================
REM  RISC-V rv32ui ISA tests -> COE builder (Windows .bat)
REM  Requirements:
REM    - RISC-V Embedded GCC (tested with: riscv-none-embed-* in D:\gnu-mcu-eclipse-riscv-none-gcc\RISC-V Embedded GCC\bin)
REM    - This script converts riscv-tests/isa/rv32ui/*.S into:
REM        1) ELF (rv32i, no-stdlib)
REM        2) BIN and HEX (verilog)
REM        3) COE (Xilinx Block Memory Generator)
REM        4) ASM disassembly (.asm) for debugging/verification
REM  Usage:
REM    build_rv32ui_to_coe.bat [ToolchainBinDir] [OutDir]
REM    Example:
REM      build_rv32ui_to_coe.bat "D:\gnu-mcu-eclipse-riscv-none-gcc\RISC-V Embedded GCC\bin" out
REM ==============================================================================

setlocal EnableExtensions EnableDelayedExpansion

REM -------- Arguments --------
set TOOLBIN=%~1
if "%TOOLBIN%"=="" set TOOLBIN=D:\gnu-mcu-eclipse-riscv-none-gcc\RISC-V Embedded GCC\bin
set OUTDIR=%~2
if "%OUTDIR%"=="" set OUTDIR=out

REM -------- Toolchain detection (riscv-none-embed-* tool prefix) --------
set GCC=%TOOLBIN%\riscv-none-embed-gcc.exe
set OBJCOPY=%TOOLBIN%\riscv-none-embed-objcopy.exe
set OBJDUMP=%TOOLBIN%\riscv-none-embed-objdump.exe
set READelf=%TOOLBIN%\riscv-none-embed-readelf.exe

if not exist "%GCC%" (
  echo [ERROR] GCC not found: %GCC%
  echo Please install or pass correct ToolchainBinDir.
  exit /b 1
)

REM -------- Paths --------
set ROOT=%~dp0..\
set ISA=%ROOT%isa\rv32ui
set TOOLS=%ROOT%tools
set OUT=%TOOLS%\%OUTDIR%
if not exist "%OUT%" mkdir "%OUT%"

REM -------- Env headers check (riscv_test.h) --------
set ENVROOT=%ROOT%env
set ENVP=%ENVROOT%\p
set ENVV=%ENVROOT%\v
set ENGM=%ENVROOT%\pm
if not exist "%ENVP%\riscv_test.h" (
  echo [ERROR] Missing env headers: "%ENVP%\riscv_test.h" not found.
  echo         The riscv-tests env submodule appears empty. Please populate:
  echo         - Copy env/ from upstream riscv-tests, or
  echo         - Adjust include paths to your own minimal env headers.
  exit /b 10
)

REM -------- Temporary linker script --------
REM We put text at 0x80000000 to match common RISC-V test expectations.
set LDS=%OUT%\rv32ui.ld
>"%LDS%" echo OUTPUT_ARCH(riscv)
>>"%LDS%" echo ENTRY(_start)
>>"%LDS%" echo SECTIONS
>>"%LDS%" echo {
>>"%LDS%" echo   . = 0x80000000;
>>"%LDS%" echo   .text : { *(.text*) *(.rodata*) }
>>"%LDS%" echo   . = ALIGN(4);
>>"%LDS%" echo   .data : { *(.data*) }
>>"%LDS%" echo   . = ALIGN(4);
>>"%LDS%" echo   .bss : { *(.bss*) *(COMMON) }
>>"%LDS%" echo   . = ALIGN(8);
>>"%LDS%" echo   PROVIDE(_tohost = 0x80001000);
>>"%LDS%" echo }

REM -------- Compiler flags --------
set CFLAGS=-march=rv32i -mabi=ilp32 -I"%ENVP%" -I"%ENVROOT%" -nostdlib -static -Wl,-T"%LDS%" -Wl,--no-relax -Wl,--gc-sections -Wl,-Map="%OUT%\a.map"

REM -------- Build each .S in rv32ui --------
for %%F in ("%ISA%\*.S") do (
  set NAME=%%~nF
  echo === Building %%~nxF ===
  set ELF="%OUT%\!NAME!.elf"
  set BIN="%OUT%\!NAME!.bin"
  set HEX="%OUT%\!NAME!.hex"
  set COE="%OUT%\!NAME!.coe"
  set ASM="%OUT%\!NAME!.asm"

  "%GCC%" %CFLAGS% -x assembler-with-cpp -o !ELF! "%%F"
  if errorlevel 1 ( echo [ERROR] GCC failed on %%~nxF & exit /b 2 )

  "%OBJCOPY%" -O binary !ELF! !BIN!
  if errorlevel 1 ( echo [ERROR] objcopy bin failed on %%~nxF & exit /b 3 )

  "%OBJCOPY%" -O verilog !ELF! !HEX!
  if errorlevel 1 ( echo [WARN] objcopy verilog failed, will convert BIN to HEX via PowerShell )

  REM Disassembly for verification
  "%OBJDUMP%" -d -S !ELF! > !ASM!

  REM Convert HEX to COE (fallback to BIN->COE if HEX missing)
  REM Prefer using repo-provided tool if available
  set BIN2COE=%ROOT%tool\bin2coe.py
  if exist "%BIN2COE%" (
    echo Using tool\bin2coe.py for BIN->COE
    powershell -NoProfile -Command "python '%BIN2COE%' '!BIN!' '!COE!'" 2>nul
    if errorlevel 1 (
      echo [WARN] tool\bin2coe.py failed, falling back to HEX/BIN conversion
      if exist !HEX! (
        call :HexToCoe !HEX! !COE!
      ) else (
        call :BinToCoe !BIN! !COE!
      )
    )
  ) else (
    if exist !HEX! (
      call :HexToCoe !HEX! !COE!
    ) else (
      call :BinToCoe !BIN! !COE!
    )
  )
)

echo All done. COE files in %OUT%
exit /b 0

REM -------- Functions --------
:HexToCoe
REM Input: %1=verilog hex, %2=coe path
setlocal
set HEX=%~1
set COE=%~2
>
"%COE%" echo memory_initialization_radix=16;
>>"%COE%" echo memory_initialization_vector=

for /f "usebackq tokens=1" %%L in ("%HEX%") do (
  set LINE=%%L
  REM Skip @addr markers from verilog hex
  echo !LINE! | findstr /b /v "@" >nul
  if !errorlevel! == 0 (
    >>"%COE%" echo !LINE!,
  )
)
REM replace last comma with semicolon is tricky in .bat; leave as comma, Vivado tolerates
exit /b 0

:BinToCoe
REM Input: %1=bin, %2=coe path (little-endian 32-bit words)
setlocal EnableDelayedExpansion
set BIN=%~1
set COE=%~2

>
"%COE%" echo memory_initialization_radix=16;
>>"%COE%" echo memory_initialization_vector=

REM Use PowerShell to dump as little-endian 32-bit words in hex
powershell -NoProfile -Command ^
  "$bytes=[IO.File]::ReadAllBytes('%BIN%'); ^
   for($i=0;$i -lt $bytes.Length;$i+=4){ ^
     $w=0; for($j=0;$j -lt 4;$j++){ if($i+$j -lt $bytes.Length){ $w += $bytes[$i+$j] -shl (8*$j) } } ^
     '{0:x8},' -f $w ^
   } | Out-File -Encoding ascii '%COE%' -Append"
exit /b 0
