module Dual_port_ram #(parameter
  DATA_WIDTH = 8,
  ADDR_WIDTH = 4
)(
  input wire clk,
  input wire we_a,
  input wire we_b,
  input wire [ADDR_WIDTH-1:0] addr_a,
  input wire [ADDR_WIDTH-1:0] addr_b,
  input wire [DATA_WIDTH-1:0] din_a,
  input wire [DATA_WIDTH-1:0] din_b,
  output reg [DATA_WIDTH-1:0] dout_a,
  output reg [DATA_WIDTH-1:0] dout_b
);

  // Memory array
  reg [DATA_WIDTH-1:0] ram [(2**ADDR_WIDTH)-1:0];
  always @(posedge clk) begin
    if (we_a) begin
      ram[addr_a] <= din_a;
    end
    dout_a <= ram[addr_a];
     if (we_b) begin
      ram[addr_b] <= din_b;
    end
    dout_b <= ram[addr_b];
  end


endmodule
