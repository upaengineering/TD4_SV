module pc(
input	logic clk, rst_b, load_b,
input	logic [3:0] d,
output	logic [3:0] q);
	
always_ff @(posedge clk, negedge rst_b)
	if (!rst_b)
		q <= 4'b0;	//Asynchronous reset
	else if (load_b)
		q <= q + 4'b1;	//If load_b is high, this module works as counter
	else
		q <= d;	//If load_b is low, d is loaded to q
endmodule
	
