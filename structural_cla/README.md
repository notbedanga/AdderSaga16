### **str_cla_16adder/README.md**

```markdown
# Structural 16-bit Carry Lookahead Adder (CLA)

## 📌 Overview
This implementation builds a **16-bit carry lookahead adder** (CLA) using **structural Verilog**.  
It computes carries **in parallel** for faster addition than RCA.

## 🛠️ Features
- High-speed **16-bit addition**.
- Uses **propagate (P)** and **generate (G)** logic.
- Outputs **sign**, **zero**, **carry**, **parity**, and **overflow**.

## 📂 Files
- `str_cla_adder.v` → Verilog code
- `str_cla_adderTB.v` → Testbench

## 🧩 How It Works
- Propagate (P) and Generate (G) logic:
    ```verilog
    p[i] = a[i] ^ b[i];
    g[i] = a[i] & b[i];
    ```
- Parallel carry computation significantly reduces delay.

## 🧪 Simulation
```bash
iverilog -o <file_name>.out str_cla_adderTB.v str_cla_adder.v
vvp <file_name>.out