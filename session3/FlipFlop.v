module stateff
(
    input wire clk,
    input wire rst,
    input wire D,
    output reg Q,
    output reg Qn
);
parameter FF_TYPE = "DFF";
if (FF_TYPE == "DFF") begin
    always @(negedge clk or negedge rst) begin
        if (rst == 0) begin
            Q <= 0; 
            Qn <= 1; 
        end else begin
            Q <= D; 
            Qn <= ~D; 
        end
    end
end else if (FF_TYPE == "TFF") begin
    always @(negedge clk or negedge rst) begin
        if (rst == 0) begin
            Q <= 0; 
            Qn <= 1;
        end else begin
            Q <= ~Q; 
            Qn <= ~Q; 
        end
    end
end 

endmodule