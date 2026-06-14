//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Sat Jun 13 20:04:50 2026
//Host        : TANUJA running 64-bit major release  (build 9200)
//Command     : generate_target SPI_bd.bd
//Design      : SPI_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SPI_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SPI_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "SPI_bd.hwdef" *) 
module SPI_bd
   (clk_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN SPI_bd_clk_0, FREQ_HZ 100000000, PHASE 0.000" *) input clk_0;

  wire [0:0]Net;
  wire clk_0_1;
  wire spi_master_24_0_busy;
  wire spi_master_24_0_mosi;
  wire spi_master_24_0_spi_clk;
  wire spi_master_24_0_spi_en;
  wire [1:0]spi_slave_bit_store_0_mem_read_data;
  wire [7:0]spi_slave_bit_store_0_write_addr;
  wire spi_slave_bit_store_0_write_pulse;
  wire [0:0]vio_0_probe_out0;
  wire [0:0]vio_0_probe_out1;
  wire [23:0]vio_0_probe_out2;

  assign clk_0_1 = clk_0;
  SPI_bd_ila_0_0 ila_0
       (.clk(clk_0_1),
        .probe0(vio_0_probe_out0),
        .probe1(vio_0_probe_out1),
        .probe2(vio_0_probe_out2),
        .probe3(spi_slave_bit_store_0_write_addr),
        .probe4(spi_slave_bit_store_0_write_pulse),
        .probe5(spi_master_24_0_busy),
        .probe6(spi_slave_bit_store_0_mem_read_data),
        .probe7(Net),
        .probe8(spi_master_24_0_mosi));
  SPI_bd_spi_master_24_0_0 spi_master_24_0
       (.busy(spi_master_24_0_busy),
        .clk(clk_0_1),
        .master_data(vio_0_probe_out2),
        .mosi(spi_master_24_0_mosi),
        .rst_n(vio_0_probe_out0),
        .spi_clk(spi_master_24_0_spi_clk),
        .spi_en(spi_master_24_0_spi_en),
        .start(vio_0_probe_out1));
  SPI_bd_spi_slave_bit_store_0_0 spi_slave_bit_store_0
       (.clk(clk_0_1),
        .mem_read_data(spi_slave_bit_store_0_mem_read_data),
        .rst_n(vio_0_probe_out0),
        .spi_clk(spi_master_24_0_spi_clk),
        .spi_en(spi_master_24_0_spi_en),
        .spi_mosi(spi_master_24_0_mosi),
        .start_mem_read(Net),
        .write_addr(spi_slave_bit_store_0_write_addr),
        .write_pulse(spi_slave_bit_store_0_write_pulse));
  SPI_bd_vio_0_0 vio_0
       (.clk(clk_0_1),
        .probe_in0(spi_slave_bit_store_0_write_addr),
        .probe_in1(spi_slave_bit_store_0_write_pulse),
        .probe_in2(spi_master_24_0_busy),
        .probe_in3(spi_slave_bit_store_0_mem_read_data),
        .probe_in4(spi_master_24_0_mosi),
        .probe_out0(vio_0_probe_out0),
        .probe_out1(vio_0_probe_out1),
        .probe_out2(vio_0_probe_out2),
        .probe_out3(Net));
endmodule
