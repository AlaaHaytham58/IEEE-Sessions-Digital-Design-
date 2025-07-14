timescale 10ns/10ns
module FlipFlop_tb
(
    input wire clk,
    input wire rst,
    input wire D,
    output reg Q,
    output reg Qn
);
stateff uut (
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q),
    .Qn(Qn)
);
task testflipflop;
if(FF_TYPE=="DFF")begin
    if(rst) begin
        if(Q !== 0 || Qn !== 1) begin
            $display("Error: Q or Qn not reset at time %0t", $time);
        end
        else begin
            if(Q !== D || Qn !== ~D) begin
                $display("Error: Q or Qn does not match D at time %0t", $time);
            end
        end
end
end else if(FF_TYPE=="TFF") begin
    if(rst) begin
        if(Q !== 0 || Qn !== 1) begin
            $display("Error: Q or Qn not reset at time %0t", $time);
        end
        else begin
            if(Q !== ~Q || Qn !== ~Q) begin
                $display("Error: Q or Qn does not toggle correctly at time %0t", $time);
            end
        end
    end
end
endtask
//inputs clk, rst, D
initial begin
    clk=0;
    rst=1;
    repeat(100) begin
        clk = ~clk; 
        D = $random; 
        #10;
        testflipflop();
    end
    
end
endmodule