module td4(
input	logic [3:0] in,
input	logic clk, rst_b,
output	logic [3:0] out);

logic [7:0] data;
logic [3:0] reg_a_out, reg_b_out, dsel_in3, address, load_b, dsel_out, alu_out;
logic alu_cin, cflag_raw, cflag_b, sel_a, sel_b, cflag;

//Specify submodule info (decode)
decode decode0(
.op(data[7:4]),
.cflag(cflag),
.sel_a(sel_a),
.sel_b(sel_b),
.load_b(load_b)
);

//Specify submodule info (data selector)
dsel dsel0(
.a(sel_a),
.b(sel_b),
.c0(reg_a_out),
.c1(reg_b_out),
.c2(in),
.c3(dsel_in3),
.y(dsel_out)
);

//Specify submodule info (ALU)
fulladd alu0(
.cin(alu_cin),
.a(dsel_out),
.b(data[3:0]),
.q(alu_out),
.cout(cflag_raw)
);

//Specify submodule info (dff)
dff dff0(
.clk(clk),
.rst_b(rst_b),
.d(cflag_raw),
.q(cflag),
.q_b(cflag_b)
);

//Specify submodule info (A register)
reg_4bit reg_a(
.clk(clk),
.rst_b(rst_b),
.load_b(load_b[0]),
.d(alu_out),
.q(reg_a_out)
);

//Specify submodule info (B register)
reg_4bit reg_b(
.clk(clk),
.rst_b(rst_b),
.load_b(load_b[1]),
.d(alu_out),
.q(reg_b_out)
);

//Specify submodule info (output port)
reg_4bit output_port0(
.clk(clk),
.rst_b(rst_b),
.load_b(load_b[2]),
.d(alu_out),
.q(out)
);

//Specify submodule info (program counter)
pc pc0(
.clk(clk),
.rst_b(rst_b),
.load_b(load_b[3]),
.d(alu_out),
.q(address)
);

//Specify submodule info (ROM)
rom rom0(
.address(address),
.data(data)
);

//Tielo
assign dsel_in3 = 4'b0000;
assign alu_cin = 1'b0;

endmodule
