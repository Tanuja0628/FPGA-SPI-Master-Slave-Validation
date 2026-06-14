# FPGA SPI Master-Slave Validation Framework

> A complete FPGA implementation and hardware validation framework for a 24-bit SPI communication system using Verilog HDL, Vivado ILA, and VIO on the Nexys A7 FPGA.

![FPGA](https://img.shields.io/badge/Platform-Nexys%20A7-blue)
![Verilog](https://img.shields.io/badge/Language-Verilog-orange)
![Vivado](https://img.shields.io/badge/Tool-Xilinx%20Vivado-green)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## Overview

This project was developed as part of my work at the **Integrated Systems Laboratory (ISL), College of Engineering Guindy, Anna University**.

The objective was not merely to implement an SPI Master and Slave, but to establish a complete hardware verification workflow capable of:

* Generating SPI transactions in hardware
* Capturing serial data in FPGA memory
* Reading back stored memory contents
* Verifying functionality using on-chip debug tools
* Performing real-time hardware validation without external test equipment

The project demonstrates the journey from RTL design to FPGA deployment and hardware debugging.

---

## Why This Project?

While SPI implementations are common, verifying internal memory transactions on hardware is often challenging.

This project addresses that challenge by integrating:

* SPI protocol implementation
* FPGA memory architecture
* Vivado Virtual Input/Output (VIO)
* Integrated Logic Analyzer (ILA)
* Internal memory readback mechanisms

This enables complete visibility of the data path from transmission to storage.

---

## Key Features

### SPI Master

* 24-bit serial data transmission
* Configurable clock divider
* FSM-based architecture
* Busy indication
* MSB-first transmission

### SPI Slave

* Rising-edge data sampling
* Internal memory storage
* Address generation logic
* Sequential memory readback

### Hardware Debug Infrastructure

* Runtime data injection through VIO
* Internal signal observation through ILA
* Memory verification without external interfaces

---

## Project Workflow

```text
VIO
 │
 ▼
SPI Master
 │
 ▼
SPI Signals
 │
 ▼
SPI Slave
 │
 ▼
Memory Storage
 │
 ▼
Memory Readback
 │
 ▼
ILA Capture
 │
 ▼
Verification
```

---

## Example Transaction

### Input

```text
0x555555
```

### Binary Representation

```text
010101010101010101010101
```

### Stored Memory Pattern

```text
3 2 3 2 3 2 3 2 ...
```

where:

```text
{spi_en, spi_mosi}
```

is stored at each memory location.

---

## Repository Structure

```text
FPGA-SPI-Master-Slave-Validation
│
├── rtl/
│   ├── spi_master_24.v
│   ├── spi_slave_bit_store.v
│
├── testbench/
│   └── tb_master_slave_bit_store.v
│
├── constraints/
│   └── nexys_a7.xdc
│
├── block_design/
│   └── SPI_bd.png
│
├── docs/
│   ├── Architecture.md
│   ├── Validation_Flow.md
│   └── Results.md
│
├── waveforms/
│   ├── simulation_waveform.png
│   └── ila_capture.png
│
└── README.md
```

---

## Technologies Used

* Verilog HDL
* Xilinx Vivado
* Integrated Logic Analyzer (ILA)
* Virtual Input Output (VIO)
* Nexys A7 FPGA
* Artix-7 Architecture

---

## Skills Demonstrated

* RTL Design
* Digital System Design
* FPGA Prototyping
* SPI Protocol Development
* Hardware Verification
* Timing Analysis
* FPGA Debug Methodologies
* Memory Architecture Design
* On-Chip Instrumentation

---

## Engineering Challenges

### SPI Clock Completion

Ensured that all 24 transmitted bits were sampled correctly before terminating the SPI transaction.

### Internal Memory Visibility

Developed a readback mechanism to observe memory contents that are otherwise inaccessible from FPGA fabric.

### Hardware Debugging

Built a structured debugging flow using Vivado ILA and VIO to validate functionality directly on silicon.

---

## Results

✔ Successful 24-bit SPI communication

✔ Successful memory storage verification

✔ FPGA deployment on Nexys A7

✔ Hardware validation using ILA and VIO

✔ Internal memory readback functionality

✔ End-to-end data flow verification

---

## Future Enhancements

* Full-duplex SPI support
* BRAM-based memory architecture
* UART data export
* AXI-Lite integration
* Automated memory dump generation
* DMA-based transfers

---

## Author

**Tanuja Sree R**

Student Researcher

Integrated Systems Laboratory (ISL)

College of Engineering Guindy (CEG)

Anna University

---
