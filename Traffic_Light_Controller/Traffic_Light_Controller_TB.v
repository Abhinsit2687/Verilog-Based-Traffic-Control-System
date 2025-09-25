module Traffic_Light_Controller_TB;
    reg clk, rst;
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    // Instantiate DUT
    Traffic_Light_Controller dut (
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_S(light_S),
        .light_M2(light_M2),
        .light_MT(light_MT)
    );

    // Clock generation (10 time units period)
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;   // toggle every 5 -> 10 time units period
    end

    // Reset stimulus
    initial begin
        rst = 0;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #200;   // run for some time
        $finish;
    end

    // Dump signals for GTKWave
    initial begin
        $dumpfile("wave.vcd");      
        $dumpvars(0, Traffic_Light_Controller_TB); 
    end

endmodule
