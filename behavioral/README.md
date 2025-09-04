# Behavioral 16-bit Adder

## 📌 Overview
This module implements a **16-bit adder** using a **behavioral approach** in Verilog.  
Relies on the built-in `+` operator for simplicity and compactness.

## 🛠️ Features
- 16-bit signed addition.
- Outputs **sign**, **zero**, **carry**, **parity**, and **overflow** flags.
- Minimalistic design for quick prototyping.

## 📂 Files
- `behav_adder.v` → Verilog code
- `behav_adderTB.v` → Testbench

## 🧩 How It Works
```verilog
assign {carry, z} = x + y;
assign sign      = z[15];
assign zero      = ~|z;
assign parity    = ~^z;
assign overflow  = (x[15] & y[15] & ~z[15]) | (~x[15] & ~y[15] & z[15]);

## 🧪 Simulation
```bash
iverilog -o <file_name>.out behav_adderTB.v behav_adder.v
vvp <file_name>.out