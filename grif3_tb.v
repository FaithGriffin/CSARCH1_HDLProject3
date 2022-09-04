// Griffin, Faith Juliamae O. - S11

module BCD_tb();
wire t_A, t_B, t_C, t_D;
reg t_X, t_clk, t_reset; 

BCD_main dut(t_A,t_B,t_C,t_D,t_X,t_clk,t_reset);

initial
	begin
		t_clk = 1'b0;
		forever #5 t_clk = ~t_clk;
	end

initial
	begin
		t_reset = 1'b0;
		#10 t_reset = 1'b1;
	end

initial
	begin
		t_X = 1'b0;
		#50 t_X = 1'b0;#10 t_X = 1'b0;#10 t_X = 1'b0;#10 t_X = 1'b0;#10 t_X = 1'b0;#10 t_X = 1'b0;
		#10 t_X = 1'b1;#10 t_X = 1'b1;#10 t_X = 1'b1;#10 t_X = 1'b1;#10 t_X = 1'b1;
	end

initial
	begin
		$display("Program by Faith Juliamae O. Griffin - S11");
		$display("Sequential Circuit Specification: Up-down BCD counter using D Flip Flop");
		$monitor("t=%0d\tclk=%b\treset=%b\t\tX=%b\tA=%b\tB=%b\tC=%b\tD=%b",$time,t_clk,t_reset,t_X,t_A,t_B,t_C,t_D);
		$dumpfile("grif3.vcd");
		$dumpvars();
	end

initial #205 $finish;
endmodule