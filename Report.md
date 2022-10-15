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
| 5.7    | Data Memory                             | 
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

### Program Counter

The PC is a byte address, meaning it references the first byte of an instruction in the IMem. Instructions are 4 bytes long, so, although the PC increment is depicted as "+1" (instruction), the actual increment must be by 4 (bytes). The lowest two PC bits must always be zero in normal operation.

The instruction cycle starts from here, where the PC passes the value of the current instruction to be executed and is read by the instruction memory. The PC must also be configured to handle jump and branch instructions, where the address of the program counter is changed explicitly using commands. The final pointer is computed by the control unit and passed on to the PC's jump port.

![](https://i.imgur.com/A0EmJnj.png)

**Port List:**
- `clk` to synchronize the PC with rest of the components.
- `rst` To reset the program counter to `0` when the reset signal is passed.
- `jump` Which holds the jump explicitly computed by the CU.
- `j_signal` To specify if a jump needs to take place.

### Instruction memory

This memory houses the program instructions that are to be executed by the CPU. It cannot be written by the CPU, only accessed.

It consists of 64 registers, each can be programmed beforehand by the programmer to hold the commands that need to be executed. All commands must follow the RISC-V ISA specs.

![](https://i.imgur.com/rp1oukN.png)


**Port List:**

- `clk:` For synchronization
- `reset` to reset the instruction memory
- `address[31:0]` PC input of the instruction to be read.
- `data_out[31:0]` Output instruction.
- `rw` Signal to be passed to write the imem.

### Decoder

The decoder breaks down the instruction read from the instruction memory and passes all the decoded parameters to the Control Unit for further processing.

Since all the RISC-V ISA instructions follow a specific spec to encode data into an instruction, an array of multiplexers are used to extract data from the instruction.

![](https://i.imgur.com/7TuVpHe.png)

![](https://i.imgur.com/28E4aFY.png)

The decoder extension module here extracts the `imm`, `rs1` and `rs2` fields from the instruction.

**Data extracted from the instructions**:-
- **Opcode**: Opcode specifies the type of instruction, so the decoder knows where the corresponding data lies.
- **Function Bits**: The function bits serve to differentiate instructions of the same opcode.
- **Register 1 Data `rs1`**: This data holds the address to the first source register used in almost all instructions. Data for this instruction's operation can be read from the corresponding register.
- **Register 2 Data `rs2`**: This data holds the address to the second source register, used in only some instructions. Data for this instruction's operation can be read from the corresponding register.
- **Immediate Data `imm`**: This is the immediate data encoded into the instruction that is used to perform operations without reading data from the register file. Immediate can also be used to read from the data memory, as well as write to the data memory/register file.

### Control Logic

The Control Logic maintains the 4 cycles of the CPU, by enabling the ALU only when it is required. It also is the central point for all data flow, receiving almost all data computed/given to the CPU, thus can control the CPU by regulating the data.

The functions of the CU elaborated are:

- Handle all branch and jump instructions:
	Instructions of type `B` and type `J` are all handled in the CU itself, thus reducing the overhead on the ALU. This will be useful when the CPU is pipelined.
- Read `RS1` and `RS2` registers from the register file.
- Store the `rd` value generated by the ALU.
- Pass out the output for specified instructions to the seven segment display.

![](https://i.imgur.com/8pkXn76.png)


**Port List:**
- `ALUready` to check if the ALU has completed its operation.
- `clk` To synchronize the stages of the CPU with rest of the components.
- All the decoder fields to pass onto the ALU.
- `ALUenable` To enable the ALU in the first stage, and to shut it off in the later stages.
- `instr_bus` To pass the instruction type to the ALU.
- `display_out` To pass the output to the display.

### Arithmetic Logic Unit

The arithmetic logic unit is the component of the CPU that performs the operations on it's inputs systematically, and according to the type of instruction. All the values are read and passed to the ALU, and it simply has to perform the actions.

The ALU can also be used to read from the data memory, as the latency is high, thus a separate cycle of the CPU must be given to it.

![](https://i.imgur.com/RxPSXyh.png)

**Port List:** 
- `ALUenable`, depending on its value, the ALU will be turned off/on.
- All inputs from the decoder, including the `instr_bus` which holds the type of instruction being executed.
- DMem controls, to enable write and read.

### Data Memory

The data memory in a computer is a much longer, volatile data storage which can be used to store data for an intermediate term, data which cannot be held in the register file.

The Data Memory can be read and written only once at a time, since writing to the same memory location while reading can lead to some errors in writing.

![](https://i.imgur.com/jaVmF2G.png)

### Seven Segment Display and BCD converter

The seven segment display needs to be driven by lighting up individual LEDs corresponding to each number.

![](https://i.imgur.com/QUt3564.png)

Thus, we shall have to convert the numbers to BCD, or Binary Coded Decimal, thus we can extract individual digits from the 32-bit output and display them on a seven segment display.

The BCD Converter implemented does not use division or double dabble algorithm, but does fast division using shift operators, thus not having any latency in displaying the values. 

![](https://i.imgur.com/hBwrtx3.png)

**Port List:**
- Input of ALU,
- Output to individual displays.
	This output can be assigned using the pin planner function of quartus II and mapped to hardware pins on the FPGA, and connect it to the seven segment display.

![](https://i.imgur.com/XmghVCM.png)

# Conclusion

Thus, in the end, we have a CPU that can fully execute any RISC32I Instruction and display the output onto a seven segment display.

A demo can be seen here: https://drive.google.com/file/d/1tdIph1MYkWYVkqEXQSSpG9ZZ23ey4uwV/view?resourcekey

We got to explore basics of computer architecture, FPGA programming and mathematical operations at a bit level and how circuits can be made to do all of these.



