module memory_tb;
   reg [7:0] in, address;
   reg 	     write;
   
   wire [7:0] out;

   initial begin
      address <= 0;
      in <= 0;
      write = 0;
      
      $monitor("address:%b, in:%b, write:%b, out:%b", address, in, write, out);
      address <= 23;
      in <= 23;
      write <= 1;
      #5;
      write <= 0;
      #5;

      address <= 42;

      #5;

      address <= 23;
      
      $finish;
   end

   memory m_ut ( .in (in),
		 .address (address),
		 .write (write),
		 .out (out));
endmodule // memory_tb
