module lab2_ALU(
    input wire enable,
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [1:0] opcode,
    output reg [3:0] out
);
always @(*)
begin
    if (enable) begin
        case (opcode)
            2'b00: out = A + B;  
            2'b01: out = A - B;  
            2'b10: out = A & B;  
            2'b11: out = A ;  
            default: out = 4'b0000;
        endcase
    end else begin
        out = 4'b0000;
    end
end
endmodule