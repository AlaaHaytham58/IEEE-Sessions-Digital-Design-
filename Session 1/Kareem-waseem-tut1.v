module tut1Q1
(
    input wire A, B,C,
    output reg X
    );
    
    reg D,E,F;
    always @(*) begin
        D=A&B;
       E=A&C;
       F=A&B&C;
    X=D|E|F; 
    end
    
endmodule