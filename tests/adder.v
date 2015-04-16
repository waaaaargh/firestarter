module adder_tb;
   reg [15:0] A,B;
   wire [15:0] sum;
   
   initial begin
      A = 0;
      B = 0;
      $monitor("A:%b; B:%b; sum:%b", A, B, sum);
      #5 A = 23;
      B=42;
      #5 A = 42;
      B = 23;
      
      $finish;
   end

   adder adder_under_test(.A (A),
			  .B (B),
			  .sum (sum));
endmodule // adder_tb
