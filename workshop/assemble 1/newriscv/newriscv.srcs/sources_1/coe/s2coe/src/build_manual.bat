@echo off
REM Manual build script - Set your RISC-V toolchain path here
REM Edit the line below with your actual RISC-V toolchain path

echo ========================================
echo RV32I Test - Manual Build Configuration
echo ========================================
echo.
echo Please set your RISC-V toolchain path:
echo.
echo Current path attempts:
echo.

REM ====================================================
REM EDIT THIS LINE: Set your RISC-V toolchain path here
REM ====================================================
set "MY_RISCV_PATH=C:\riscv\bin"

REM Try common paths
set FOUND=0

if exist "%MY_RISCV_PATH%\riscv64-unknown-elf-as.exe" (
    set "RISCV_BIN=%MY_RISCV_PATH%"
    set FOUND=1
    echo [OK] Found at: %MY_RISCV_PATH%
    goto :build
)

REM Check PATH
where riscv64-unknown-elf-as >nul 2>&1
if %errorlevel%==0 (
    set FOUND=1
    echo [OK] Found in system PATH
    goto :build
)

REM Try to find it
for %%D in (C D E F) do (
    if exist "%%D:\riscv\bin\riscv64-unknown-elf-as.exe" (
        set "RISCV_BIN=%%D:\riscv\bin"
        set FOUND=1
        echo [OK] Found at: %%D:\riscv\bin
        goto :build
    )
    if exist "%%D:\xpack-riscv-none-elf-gcc\bin\riscv-none-elf-as.exe" (
        set "RISCV_BIN=%%D:\xpack-riscv-none-elf-gcc\bin"
        set FOUND=1
        set "RISCV_PREFIX=riscv-none-elf-"
        echo [OK] Found xpack at: %%D:\xpack-riscv-none-elf-gcc\bin
        goto :build
    )
)

:notfound
echo.
echo [ERROR] RISC-V toolchain not found!
echo.
echo Please install RISC-V GNU Toolchain:
echo   1. Download from: https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases
echo   2. Or: https://github.com/sifive/freedom-tools/releases
echo.
echo After installation, edit this file (build_manual.bat) and set MY_RISCV_PATH
echo Example: set "MY_RISCV_PATH=D:\tools\riscv\bin"
echo.
pause
exit /b 1

:build
if defined RISCV_BIN set "PATH=%RISCV_BIN%;%PATH%"
if not defined RISCV_PREFIX set "RISCV_PREFIX=riscv64-unknown-elf-"

echo.
echo Using toolchain: %RISCV_PREFIX%
echo.

REM File names
set SOURCE=rv32i_test.s
set OBJECT=rv32i_test.o
set ELF=rv32i_test.elf
set BIN=rv32i_test.bin
set MEM=rv32i_test.mem
set COE=rv32i_test.coe

REM Create output directory
if not exist "test_output" mkdir test_output

echo [1/5] Assembling...
%RISCV_PREFIX%as -march=rv32i -mabi=ilp32 -o test_output\%OBJECT% %SOURCE%
if errorlevel 1 goto :error

echo [2/5] Linking...
%RISCV_PREFIX%ld -T linker.ld -o test_output\%ELF% test_output\%OBJECT%
if errorlevel 1 goto :error

echo [3/5] Generating binary...
%RISCV_PREFIX%objcopy -O binary test_output\%ELF% test_output\%BIN%
if errorlevel 1 goto :error

echo [4/5] Converting to MEM...
if exist "tool\bin2mem.exe" (
    tool\bin2mem.exe test_output\%BIN% test_output\%MEM%
    if errorlevel 1 goto :error
) else (
    echo WARNING: tool\bin2mem.exe not found, skipping MEM generation
)

echo [5/5] Converting to COE...
if exist "coemem.exe" (
    coemem.exe test_output\%MEM% test_output\%COE%
    if errorlevel 1 goto :error
) else (
    echo WARNING: coemem.exe not found, skipping COE generation
)

echo.
echo Generating disassembly...
%RISCV_PREFIX%objdump -d test_output\%ELF% > test_output\rv32i_test.asm
%RISCV_PREFIX%objdump -s test_output\%ELF% > test_output\rv32i_test_sections.txt

echo.
echo ========================================
echo Build SUCCESS!
echo ========================================
echo.
echo Output files:
dir /b test_output
echo.
echo Expected test result: 34 (0x22)
echo LED output address: 0xFFFFFFFC
echo.
pause
exit /b 0

:error
echo.
echo ========================================
echo Build FAILED!
echo ========================================
echo.
pause
exit /b 1
