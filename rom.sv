module rom(
input	logic [3:0] address,
output	logic [7:0] data);

function	[7:0]	select;
input	[3:0]	address;
	case (address)
//Ramen timer!
	4'b0000:	select = 8'b10110111; //OUT 0111
	4'b0001:	select = 8'b00000001; //ADD A,0001
	4'b0010:	select = 8'b11100001; //JNC 0001
	4'b0011:	select = 8'b00000001; //ADD A,0001
	4'b0100:	select = 8'b11100011; //JNC 0011
	4'b0101:	select = 8'b10110110; //OUT 0110
	4'b0110:	select = 8'b00000001; //ADD A,0001
	4'b0111:	select = 8'b11100110; //JNC 0110
	4'b1000:	select = 8'b00000001; //ADD A,0001
	4'b1001:	select = 8'b11101000; //JNC 1000
	4'b1010:	select = 8'b10110000; //OUT 0000
	4'b1011:	select = 8'b10110100; //OUT 0100
	4'b1100:	select = 8'b00000001; //ADD 0001
	4'b1101:	select = 8'b11101010; //JNC 1010
	4'b1110:	select = 8'b10111000; //OUT 1000
	4'b1111:	select = 8'b11111111; //JMP 1111
	default:	select = 8'bxxxxxxxx;
/*
//LED chikachika!
	4'b0000:	select = 8'b10110011; //OUT 0011
	4'b0001:	select = 8'b10110110; //OUT 0110
	4'b0010:	select = 8'b10111100; //OUT 1100
	4'b0011:	select = 8'b10111000; //OUT 1000
	4'b0100:	select = 8'b10111000; //OUT 1000
	4'b0101:	select = 8'b10111100; //OUT 1100
	4'b0110:	select = 8'b10110110; //OUT 0110
	4'b0111:	select = 8'b10110011; //OUT 0011
	4'b1000:	select = 8'b10110001; //OUT 0001
	4'b1001:	select = 8'b11110000; //JMP 0000
	4'b1010:	select = 8'b00000000;
	4'b1011:	select = 8'b00000000;
	4'b1100:	select = 8'b00000000;
	4'b1101:	select = 8'b00000000;
	4'b1110:	select = 8'b00000000;
	4'b1111:	select = 8'b00000000;
	default:	select = 8'bxxxxxxxx;
*/
	endcase
endfunction
	
assign	data = select(address);

endmodule
