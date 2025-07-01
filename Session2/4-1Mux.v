module 4mux(
 input wire d[3:0],
 input wire sel[1:0],
 output reg y[3:0]
);
wire and1,and2,and3,and4;
and(and1,~sel[1],~sel[0],d[0]);
and(and2,~sel[1],sel[0],d[1]);
and(and3,sel[1],~sel[0],d[2]);
and(and4,sel[1],sel[0],d[3]);
or(y,and1,and2,and3,and4);

endmodule