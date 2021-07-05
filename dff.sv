module dff(
input	logic clk, rst_b, d,
output	logic q, q_b);

	
always_ff @(posedge clk, negedge rst_b) begin
	if (!rst_b)
		q <= 1'b0;	//Asynchronous reset
	else 
		q <= d;
end

assign q_b = ~q;

endmodule
