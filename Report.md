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
| 4      | Basic Components                        |
| 4.1    | Clock                                   |
| 4.2    | Flip Flops                              |
| 4.3    | Multiplexers                            |
| 4.4    | Registers                               |
| 5      | Components of CPU                       |
| 5.1    | Program Counter                         |
| 5.2    | Instruction Memory                      |
| 5.3    | Decoder                                 |
| 5.4    | Register File                           |
| 5.5    | Control Logic                           |
| 5.6    | Arithmetic Logic Unit                   |
| 5.7    | Dynamic Memory                          |
| 5.8    | Seven Segment Display and BCD Converter |
| 6      | Output                                  |
| 7      | Conclusion                              |
| 8      | References                              |

## Software Used

- Quartus Prime for designing and testing on Cyclone II Board

## Introduction 

The CPU core must be able to understand what instruction has been passed to it, access information stored in its registers, and perform operations on those values.

RISC-V was created by researchers in University of California, Berkley, from 2010. This Instruction Set Architecture was one of many that allowed programmers, and the software they write, to directly control the computer hardware. The open source nature of RISC-V has made it easy for computer chip developing companies to use it for their own processors. 

This can be achieved with it's 8 modules. These modules at base are controlled and depend upon a few basic components, described as follows.

## Basic Components

### Clock

The clock toggles its output value on a regular schedule as long as ticks are enabled. The clock's cycle can be configured using its High Duration and Low Duration attributes. Clock is an important component of our circuit as it can be used to induce delay and helps us make a synchronized circuit.

We use the onboard 50 MHz clock on the Cyclone II board, bound to the `PIN_17

### Flip Flops

In electronics, a flip-flop or latch is a circuit that has two stable states and can be used to **store state information**. The circuit can be made to change state by signals applied to one or more control inputs, and will have one or two outputs. It is the basic storage element in sequential logic. Flip-flops and latches are fundamental building blocks of digital electronics systems used in computers, communications, and many other types of systems.

![](https://i.imgur.com/7HJddR8.png)

In a D-Flip flop, as shown above, it captures the value of the D-input at a definite portion of the clock cycle (such as the rising edge of the clock). That captured value becomes the Q output. At other times, the output Q does not change. The D flip-flop can be viewed as a memory cell, a zero-order hold, or a delay line.

### Multiplexers

The multiplexer or MUX is a digital switch, also called as data selector. It is a Combinational Logic Circuit with more than one input line, one output line and more than one select line. It accepts the binary information from several input lines or sources and depending on the set of select lines, a particular input line is routed onto a single output line.

Below is a 4:1 Multiplexer Gate level diagram
![](https://i.imgur.com/ZDF5qBP.png)
### Registers

Registers hold information as a D-Flip Flop and release it for immediate computation by the CPU. They release their information with positive edges of their selector pins, and thus are always to be written in sequential logic.

![](https://i.imgur.com/BBFFd6k.png)

---

# Components of the CPU

The 8 components as described above are:

1. Program Counter
2. Instruction Memory
3. Decoder
4. Control Logic
5. Arithmetic Logic Unit
6. Dynamic Memory
7. Seven Segment Display and BCD Converter
