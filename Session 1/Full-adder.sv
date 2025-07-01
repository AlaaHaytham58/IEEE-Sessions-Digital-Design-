module fulladder
(
    input wire a, 
    input wire b, 
    input wire cin, 
    output wire sum, 
    output wire cout 
);
wire sum1,cout1,c2;
.half_adder h1(
    .a(a),
    .b(b),
    .sum(sum1),
    .cout(cout1)
);
.half_adder h2(
    .a(sum1),
    .b(cin),
    .sum(sum),
    .cout(c2)
);
or(cout, cout1, c2);
endmodule