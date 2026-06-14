# FPGA SPI Master-Slave Validation Framework

## Project Overview

### Objective

Design and validate a 24-bit SPI Master-Slave communication system on a Nexys A7 FPGA using Verilog HDL. The project demonstrates real-time hardware verification through Xilinx Vivado's Integrated Logic Analyzer (ILA) and Virtual Input/Output (VIO).

### Features

* 24-bit SPI Master implementation
* SPI Slave memory capture architecture
* Internal memory readback mechanism
* FPGA deployment on Nexys A7
* Real-time hardware debugging using ILA and VIO
* Data verification through memory monitoring

---

## System Architecture

```text
             +-------------+
             |     VIO     |
             +------+------+
                    |
                    v
         +----------+----------+
         |      SPI Master     |
         +----------+----------+
                    |
    +---------------+----------------+
    | spi_clk  spi_en  mosi          |
    +---------------+----------------+
                    |
                    v
         +----------+----------+
         |      SPI Slave      |
         +----------+----------+
                    |
                    v
            +-------+-------+
            | Internal RAM  |
            +-------+-------+
                    |
                    v
            +-------+-------+
            | Memory Read   |
            +-------+-------+
                    |
                    v
                +---+---+
                |  ILA  |
                +-------+
```

---

## SPI Master Architecture

### Inputs

| Signal      | Width | Description      |
| ----------- | ----- | ---------------- |
| clk         | 1     | System Clock     |
| rst_n       | 1     | Active-Low Reset |
| start       | 1     | Transfer Trigger |
| master_data | 24    | Data to Transmit |

### Outputs

| Signal  | Width |
| ------- | ----- |
| spi_clk | 1     |
| spi_en  | 1     |
| mosi    | 1     |
| busy    | 1     |

---

## SPI Master FSM

```text
IDLE
  |
  v
LOAD
  |
  v
SEND
  |
  v
DONE
  |
  v
IDLE
```

---

## SPI Slave Architecture

The slave captures incoming SPI data on the rising edge of the SPI clock and stores it into internal memory.

### Memory Storage Logic

```verilog
mem[write_addr] <= {spi_en, spi_mosi};
```

### Stored Values

| spi_en | spi_mosi | Stored Value |
| ------ | -------- | ------------ |
| 1      | 0        | 2            |
| 1      | 1        | 3            |

---

## Memory Readback Mechanism

```text
start_mem_read
        |
        v
Sequential Memory Read
        |
        v
mem_read_data
        |
        v
ILA Capture
```

---

## Hardware Platform

* FPGA Board: Nexys A7
* FPGA Device: Artix-7
* Toolchain: Xilinx Vivado
* Language: Verilog HDL

---

## Skills Demonstrated

* RTL Design
* FPGA Implementation
* SPI Protocol Design
* Hardware Verification
* On-Chip Debugging
* Memory Architecture Design
