// spi_master_24.v


module spi_master_24 #(
    parameter DIV = 50   
)(
    input  wire        clk,        
    input  wire        rst_n,       
    input  wire        start,       
    input  wire [23:0] master_data, 

    output reg         spi_clk,    
    output reg         spi_en,     
    output reg         mosi,       
    output reg         busy        
);

    reg [15:0] div_cnt;
    reg        spi_clk_int;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            div_cnt     <= 16'd0;
            spi_clk_int <= 1'b0;
        end else if (busy) begin
            if (div_cnt == DIV-1) begin
                div_cnt     <= 16'd0;
                spi_clk_int <= ~spi_clk_int;
            end else begin
                div_cnt <= div_cnt + 16'd1;
            end
        end else begin
            div_cnt     <= 16'd0;
            spi_clk_int <= 1'b0;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            spi_clk <= 1'b0;
        else
            spi_clk <= spi_clk_int;
    end

    reg [1:0] state, next_state;
    localparam IDLE = 2'b00,
               LOAD = 2'b01,
               SEND = 2'b10,
               DONE = 2'b11;

    reg [4:0]  bit_cnt;  
    reg [23:0] shift_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (start)
                    next_state = LOAD;
            end

            LOAD: begin
                next_state = SEND;
            end

            SEND: begin
                 if (bit_cnt == 5'd24 && spi_clk_int == 1'b1 && div_cnt == DIV-1)
                     next_state = DONE;
            end


            DONE: begin
                next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            spi_en    <= 1'b0;
            mosi      <= 1'b0;
            busy      <= 1'b0;
            bit_cnt   <= 5'd0;
            shift_reg <= 24'd0;
        end else begin
            case (state)
                IDLE: begin
                    busy    <= 1'b0;
                    spi_en  <= 1'b0;
                    mosi    <= 1'b0;
                    bit_cnt <= 5'd0;
                    if (start) begin
                        shift_reg <= master_data;
                    end
                end

                LOAD: begin
                    busy    <= 1'b1;
                    spi_en  <= 1'b1;    
                    bit_cnt <= 5'd0;
                end

                SEND: begin
                    busy   <= 1'b1;
                    spi_en <= 1'b1;

                    if (spi_clk_int == 1'b0 && div_cnt == DIV-1 && bit_cnt < 5'd24) begin
                        mosi      <= shift_reg[23];
                        shift_reg <= {shift_reg[22:0], 1'b0};
                        bit_cnt   <= bit_cnt + 5'd1;
                    end

                end

                DONE: begin
                    busy   <= 1'b0;
                    spi_en <= 1'b0;
                end

                default: begin
                    busy   <= 1'b0;
                    spi_en <= 1'b0;
                end
            endcase
        end
    end

endmodule
