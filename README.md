# RISC-V CPU on FPGA

This project is an implementation of a RISC-V ISA CPU Core on an FPGA. All of the core is written in Verilog HDL using Intel Quartus development tools.

---

## Preface

RISC-V (Reduced Instruction Set Architecture) is an open standard **instruction set architecture** (ISA) based on established reduced instruction set computer (RISC) principles. Unlike most other ISA designs, the RISC-V ISA is provided under **open source licenses** that do not require fees to use.

This open-source nature of RISC-V is crucial because it allows smaller developers and manufacturers to design and build hardware without the cost of licensing proprietary ISAs and paying royalties.

---

## Building and Installing

- First Clone the repository,  and load the quartus prime project.

- The simulation can then be started by keeping the main `RISC_V_main.v` file as the top level module.

---

## Theory

This is a four stage processor. In the first stage, the instruction corresponding to the *Program Counter's* location is read and decoded by the decoder.  Then the decoded instruction's parameters are passed to the Control Unit, which regulates the four stages of the CPU. In the next stage, the ALU is enabled(if the instruction required it), and all required parameters are passed to the ALU, even read from the register file. The output is then handled in the third stage, the ALU is then shut down, and the destination register is written. The fourth stage is used by the seven segment display to show it's output.

---

### Tech Stack

- [Verilog](https://www.chipverify.com/verilog/verilog-tutorial)
- [Quartus Prime 13](https://www.intel.com/content/www/us/en/products/details/fpga/development-tools/quartus-prime.html)
- [Modelsim Altera](https://www.intel.in/content/www/in/en/software/programmable/quartus-prime/model-sim.html)

---
### Screenshot of the CPU diagram

![](https://i.imgur.com/qyLEtoN.png)

---

### Future Work

- [ ] Implement pipe lining to eliminate 4 stages.
- [x] Add an assembler in python.
---

### Contributors

- [Zain Siddavatam](https://github.com/SuperChamp234/)
---

### Mentors
- [Premraj Jadhav](https://github.com/Premraj02)
- [Siddesh Patil](https://github.com/Sidshx)

---

### Acknowledgements and Resources

- [SRA VJTI Eklavya 2022](https://sravjti.in/)
- https://www.chipverify.com/verilog/verilog-tutorial
- https://inst.eecs.berkeley.edu/~cs61c/resources/su18_lec/Lecture7.pdf
- https://www.edx.org/course/building-a-risc-v-cpu-core
---

