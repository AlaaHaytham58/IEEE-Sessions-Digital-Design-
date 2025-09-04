module single_port_ram #(parameter
  DATA_WIDTH = 8,
  ADDR_WIDTH = 4
)(
  input wire clk,
  input wire we,
  input wire reset,
  input wire [ADDR_WIDTH-1:0] addr,
  input wire [DATA_WIDTH-1:0] din,
  output reg [DATA_WIDTH-1:0] dout
);

  // Memory array
  reg [DATA_WIDTH-1:0] ram [(2**ADDR_WIDTH)-1:0];
integer i;
  always @(posedge clk) begin
    if(resert) begin
      for(i=0;i<(2**ADDR_WIDTH);i=i+1) begin
        ram[i]<=0;
      end
       dout <= 0;
    end
else begin
    if (we) begin
      ram[addr] <= din;
          dout <= ram[addr];

    end
  end
end

endmodule