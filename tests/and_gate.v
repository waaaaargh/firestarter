module and_gate_tb;

   reg in_0, in_1;
   wire out;

   initial begin
      $monitor("in_0:%b;in_1:%b;out:%b", in_0, in_1, out);
      in_0 = 0;
      in_1 = 0;
      #5  in_0 = 1;
      #10 in_1 = 1;
      #15 in_0 = 0;
      $finish;
   end 

   and_gate gate_under_test ( .in_0 (in_0),
			      .in_1 (in_1),
			      .out(out) );

endmodule // and_gate_tb
