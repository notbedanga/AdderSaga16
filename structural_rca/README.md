### **str_rca_adder/README.md**

```markdown
# Structural 16-bit Ripple Carry Adder (RCA)

## 📌 Overview
This implementation builds a **16-bit ripple carry adder** using **structural Verilog**.  
It chains **four 4-bit adders**, each built from **full adders**.

## 🛠️ Features
- 16-bit binary addition.
- Outputs **sign**, **zero**, **carry**, **parity**, and **overflow**.
- Ideal for understanding how adders work at the gate level.

## 📂 Files
- `str_rca_adder.v` → Verilog code
- `str_rca_adderTB.v` → Testbench

## 🧩 How It Works
- Each **full adder** computes:
    ```verilog
    s = a ^ b ^ cin;
    cout = (a & b) | (b & cin) | (cin & a);
    ```
- Four 4-bit adders are cascaded for **16-bit computation**.

## 🧪 Simulation
```bash
iverilog -o <file_name>.out str_rca_adderTB.v str_rca_adder.v
vvp <file_name>.out