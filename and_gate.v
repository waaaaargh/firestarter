module and_gate(in_0, in_1, out);

   input in_0, in_1;

   output out;
   reg 	  out;

   initial begin
      out = 0;
   end

   always @ ( in_0 or in_1 ) begin
      out = in_0 && in_1;
   end

endmodule // and_gate
