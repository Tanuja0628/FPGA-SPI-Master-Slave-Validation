// tb_master_slave_bit_store.v

`timescale 1ns/1ps

module tb_master_slave_bit_store;

    reg         clk;
    reg         rst_n;
    reg         start;
    reg  [23:0] master_data;

    wire        spi_clk;
    wire        spi_en;
    wire        mosi;
    wire        busy;

    wire [7:0]  write_addr;
    wire        write_pulse;

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        rst_n       = 1'b0;
        start       = 1'b0;
        master_data = 24'hA5_5A_F0; 

        #50;
        rst_n = 1'b1;

        #100;

        start = 1'b1;
        #10;
        start = 1'b0;

        #10000; 
        master_data = 24'h123456; 
        start = 1'b1;
        #10;
        start = 1'b0;

        #10000;
        $stop;
    end

    
    spi_master_24 #(
        .DIV(10) 
    ) u_master (
        .clk         (clk),
        .rst_n       (rst_n),
        .start       (start),
        .master_data (master_data),
        .spi_clk     (spi_clk),
        .spi_en      (spi_en),
        .mosi        (mosi),
        .busy        (busy)
    );

    
    spi_slave_bit_store #(
        .MEM_DEPTH(512)
    ) u_slave (
        .clk         (clk),
        .rst_n       (rst_n),
        .spi_clk     (spi_clk),
        .spi_en      (spi_en),
        .spi_mosi    (mosi),
        .write_addr  (write_addr),
        .write_pulse (write_pulse)
    );

endmodule
