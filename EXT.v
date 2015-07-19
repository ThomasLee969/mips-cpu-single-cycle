`timescale 1ns/1ps

module EXT(EXTout,ConBA,Imm16,PCplus4,EXTOp,LUOp)
	output	[31:0]EXTout;
	output	[31:0]ConBA;
	input	[15:0]Imm16;
	input	[31:0]PCplus4;
	input	EXTOp;
	input	LUOp;

	wire	[31:0]upper;
	assign	upper[31:0] = {Imm16[15:0],16'b0};

	wire	expend;
	assign	expend = ((EXTOp == 1) && (Imm16[15] == 1)) ? {16'b1,Imm16[15:0]}:
					{16'b0,Imm16[15:0]};

	mux_2x1 mux2(EXTout,expend,upper,LUOp);

	assign	ConBA = {expend[29:0],2'b00} + PCplus4;

endmodule
