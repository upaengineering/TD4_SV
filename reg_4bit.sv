module reg_4bit(
input	logic clk, rst_b, load_b,
input	logic [3:0] d,
output	logic [3:0] q);
	
always_ff @(posedge clk, negedge rst_b)
	if (!rst_b)
		q <= 4'b0;	//Asynchronous reset
	else if (!load_b)
		q <= d;	//If load_b is low, d is loaded to q. If load_b is high, q is restored
endmodule
	
