# TD4_SV
TD4 (4bit CPU) written by System Verilog. TD4 is a simple 4bit CPU which is originally presented on a textbook of 'CPU no tsukurikata' (in Japanese). This repository includes RTL implementation of TD4 with System Verilog & top-level test bench.

Top-level verilog file: td4.sv  
Top-level test bench: td4_tb.sv

How to compile with Icurus verilog & check the waveform  
$iverilog -g2005-sv -o td4 td4.sv decode.sv td4_tb.sv dsel.sv fulladd.sv dff.sv reg_4bit.sv pc.sv rom.sv  
$vvp td4  
$gtkwave td4_wave.vcd &
