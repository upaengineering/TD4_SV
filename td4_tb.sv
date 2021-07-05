`timescale 100ms / 100ms

module td4_tb();
parameter STEP = 10; //clock period
logic [3:0] in;
logic clk, rst_b;
logic [3:0] out;

//Specify module info
td4 dut1(in, clk, rst_b, out);

//Output settings for waveform viewer
initial begin
	$dumpfile("td4_wave.vcd");
	$dumpvars(0, td4_tb);
end

//Initialization & clock setting
initial begin
	clk = 1'b1;
	rst_b = 0;
	in = 4'b0000;
	forever begin
		#(STEP / 2)	clk = ~clk;
	end
end

initial begin
	#33	rst_b = 1'b1; // remove reset
	#5000	//op = 4'b0000; // ADD A,Im
	#33	$finish;
end

endmodule
