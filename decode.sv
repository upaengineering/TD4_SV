module decode(
input	logic [3:0] op,
input	logic cflag,
output	logic sel_a, sel_b,
output	logic [3:0] load_b);

logic	[4:0]	decode_in;
logic	[5:0]	decode_out;

assign	decode_in = {op, cflag}; //combine inputs

function	[5:0]	select;
input	[4:0]	decode_in;
	casez (decode_in)
	5'b0000?:	select = 6'b000111; //ADD A, Im
	5'b0001?:	select = 6'b010111; //MOV A, B
	5'b0010?:	select = 6'b100111; //IN A
	5'b0011?:	select = 6'b110111; //MOV A, Im
	5'b0100?:	select = 6'b001011; //MOV B, A
	5'b0101?:	select = 6'b011011; //ADD B, Im
	5'b0110?:	select = 6'b101011; //IN B
	5'b0111?:	select = 6'b111011; //MOV B, Im
	5'b1001?:	select = 6'b011101; //OUT B
	5'b1011?:	select = 6'b111101; //OUT Im
	5'b11100:	select = 6'b111110; //JNC (C=0)
	5'b11101:	select = 6'b111111; //JNC (C=1) Corrected from xx1111 to avoid unexpected Cflag=1
	5'b1111?:	select = 6'b111110; //JMP
	default:	select = 6'bxxxxxx;
	endcase
endfunction
	
assign	decode_out = select(decode_in);
assign	sel_a = decode_out[4];
assign	sel_b = decode_out[5];
assign	load_b[3] = decode_out[0];
assign	load_b[2] = decode_out[1];
assign	load_b[1] = decode_out[2];
assign	load_b[0] = decode_out[3];

endmodule
