module adder(A, B, sum);
   input [15:0] A,B;
   output [15:0] sum;
   reg [15:0] 	 sum;

   always @ ( A or B ) begin
      sum = A + B;
   end
endmodule // adder
