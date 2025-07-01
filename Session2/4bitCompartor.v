module comparator (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire EN,
    output reg equal,
    output reg greater,
    output reg less
);

always @(*)
begin
    if (EN) begin
        if (A == B) begin
            equal = 1;
            greater = 0;
            less = 0;
        end else if (A > B) begin
            equal = 0;
            greater = 1;
            less = 0;
        end else begin
            equal = 0;
            greater = 0;
            less = 1;
        end
    end else begin
        equal = 0;
        greater = 0;
        less = 0;
    end
end

endmodule
