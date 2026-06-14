// spi_slave_bit_store.v 
module spi_slave_bit_store #(
    parameter MEM_DEPTH = 256
)(
    input  wire        clk,
    input  wire        rst_n,
    input wire         start_mem_read,
    input  wire        spi_clk,
    input  wire        spi_en,
    input  wire        spi_mosi,

    output reg  [7:0]  write_addr,
    output reg         write_pulse,
    output reg  [1:0] mem_read_data
);

    reg [1:0] mem [0:MEM_DEPTH-1];
    reg spi_clk_d;
    wire spi_clk_rise = (spi_clk == 1'b1) && (spi_clk_d == 1'b0);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            spi_clk_d <= 1'b0;
        else
            spi_clk_d <= spi_clk;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            write_addr  <= 8'd0;
            write_pulse <= 1'b0;
        end else begin
            write_pulse <= 1'b0;
            if (spi_clk_rise) begin
                mem[write_addr] <= {spi_en, spi_mosi}; 
                write_pulse     <= 1'b1;
                write_addr      <= write_addr + 8'd1;
                
            end
        end
    end
    reg [7:0] j;
    reg mem_read_done;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            j <= 0;
            mem_read_data <= 0;
            mem_read_done <= 0;
        end 
        else if (start_mem_read) begin
            if (j < 24) begin
                mem_read_data <= mem[j];
                j <= j + 1;
                mem_read_done <= 0;
            end else begin
                mem_read_done <= 1;
            end
        end else begin
            j <= 0;
            mem_read_done <= 0;
        end
    end
endmodule
