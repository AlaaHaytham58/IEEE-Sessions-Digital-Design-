module dual_port_ram_tb;

  // Parameters
  parameter DATA_WIDTH = 8;
  parameter ADDR_WIDTH = 4;

  // Inputs
  reg clk;
  reg we_a;
  reg we_b;
  reg [ADDR_WIDTH-1:0] addr_a;
  reg [ADDR_WIDTH-1:0] addr_b;
  reg [DATA_WIDTH-1:0] din_a;
  reg [DATA_WIDTH-1:0] din_b;

  // Outputs
  wire [DATA_WIDTH-1:0] dout_a;
  wire [DATA_WIDTH-1:0] dout_b;

  // Instantiate the Dual Port RAM
  Dual_port_ram #(DATA_WIDTH, ADDR_WIDTH) dut (
    .clk(clk),
    .we_a(we_a),
    .we_b(we_b),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .din_a(din_a),
    .din_b(din_b),
    .dout_a(dout_a),
    .dout_b(dout_b)
  );
  reg [DATA_WIDTH-1:0] memory [0:ADDR_DEPTH-1];

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end


  initial begin
    clk = 0;
    we_a = 0;
    we_b = 0;
    addr_a = 0;
    addr_b = 0;
    din_a = 0;
    din_b = 0;
    #10;
    $readmemh("memory_init.txt", dut.ram); // loadmemory from file
    // Write to port A and b
    for(int i=0;i<ADDR_WIDTH;i=i+1)begin
        #10;
        we_a = 1;
        addr_a = i;
        din_a = memory[i];
        we_b = 1;
        addr_b = i+1;
        din_b = memory[i+1];
        #10;
        we_a = 0;
        we_b = 0;
        if(dut.ram[i]==memory[i]) begin
            $display("Port A Write Success at address %d: %h", i, dut.ram[i]);
        end else begin
            $display("Port A Write Failed at address %d: Expected %h, Got %h", i, memory[i], dut.ram[i]);
        end
        if(dut.ram[i+1]==memory[i+1]) begin
            $display("Port B Write Success at address %d: %h", i+1, dut.ram[i+1]);
        end else begin
            $display("Port B Write Failed at address %d: Expected %h, Got %h", i+1, memory[i+1], dut.ram[i+1]);
        end
    end
  end
  endmodule