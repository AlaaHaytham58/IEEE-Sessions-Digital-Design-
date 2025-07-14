module up_downcounter (
    input wire clk,
    input wire rst,
    input wire up_down, 
    output reg [3:0] count
);
always @(posedge clk ) begin
    if (rst) begin
        count <= 4'b0000; 
    end else begin
        if (up_down &&count !=4'b1111) begin
            count <= count + 1;
        end else begin
            count <= count - 1; 
        end
    end
end
endmodule