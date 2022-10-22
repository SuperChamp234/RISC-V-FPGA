from pickletools import uint1
import numpy as np

def convert_to_bitarray(str_num):
    if str_num[0] == "x":
        return padder(list(map(lambda x: int(x), list(bin(int(str_num[1:]))[2:]))),32,True)
    else:
        if bin(int(str_num))[0] == '-':
            return padder(list(map(lambda x: int(x), [1]+list(bin(int(str_num))[3:]))),32,True)
        else: 
            return padder(list(map(lambda x: int(x), list(bin(int(str_num))[2:]))),32,True)

def padder(arr,size,sign):
    if len(arr) >=size : 
        return arr
    if sign: 
        pad = [arr[0]] * (size-len(arr))
    else: 
        pad = [0] * (size-len(arr))
    return pad.extend(arr)

def interactive():
    print("Enter the instruction: ")
    instruction = input().replace(",","").replace("("," ").replace(")","")
    opcode, rd, rs1, rs2 = instruction.split()
    encoded_out = [0] * 32
    match opcode:
        case "add"|"sub"|"xor"|"or"|"and"|"sll"|"srl"|"sra"|"slt"|"sltu":
            encoded_out[-6:] = [0,1,1,0,0,1,1]
        case "addi" | "xori" | "ori" | "andi" | "slli" | "srli" | "srai" | "slti" | "sltiu":
            encoded_out[-6:] = [0,0,1,0,0,1,1]
        case "lb" | "lh" | "lw" | "lbu" | "lhu":
            encoded_out[-6:] = [0,0,0,0,0,1,1]
        case "sb" | "sh" | "sw":
            encoded_out[-6:] = [0,1,0,0,0,1,1]
        case "beq" | "bne" | "blt" | "bge" | "bltu" | "bgeu":
            encoded_out[-6:] = [1,1,0,0,0,1,1]
        case "jal":
            encoded_out[-6:] = [1,1,0,1,1,1,1]
        case "jalr":
            encoded_out[-6:] = [1,1,0,0,1,1,1]
        case "lui":
            encoded_out[-6:] = [0,1,1,0,1,1,1]
        case "auipc":
            encoded_out[-6:] = [0,0,1,0,1,1,1]
        case _:
            print("Invalid Instruction Opcode")
            return 0
    #generate function 3 and function 7
    match opcode:
        #R
        case "add":
            encoded_out[-15:-12] = [0,0,0]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "sub":
            encoded_out[-15:-12] = [0,0,0]
            encoded_out[-32:-25] = [0,1,0,0,0,0,0]
        case "xor":
            encoded_out[-15:-12] = [1,0,0]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "or":
            encoded_out[-15:-12] = [1,1,0]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "and":
            encoded_out[-15:-12] = [1,1,1]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "sll":
            encoded_out[-15:-12] = [0,0,1]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "srl":
            encoded_out[-15:-12] = [1,0,1]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "sra":
            encoded_out[-15:-12] = [1,0,1]
            encoded_out[-32:-25] = [0,1,0,0,0,0,0]
        case "sra":
            encoded_out[-15:-12] = [0,0,1]
            encoded_out[-32:-25] = [0,1,0,0,0,0,0]
        case "slt":
            encoded_out[-15:-12] = [0,1,0]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        case "sltu":
            encoded_out[-15:-12] = [0,1,1]
            encoded_out[-32:-25] = [0,0,0,0,0,0,0]
        #I type instructions
        case "addi":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,0,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            # encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            # encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
            encoded_out[-32:-20] = rs2[-12:-1]
        case "xori":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,0,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "ori":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,1,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "andi":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,1,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "slli":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,0,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]\
        case "srli":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,0,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "srai":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,0,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,1,0,0,0,0,0] #imm[5:11]
        case "slti":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,1,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "sltiu":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,1,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        #Load I instructions
        case "lb":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,0,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "lh":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,0,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "lw":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [0,1,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "lbu":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,0,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        case "lhu":
            encoded_out[-12:-7] = convert_to_bitarray(rd) #rd
            encoded_out[-15:-12] = [1,0,1] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
        #S Type Instructions
        case "lbu":
            encoded_out[-12:-7] = convert_to_bitarray(rs2) #imm[4:0]
            encoded_out[-15:-12] = [0,0,0] #func3
            encoded_out[-20:-15] = convert_to_bitarray(rs1) #rs1
            encoded_out[-24:-20] = convert_to_bitarray(rs2) #imm[0:4]
            encoded_out[-32:-24] = [0,0,0,0,0,0,0,0] #imm[5:11]
            
    print(encoded_out)
    print(''.join([str(elem) for elem in encoded_out]))
if __name__ == "__main__":
    interactive()