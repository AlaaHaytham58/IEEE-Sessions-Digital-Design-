module dlatch (
    input wire D,
    input wire enable
    output reg Q
);
always @(*) begin
    if(enable)
    begin
        Q<= D;

    end
    else begin
        Q <=0; 
    end
end
endmodule