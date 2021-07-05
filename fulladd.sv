module fulladd(
input	logic cin,
input	logic [3:0] a, b,
output	logic [3:0] q,
output	logic cout);
	
assign	{cout, q} = a + b + cin;

endmodule
