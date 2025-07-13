timescale 10ns/10ns
module  dlatch_tb
(
    input wire D,
    input wire enable,
    output reg Q
);
dlatch uut (
    .D(D),
    .enable(enable),
    .Q(Q)
);
task testDLATCH;
    if (enable) begin
        if (Q !== D) begin
            $display("Error: Q does not match D at time %0t", $time);
        end
    end else begin
        if (Q !== 0) begin
            $display("Error: Q should be 0 when enable is low at time %0t", $time);
        end
    end
endtask
initial begin
   D=0;enable=1;
   #10;
   repeat(100)begin
       D = $random ;
       enable = $random ;
       testDLATCH();
       enable=0;
       #10;
       $stop;
   end
   initial begin
       $monitor("Time: %0t, D: %b, Enable: %b, Q: %b", $time, D, enable, Q);
   end
end
endmodule
