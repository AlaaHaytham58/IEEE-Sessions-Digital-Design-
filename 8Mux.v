module 8bit-mux
(
    input wire [7:0] d, 
    input wire [2:0] sel, 
    output reg y 
);
4mux mux0 (
    .d(d[3:0]),
    .sel(sel[1:0]),
    .y(y0)
);
4mux mux1 (
    .d(d[7:4]),
    .sel(sel[1:0]),
    .y(y1)
);
assign y = (sel[2] == 0) ? y0 : y1; 
endmodule