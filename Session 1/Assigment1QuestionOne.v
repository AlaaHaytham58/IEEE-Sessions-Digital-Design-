module Schematic-to-Verilog
(
    input wire A,B,
    output reg C   
);

wire D,E,F,G;
not(D, A);
not(E, B); 
and(F, D, E);
and (G, A, B);
or(C, F, G);
endmodule
