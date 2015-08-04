module tb_booth;

reg [3:0] multiplier, mult;
reg [7:0] multiplicand;
reg [2:0] count;
reg clk, reset;

wire [7:0] result_out;
reg op;

booth b1(result_out, 
	 multiplicand,
	 multiplier, 
	 count,
	 clk, 
	 reset
	);

initial
begin
	clk = 0;
	count = 0;
	reset = 1'b1;
	mult = 4'b1011;
	multiplier = 4'b0101;
	multiplicand = {4'b0000,mult};
	$dumpfile("tb_booth.vcd");
	$dumpvars(0,tb_booth);
end 

always
begin
#10	clk = !clk;
end

always @(negedge clk)
begin
	reset = 1'b0;
	if(count > 3)begin
		$monitor("A:%b B:%b Result:%b", mult, multiplier, result_out);
		$finish;
	end
	count = count+1;
end

endmodule 
