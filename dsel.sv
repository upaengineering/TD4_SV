module dsel(
input	logic a, b,
input	logic [3:0] c0, c1, c2, c3,
output	logic [3:0] y);

logic	[1:0]	sel;
assign	sel = {b, a};

function	[3:0]	select;
input	[3:0]	c0, c1, c2, c3;
input	[1:0]	sel;
	case (sel)
	2'b00:		select = c0;
	2'b01:		select = c1;
	2'b10:		select = c2;
	2'b11:		select = c3;
	default:	select = 4'bxxxx;
	endcase
endfunction
	
assign	y = select(c0, c1, c2, c3, sel);

endmodule
