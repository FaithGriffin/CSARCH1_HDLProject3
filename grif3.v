// Griffin, Faith Juliamae O. - S11

module BCD_D(Q,D,clk,rst);
output reg Q;
input D, clk, rst;

always @(posedge clk, negedge rst)
	if (rst == 0) 
		Q <= 4'b0000;
	else
		Q <= D;
endmodule

module BCD_main(A,B,C,D,X,clock,reset);
output A,B,C,D;
input X, clock,reset;
wire DA, DB, DC, DD;

assign DA = (A & ~B & ~C & ~D & ~X) | (~A & B & C & D & ~X) | (~A & ~B & ~C & ~D & X) | (A & ~B & ~C & D & X);
assign DB = (~A & B & ~C & ~X) | (~A & B & D & X) | (~A & B & C & ~D) | (A & ~B & ~C & ~D & X) | (~A & ~B & C & D & ~X);
assign DC = (~A & ~C & D & ~X) | (~A & C & ~D & ~X) | (~A & C & D & X) | (~A & B & ~C & ~D & X) | (A & ~B & ~C & ~D & X);
assign DD = (~A & ~D) | (A & ~B & ~C & ~D);

BCD_D F1(A, DA, clock, reset);
BCD_D F2(B, DB, clock, reset);
BCD_D F3(C, DC, clock, reset);
BCD_D F4(D, DD, clock, reset);
endmodule