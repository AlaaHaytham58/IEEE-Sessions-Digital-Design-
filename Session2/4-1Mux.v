module mux4 (
    input wire [3:0] d,
    input wire [1:0] sel,
    output wire y
);

wire and0, and1, and2, and3;
wire not_sel0, not_sel1;

not (not_sel0, sel[0]);
not (not_sel1, sel[1]);

and (and0, not_sel1, not_sel0, d[0]); 
and (and1, not_sel1, sel[0], d[1]);   
and (and2, sel[1], not_sel0, d[2]);   
and (and3, sel[1], sel[0], d[3]);     

or (y, and0, and1, and2, and3);

endmodule
