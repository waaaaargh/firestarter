module memory(address, in, out, write);
   input [7:0] in;
   input [7:0] address;
   input       write;
   reg [7:0] my_memory [0:255];
   output [7:0] out;
   reg [7:0] out;

   integer   i;

   initial begin
      for(i=0; i<256; i = i+1) begin
	 my_memory[i] <= 0;
      end
   end

   always @ (address or write) begin
      if (write) begin
	 my_memory[address] <= in;
	 out <= in;
      end else begin
	 out <= my_memory[address];
      end
   end
endmodule // memory
