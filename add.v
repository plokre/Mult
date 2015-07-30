module add(

//Output
result,

//Input
result_in,
multiplicand,
clk,
res
);

//Output
output [7:0] result;

//Input
input [7:0] result_in;
input [7:0] multiplicand;
input clk;
input res;

wire c_in [7:0];

generate
	genvar i;
	full_adder f(result[0], 
	     	     c_in[0], 
	             multiplicand[0],
	             result_in[0], 
	             1'b0, 
	             clk,
		     res
	            );
	for (i=1; i<8 ; i=i+1) begin
		full_adder f(result[i], 
			     c_in[i], 
			     multiplicand[i],
			     result_in[i], 
			     c_in[i-1], 
			     clk,
			     res
			    );
	end
endgenerate

endmodule
