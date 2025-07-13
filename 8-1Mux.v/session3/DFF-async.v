module DFF_async (input clk,
   input rst,
   input[7:0] D,
   output reg[7:0] Q
);
always@(posedge clk or posedge rst)
begin
   if (rst)begin
      Q <= 8'b0; // Reset the output to zero
   else
      Q <= D; // Assign input D to output Q on clock edge
   end
end // always
endmodule