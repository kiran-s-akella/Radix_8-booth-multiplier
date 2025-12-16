# Radix-8 Booth Multiplier using 5:3 Compressor

## 1. Introduction
This repository implements a signed Radix-8 Booth-encoded multiplier for 8-bit operands encoding three bits at a time. The design uses 5:3 compressors to speed up the partial-product accumulation stage reducing the critical path. The project includes Verilog sources, a testbench, simulation scripts, and a results folder for RTL schematics and performance comparison.

## 2. Theory and Architecture

### 2.1 5:3 Compressor Module
A 5:3 compressor reduces five input bits and an input carry into three outputs (sum, carry, and higher carry) in one logic level. It essentially performs multi-operand reduction similar to Wallace or Dadda trees but with 5:3 blocks to balance fan-in and delay.

Key properties:
- Inputs: A, B, C, D, E (and optional carry-in)
- Outputs: S (sum), C0 (carry0), C1 (carry1) — position-weighted outputs
<img width="825" height="172" alt="image" src="https://github.com/user-attachments/assets/fa45a99e-accd-4eef-90ef-e4ad4dcb024f" />


### 2.2 8-bit Structural Modelling
Top-level approach:
1. **Booth encoder** (Radix-8) groups multiplier bits in overlapping triplets to produce signed-digit partial product multiples: `-4, -3, -2, -1, 0, +1, +2, +3, +4` times multiplicand.
2. **Partial product generator** uses recoder outputs to select/negate shifted multiplicand partial products.
3. **Reduction tree** built from 5:3 compressors (and final fast adder) to compress partial products to two rows.
4. **Final adder** (e.g., ripple-carry / CLA) to produce the final signed product.

<img width="895" height="441" alt="image" src="https://github.com/user-attachments/assets/341b430e-10a1-44f0-89dc-03a967c2be47" />


## 3. HDL Implementation Code
- All **Verilog RTL/source files** are located in the `src/` directory.
- All **testbench files** used for functional verification are located in the `tb_radix8_booth_multiplier.v` directory.

## 4. Simulation and Results
### 4.1 RTL Schematic
Use RTL Analysis (run linter) flow to generate the RTL schematic View of 5:3 Compressor Module
<img width="1196" height="481" alt="image" src="https://github.com/user-attachments/assets/86b90132-90ae-4444-b6ed-ad83ff38ba8d" />

RTL Schematic View of Radix-8 Booth Multiplier
<img width="1394" height="732" alt="image" src="https://github.com/user-attachments/assets/9e03bd95-87b9-4699-9734-203b38d4fbac" />

### 4.2 Functional verification
- Run the supplied testbench using Verilog and Gtkwave.
- Verify correctness against the structural model (e.g., reference behavioral multiplication).

Simulation results
<img width="1327" height="190" alt="image" src="https://github.com/user-attachments/assets/87593bbd-dfdb-4a57-8067-498c19396477" />

Bit-wise Simulation result (GTK Wave)
<img width="1386" height="853" alt="image" src="https://github.com/user-attachments/assets/26854c1d-d4db-426e-ae0a-1f19589f33be" />

Test vectors passed
<img width="1286" height="756" alt="image" src="https://github.com/user-attachments/assets/aa19456e-340f-4244-b4e5-0d96d6f1d61f" />

## 5. Conclusion
The final implementation achieved significantly improves speed performance compared to conventional multipliers, with a slight trade-off in area.
Overall, the design demonstrates an efficient and high-performance multiplier architecture suitable for digital signal processing, FPGA, and
other high-speed computing applications.

## 6. References
IEEE research paper-
[1] B. S., P. M., and V. M. B., “Design and Implementation of Signed Radix-8 Booth Encoded Multiplier Using 5:3 Compressor,” in Proceedings of the 2024 5th IEEE Global Conference for Advancement in Technology (GCAT), Karnataka, India, Oct. 4–6, 2024.



