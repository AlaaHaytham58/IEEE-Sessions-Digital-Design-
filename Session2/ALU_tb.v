`timescale 1ps/1ps
module ALU_tb
(
    input wire enable,
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [1:0] opcode,
    output reg [3:0] out,
    output reg cout
);
ALU uut (
    .enable(enable),
    .A(A),
    .B(B),
    .opcode(opcode),
    .out(out),
    .cout(cout)
);
task testALU;
    case(opcode)
    
        2'b00:if({cout,out}!==A+B)$display("Error Operation is wrong at time %0t",$time);
        2'b01:if({cout,out}!==A-B)$display("Error Operation is wrong at time %0t",$time);
        2'b10:if({cout,out}!==A&B)$display("Error Operation is wrong at time %0t",$time);
        2'b11:if({cout,out}!==A)$display("Error Operation is wrong at time %0t",$time);
    endcase
Endtask

initial begin
   A=0;B=0;opcode=0;enable=1;
   #10;
   repeat(100)begin
       A = $random ;
       B = $random ; 
       opcode = $random ;
       #10;
       testALU();
       enable=0;
       #10;
       $stop;
   end
   initial begin
       $monitor("Time: %0t, A: %b, B: %b, Opcode: %b, Cout: %b, Out: %b", $time, A, B, opcode, cout, out);
   end
end

endmodule