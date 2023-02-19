#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

//convert given integer as string to vector of it's bits
//pad the output to given size
vector<int> bitarray(string input, int size) {
    //convert the number to binary regarless sign
    bool negative = input[0] == '-';
    if (input[0] == '-') {
        input = input.substr(1);
    }
    int num = stoi(input);
    //convert to binary
    vector<int> bits;
    while (num > 0) {
        bits.insert(bits.begin(), num % 2);
        num /= 2;
    }
    //add two extra bits for sign
    bits.insert(bits.begin(), 0);
    bits.insert(bits.begin(), 0);
    //if number is negative, convert to 2's complement
    if (negative) {
        //flip all bits
        for (int i = 0; i < bits.size(); i++) {
            bits[i] = !bits[i];
        }
        //add 1
        int carry = 1;
        for (int i = bits.size() - 1; i >= 0; i--) {
            //if carry is 1, add 1 to current bit
            if (carry == 1) {
                if (bits[i] == 0) {
                    bits[i] = 1;
                    carry = 0;
                }
                else {
                    bits[i] = 0;
                    carry = 1;
                }
            }
        }
    }
    //pad the output to given size using msb
    while (bits.size() < size) {
        bits.insert(bits.begin(), bits[0]);
    }
    return bits;
}

//a function that breaks down a string and returns a vector of strings
//input format: addi x3 x4 5
//output format: {"addi", "x3", "x4", "5"}
vector<string> split(string s){
    //replace all commas and open brackets with spaces
    for(int i = 0; i < s.size(); i++){
        if(s[i] == ',' || s[i] == '('){
            s[i] = ' ';
        }
    }
    //append a space at the end of the string
    s += " ";
    //split the string into vector of strings
    //ignore x, ) except the first x
    vector<string> output;
    string temp = "";
    for(int i = 0; i < s.size(); i++){
        if(s[i] == ' '){
            if(temp != ""){
                output.push_back(temp);
                temp = "";
            }
        }
        //
        else if(!(s[i] == 'x' && i != 0) && s[i] != ')'){
            temp += s[i];
        }
    }
    return output;
}

//identify opcode and return a 32-bit vector of 0s and 1s with opcode
//input format: {"addi", "x3", "x4", "5"}
vector<int> identify_opode(vector<string> instr){
    vector<int> opcode;
    //check for add, sub, xor, or, and, slt, sll, srl, sra, slt, sltu
    if(instr[0] == "add" | instr[0] == "sub" | instr[0] == "xor" | instr[0] == "or" | instr[0] == "and" | instr[0] == "slt" | instr[0] == "sll" | instr[0] == "srl" | instr[0] == "sra" | instr[0] == "slt" | instr[0] == "sltu"){
        opcode = {0,1,1,0,0,1,1};
    }
    //check for addi, xori, ori, andi, slli, srli, srai, slti, sltiu
    else if(instr[0] == "addi" | instr[0] == "xori" | instr[0] == "ori" | instr[0] == "andi" | instr[0] == "slli" | instr[0] == "srli" | instr[0] == "srai" | instr[0] == "slti" | instr[0] == "sltiu"){
        opcode = {0,0,1,0,0,1,1};
    }
    //check for lb,lh,lw,lbu,lhu
    else if(instr[0] == "lb" | instr[0] == "lh" | instr[0] == "lw" | instr[0] == "lbu" | instr[0] == "lhu"){
        opcode = {0,0,0,0,0,1,1};
    }
    //check for sb,sh,sw
    else if(instr[0] == "sb" | instr[0] == "sh" | instr[0] == "sw"){
        opcode = {0,1,0,0,0,1,1};
    }
    //check for beq, bne, blt, bge, bltu, bgeu
    else if(instr[0] == "beq" | instr[0] == "bne" | instr[0] == "blt" | instr[0] == "bge" | instr[0] == "bltu" | instr[0] == "bgeu"){
        opcode = {1,1,0,0,0,1,1};
    }
    //check for jal
    else if(instr[0] == "jal"){
        opcode = {1,1,0,1,1,1,1};
    }
    else if(instr[0] == "jalr"){
        opcode = {1,1,0,0,1,1,1};
    }
    else if(instr[0] == "auipc"){
        opcode = {0,0,1,0,1,1,1};
    }
    else if(instr[0] == "lui"){
        opcode = {0,1,1,0,1,1,1};
    }
    else if(instr[0] == "ecall"){
        opcode = {1,1,1,0,0,1,1};
    }
    else if(instr[0] == "ebreak"){
        opcode = {1,1,1,0,0,1,1};
    }
    else{
        opcode = {0,0,0,0,0,0,0};
    }
    return opcode;
}

//add rd or imm[4:0] or imm[4:1|11] to given vector according to instruction
//input format: {"addi", "x3", "x4", "5"}, vector of 0s and 1s
vector<int> rd_imm1(vector<string> instr, vector<int> decoded){
    vector<int> bits_11_7;
    //for R type instructions(add, sub, xor, or, and, slt, sll, srl, sra, slt, sltu)
    //bits_11_7 is rd
    if(instr[0] == "add" | instr[0] == "sub" | instr[0] == "xor" | instr[0] == "or" | instr[0] == "and" | instr[0] == "slt" | instr[0] == "sll" | instr[0] == "srl" | instr[0] == "sra" | instr[0] == "slt" | instr[0] == "sltu"){
        bits_11_7 = bitarray(instr[1], 5);
    }
    //for I type instructions(addi, xori, ori, andi, slli, srli, srai, slti, sltiu)
    //bits_11_7 is rd
    else if(instr[0] == "jalr" | instr[0] == "addi" | instr[0] == "xori" | instr[0] == "ori" | instr[0] == "andi" | instr[0] == "slli" | instr[0] == "srli" | instr[0] == "srai" | instr[0] == "slti" | instr[0] == "sltiu" | instr[0] == "lb" | instr[0] == "lh" | instr[0] == "lw" | instr[0] == "lbu" | instr[0] == "lhu"){
        bits_11_7 = bitarray(instr[1], 5);
    }
    //for S type instructions(sb,sh,sw)
    //immediate must be calculated first, and imm[4:0] is added to bits_11_7
    else if(instr[0] == "sb" | instr[0] == "sh" | instr[0] == "sw"){
        vector<int> imm = bitarray(instr[2], 12);
        bits_11_7 = {imm[7],imm[8],imm[9],imm[10],imm[11]};
    }
    //for B type instructions(beq, bne, blt, bge, bltu, bgeu)
    //immediate must be stored as imm[4:1|11]
    else if(instr[0] == "beq" | instr[0] == "bne" | instr[0] == "blt" | instr[0] == "bge" | instr[0] == "bltu" | instr[0] == "bgeu"){
        vector<int> imm = bitarray(instr[3], 12);
        bits_11_7 = {imm[8],imm[9],imm[10],imm[11],imm[0]};
    }
    //for U and J type instructions(auipc, lui, jal, jalr)
    //bits_11_7 is rd
    else if(instr[0] == "auipc" | instr[0] == "lui" | instr[0] == "jal"){
        bits_11_7 = bitarray(instr[1], 5);
        //for U type instructions(auipc, lui)
        //imm[31:12] is added to bits_11_7
        if(instr[0] == "auipc" | instr[0] == "lui"){
            vector<int> imm = bitarray(instr[2], 19);
            bits_11_7.insert(bits_11_7.begin(), imm.begin(), imm.end());
        }
        else if(instr[0] == "jal"){
            vector<int> imm = bitarray(instr[2], 32);
            imm = {imm[31-20],imm[31-10],imm[31-9],imm[31-8],imm[31-7],imm[31-6],imm[31-5],imm[31-4],imm[31-3],imm[31-2],imm[31-1],imm[31-11],imm[31-19],imm[31-18],imm[31-17],imm[31-16],imm[31-15],imm[31-14],imm[31-13],imm[31-12]};
            //insert only 0-19 bits of imm into bits_11_7
            bits_11_7.insert(bits_11_7.begin(), imm.begin(), imm.end());
        }
    }
    //add bits_11_7 to the front of the vector
    decoded.insert(decoded.begin(), bits_11_7.begin(), bits_11_7.end());
    return decoded;
}
//add func3 to given vector according to instruction
//input format: {"addi", "x3", "x4", "5"}, vector of 0s and 1s
vector<int> func3(vector<string> instr, vector<int> decoded){
    vector<int> bits_14_12;
    //for R type instructions(add, sub, xor, or, and, slt, sll, srl, sra, slt, sltu)
    //bits_14_12 is func3
    if(instr[0] == "add"| instr[0] == "sub"| instr[0] == "addi"| instr[0] == "lb"| instr[0] == "sb"| instr[0] == "beq"| instr[0] == "jalr" | instr[0] == "ecall"| instr[0] == "ebreak"){
        bits_14_12 = {0,0,0};
    }
    else if(instr[0] == "sll"| instr[0] == "slli"| instr[0] == "lh"| instr[0] == "sh" | instr[0] == "bne"){
        bits_14_12 = {0,0,1};
    }
    else if(instr[0] == "slt"| instr[0] == "slti" | instr[0] ==  "lw" | instr[0] ==  "sw"){
        bits_14_12 = {0,1,0};
    }
    else if(instr[0] == "sltu" | instr[0] == "sltiu"){
        bits_14_12 = {0,1,1};
    }
    else if(instr[0] == "xor" | instr[0] ==  "xori" | instr[0] ==  "lbu" | instr[0] ==  "blt"){
        bits_14_12 = {1,0,0};
    }
    else if(instr[0] == "srl" | instr[0] ==  "sra" | instr[0] == "srli" | instr[0] == "srai"| instr[0] == "lhu"| instr[0] == "bge"){
        bits_14_12 = {1,0,1};
    }
    else if(instr[0] == "or"| instr[0] == "ori"| instr[0] == "bltu"){
        bits_14_12 = {1,1,0};
    }
    else if(instr[0] == "and"| instr[0] == "andi"| instr[0] == "bgeu"){
        bits_14_12 = {1,1,1};
    }
    //add bits_14_12 to the front of the vector
    decoded.insert(decoded.begin(), bits_14_12.begin(), bits_14_12.end());
    return decoded;
}
//depending on the last 7 bits of decoded, identify the opcode
//if the opcode belongs to R, I, S or B type instructions, add rs1 to the front of the vector
vector<int> rs1(vector<string> instr, vector<int> decoded){
    vector<int> opcode   = identify_opode(instr);
    vector<int> r_type   = {0,1,1,0,0,1,1};
    vector<int> i_type_1 = {0,0,1,0,0,1,1};
    vector<int> i_type_2 = {0,0,0,0,0,1,1};
    vector<int> s_type   = {0,1,0,0,0,1,1};
    vector<int> b_type   = {1,1,0,0,0,1,1};
    vector<int> i_type_3 = {1,1,0,0,1,1,1};
    vector<int> i_type_4 = {1,1,1,0,0,1,1};
    if(opcode == r_type | opcode == i_type_1 | opcode == i_type_4 | opcode == b_type){
        vector<int> rs1 = bitarray(instr[2], 5);
        decoded.insert(decoded.begin(), rs1.begin(), rs1.end());
    }
    if(opcode == s_type | opcode == i_type_2 | opcode == i_type_3){
        vector<int> rs1 = bitarray(instr[3], 5);
        decoded.insert(decoded.begin(), rs1.begin(), rs1.end());
    }
    return decoded;
}
vector<int> rs2_imm_func7(vector<string> instr, vector<int> decoded){
    vector<int> opcode   = identify_opode(instr);
    vector<int> r_type   = {0,1,1,0,0,1,1};
    vector<int> i_type_1 = {0,0,1,0,0,1,1};
    vector<int> i_type_2 = {0,0,0,0,0,1,1};
    vector<int> s_type   = {0,1,0,0,0,1,1};
    vector<int> b_type   = {1,1,0,0,0,1,1};
    vector<int> i_type_3 = {1,1,0,0,1,1,1};
    vector<int> i_type_4 = {1,1,1,0,0,1,1};
    if(opcode == i_type_1| opcode == i_type_4){
        vector<int> imm = bitarray(instr[3], 12);
        decoded.insert(decoded.begin(), imm.begin(), imm.end());
    }
    if(opcode == i_type_2 | opcode == i_type_3 ) {
        vector<int> imm = bitarray(instr[2], 12);
        decoded.insert(decoded.begin(), imm.begin(), imm.end());
    }
    if(opcode == r_type | opcode == b_type){
        vector<int> rs2 = bitarray(instr[3], 5);
        decoded.insert(decoded.begin(), rs2.begin(), rs2.end());
    }
    if( opcode == s_type ){
        vector<int> rs2 = bitarray(instr[1], 5);
        decoded.insert(decoded.begin(), rs2.begin(), rs2.end());
    }
    if(opcode == r_type){
        if(instr[0] == "sub" | instr[0] == "sra"){
            vector<int> func7 = {0,1,0,0,0,0,0};
            decoded.insert(decoded.begin(), func7.begin(), func7.end());
        }
        else{
            vector<int> func7 = {0,0,0,0,0,0,0};
            decoded.insert(decoded.begin(), func7.begin(), func7.end());
        }
    }
    if(opcode == s_type){
        vector<int> imm = bitarray(instr[3], 12);
        vector<int> imm_11_5 = {imm[0], imm[1], imm[2], imm[3], imm[4], imm[5], imm[6]};
        decoded.insert(decoded.begin(), imm_11_5.begin(), imm_11_5.end());
    }
    if(opcode == b_type){
        vector<int> imm = bitarray(instr[3], 12);
        vector<int>imm_12_10_5 = {imm[0], imm[2], imm[3], imm[4], imm[5], imm[6]};
        decoded.insert(decoded.begin(), imm_12_10_5.begin(), imm_12_10_5.end());
    }
    return decoded;
}

//use all above functions to decode instruction
vector<int> decode(string str){
    //split the string into a vector of strings
    vector<string> instr = split(str);
    //identify the opcode
    vector<int> decoded = identify_opode(instr);
    //add rd or imm[4:0] or imm[4:1|11] to the vector
    decoded = rd_imm1(instr, decoded);
    //add func3 to the vector
    decoded = func3(instr, decoded);
    //add rs1 to the vector
    decoded = rs1(instr, decoded);
    //add rs2 or imm[11:5] or imm[12|10:5] to the vector
    decoded = rs2_imm_func7(instr, decoded);
    //if the output isn't 32 bits, throw an error
    if(decoded.size() != 32){
        cout << "Error: Input is invalid" << endl;
        exit(1);
    }
    return decoded;
}

//based on command line arguments, read from a file or interactively
int main(int argc, char *argv[]){
    if(argc == 1){
        string str;
        while(getline(cin, str)){
            vector<int> decoded = decode(str);
            for(int i = 0; i < decoded.size(); i++){
                cout << decoded[i];
            }
            cout << endl;
        }
    }
    else{
        ifstream infile;
        infile.open(argv[1]);
        string str;
        while(getline(infile, str)){
            vector<int> decoded = decode(str);
            for(int i = 0; i < decoded.size(); i++){
                cout << decoded[i];
            }
            cout << endl;
        }
    }
}
