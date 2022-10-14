### Introduction

RISC-V (Reduced Instruction Set Architecture) is an open standard **instruction set architecture** (ISA) based on established reduced instruction set computer (RISC) principles. Unlike most other ISA designs, the RISC-V ISA is provided under **open source licenses** that do not require fees to use.

This open-source nature of RISC-V is crucial because it allows smaller developers and manufacturers to design and build hardware without the cost of licensing proprietary ISAs and paying royalties.

### Project Overview

This Project aims to create a RISC-V Core on the FPGA Cyclone II using Verilog HDL. The Quartus Prime 13 IDE is used to program the Cyclone II board, while using Modelsim-Altera to simulate and debug the CPU before programming the board. 

Resources like Steeve Hoover's EdX course on a RISC-V Core on TL-Verilog, chipverify's Verilog tutorial for learning Verilog HDL and HDLBits to practice different Verilog design techniques are to be used to complete the project.

### Acknowledgement 

The mentorship program of Eklavya by [SRA-VJTI](https://sravjti.in) has prepared me for creating this project.

My entire project went under the guidance of our mentors, Siddesh Patil and Premraj Jadav, without them I would have not progressed in this project on such a scale.

The process for selection of Eklavya was entirely task based, which made us revisit old concepts and learn something new. The Society of Robotics and Automation(SRA) community of VJTI has created a nice ecosystem to grow and learn something new and to explore various domains. From having weekly update meets and doubts sessions, our mentors took efforts to see if we don’t go off track during this entire program. The EdX course and various resources across the internet helped us to clear our doubts.

---

# Table of Contents

| Sr No. | Title                                   |
| ------ | --------------------------------------- |
| 1      | Sofwares Used                           |
| 2      | Introduction                            |
| 3      | Workflow                                |
| 4      | Basic Components Used                   |
|        | Clock                                   |
|        | Flip Flops                              |
|        | Multiplexers                            |
|        | Registers                               |
| 5      | Components of CPU                       |
|        | Program Counter                         |
|        | Instruction Memory                      |
|        | Decoder                                 |
|        | Control Logic                           |
|        | Arithmetic Logic Unit                   |
|        | Dynamic Memory                          |
|        | Seven Segment Display and BCD Converter |
| 6      | Output                                  |
| 7      | Conclusion                              |
| 8      | References                              | 
