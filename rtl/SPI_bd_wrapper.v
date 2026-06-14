//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Sat Jun 13 20:04:50 2026
//Host        : TANUJA running 64-bit major release  (build 9200)
//Command     : generate_target SPI_bd_wrapper.bd
//Design      : SPI_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SPI_bd_wrapper
   (clk_0);
  input clk_0;

  wire clk_0;

  SPI_bd SPI_bd_i
       (.clk_0(clk_0));
endmodule
