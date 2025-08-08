echo off
:: make file for Icarus Verilog simulator
if not "%1"=="" (
  if not defined IVERILOG (
    set IVERILOG=%1
    set PATH=%PATH%;%1\bin
  )
)
if not defined IVERILOG (
  echo run batch file with path to Icarus Verilog simulator installed directory
  echo as first argument, same argument is optional afterwards for defining
  echo GTK_WAVE
  goto :END
)
if exist .\bin rmdir /Q/S bin
if not exist .\bin mkdir bin
cd .\bin
if "%1"=="" (
  iverilog -o aes_tb.out -I .. ..\aes_dec.v ..\aes_enc.v ..\aes_tb.sv
)  
if not "%1"=="" (
  iverilog -DGTK_WAVE -o aes_tb.out -I .. ..\aes_dec.v ..\aes_enc.v ..\aes_tb.sv
)  
if exist aes_tb.out vvp aes_tb.out
cd ..
:END
