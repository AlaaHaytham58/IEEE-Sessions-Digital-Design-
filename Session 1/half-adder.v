module half_adder
(
input wire A, B,
output reg Sum, Carry
);
always @(*) begin
    Sum = A ^ B; 
    Carry = A & B; 
end
    
endmodule