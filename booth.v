module booth(

//Output
result,

//Input
multiplicand,
multiplier,
count,
clk,
reset
);

//Output
output [7:0] result;

//Input
input [7:0] multiplicand;
input [3:0] multiplier;
input [2:0] count;
input clk, reset;

reg [7:0] result_in, pass, temp;
reg operation;

add a(result, 
      result_in, 
      pass,
      clk,
      reset
     );

always@(posedge clk, result)
begin
	result_in = result; 
	operation = multiplier[(count-1)%4];
	temp = multiplicand << (count-1);
	pass = operation ? temp : 8'b00000000;
end

endmodule
