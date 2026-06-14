# Validation Flow

## Verification Methodology

The project follows a complete digital design verification flow from RTL development to FPGA hardware validation.

```text
RTL Design
    |
    v
Simulation
    |
    v
Synthesis
    |
    v
Implementation
    |
    v
Bitstream Generation
    |
    v
FPGA Programming
    |
    v
Hardware Validation
```

---

## Simulation Verification

### Test Case 1

#### Input

```text
0xA55AF0
```

#### Expected Behavior

* SPI Master transmits 24 bits
* SPI Slave samples on SPI clock rising edge
* Memory stores received values

#### Result

PASS

---

### Test Case 2

#### Input

```text
0x555555
```

#### Binary Representation

```text
010101010101010101010101
```

#### Expected Stored Pattern

```text
3,2,3,2,3,2,3,2...
```

#### Result

PASS

---

### Test Case 3

#### Input

```text
0x123456
```

#### Result

PASS

---

## Hardware Validation Setup

### Debug Infrastructure

* Integrated Logic Analyzer (ILA)
* Virtual Input Output (VIO)

### Signals Monitored

| Signal        |
| ------------- |
| spi_clk       |
| spi_en        |
| mosi          |
| busy          |
| write_addr    |
| write_pulse   |
| mem_read_data |

---

## FPGA Validation Procedure

### Step 1

Program the Nexys A7 FPGA.

### Step 2

Configure VIO inputs:

* rst_n
* start
* master_data

### Step 3

Trigger SPI transfer.

### Step 4

Observe SPI activity using ILA.

### Step 5

Verify:

* SPI clock generation
* Enable signal assertion
* MOSI data transmission
* Memory write operation

### Step 6

Trigger memory readback.

### Step 7

Capture memory contents using ILA.

### Step 8

Export captured data for analysis.

---

## Validation Objectives

* Verify SPI protocol functionality
* Verify memory storage correctness
* Verify hardware timing behavior
* Verify FPGA implementation
* Validate end-to-end data flow
