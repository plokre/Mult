module full_adder(
// Outputs
sum,
c_out,

// Inputs
a,
b,
c_in,
clk,
reset
);

// Outputs
output sum;
output c_out;	

// Inputs
input a;
input b;
input c_in;
input clk;
input reset;

reg s, c;

always@(posedge clk, c_in)
begin
	if(reset == 1'b1) begin
		s = 1'b0;
		c = 1'b0;
	end else begin
		s = a ^ b ^ c_in;
		c = (a & b) | (a & c_in) | (b & c_in);
	end
end

assign sum = s;
assign c_out = c;

endmodule
