# 🧠 Dual Port RAM using Verilog HDL

A synthesizable **Dual Port RAM** designed using Verilog HDL. This project demonstrates simultaneous memory read and write operations using separate read and write addresses. It is a fundamental digital design component widely used in processors, FPGA-based systems, communication interfaces, and embedded applications.

---

# 📖 What is RAM?

**RAM (Random Access Memory)** is a memory device used to temporarily store data that can be read or written during system operation.

Unlike ROM, RAM allows both **read** and **write** operations. The stored data is **volatile**, meaning the contents are lost when power is removed.

In digital systems, RAM is commonly used for:

- Temporary data storage
- Processor working memory
- Buffers
- FIFOs
- Cache memory
- FPGA and ASIC designs

---

# 🧠 What is Dual Port RAM?

A **Dual Port RAM** allows two independent memory accesses.

One port is used for writing data into memory, while another port is used for reading data from memory.

This enables simultaneous read and write operations, improving system performance.

### Advantages

- Simultaneous Read and Write
- High-speed memory access
- Efficient data buffering
- Widely used in FPGA and ASIC designs

---

# ⚙️ Features

- Synthesizable Verilog RTL
- Separate Read and Write Addresses
- Synchronous Read and Write
- Active High Reset
- 8-bit Data Width
- 1024 Memory Locations
- Supports Read, Write and Read+Write Operations

---

# 📐 Memory Organization

| Parameter | Value |
|-----------|-------|
| Memory Type | Dual Port RAM |
| Data Width | 8 bits |
| Address Width | 10 bits |
| Memory Depth | 1024 Locations |
| Total Memory | 8 Kbits (1024 × 8 bits) |
| Read Type | Synchronous |
| Write Type | Synchronous |

---

# 🔌 Input and Output Ports

| Port | Width | Direction | Description |
|------|------:|-----------|-------------|
| `clock` | 1 | Input | System clock used for synchronous operations |
| `reset` | 1 | Input | Resets the output register and initializes memory (implementation dependent) |
| `write_en` | 1 | Input | Enables write operation |
| `read_en` | 1 | Input | Enables read operation |
| `wr_addr` | 10 | Input | Memory address used for writing data |
| `rd_addr` | 10 | Input | Memory address used for reading data |
| `data_in` | 8 | Input | Data to be written into memory |
| `data_out` | 8 | Output | Data read from memory |

---

# 🏗️ Block Diagram

```
                 +----------------------+
                 |    Dual Port RAM     |
                 |                      |
 Data In ------->|                      |
 Write Address ->|                      |
 Write Enable -->|                      |-----> Data Out
                 |                      |
 Read Address -->|                      |
 Read Enable --->|                      |
                 +----------------------+
                        ↑
                     Clock
```

---

# 🔄 Working Principle

### Write Operation

When **write_en = 1**, the input data is stored in the memory location specified by `wr_addr`.

```
mem[wr_addr] <= data_in;
```

---

### Read Operation

When **read_en = 1**, the data stored at `rd_addr` is transferred to the output register.

```
data_out <= mem[rd_addr];
```

---

### Simultaneous Read and Write

When both **write_en** and **read_en** are HIGH,

- New data is written into `wr_addr`
- Existing data is read from `rd_addr`

Both operations occur on the same clock edge.

---

### Reset Operation

When `reset = 1`

- Output register is cleared
- Memory initialization can be performed if implemented

---

# 📊 Truth Table

| Reset | Write Enable | Read Enable | Operation |
|-------:|-------------:|------------:|-----------|
| 1 | X | X | Reset Output |
| 0 | 0 | 0 | Idle |
| 0 | 1 | 0 | Write Data |
| 0 | 0 | 1 | Read Data |
| 0 | 1 | 1 | Simultaneous Read and Write |

---

# 💻 Tools Used

- Verilog HDL
- Xilinx Vivado
- ModelSim / Vivado Simulator
- Git & GitHub

---

# 📂 Project Structure

```
Dual_Port_RAM/
│── dual_port_ram.v
│── dual_port_ram_tb.v
│── README.md
│── simulation/
│── waveform/
```

---

# 🎯 Applications

- FPGA Design
- ASIC Design
- Processor Memory
- FIFO Implementation
- Data Buffers
- Communication Systems
- Embedded Systems

---

# 📚 Concepts Covered

- Verilog HDL
- Sequential Logic
- Memory Design
- Dual Port Memory
- Synchronous Read
- Synchronous Write
- Address Decoding
- Register Arrays

---

# 👨‍💻 Author

**Naveenraj Senthilkumar**

Electronics and Communication Engineering (ECE)

Passionate about **VLSI, RTL Design, FPGA Development, Digital Design, and Computer Architecture.**
