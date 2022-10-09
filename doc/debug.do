onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALU_tb/clk
add wave -noupdate /ALU_tb/reset
add wave -noupdate /ALU_tb/imem_write_data
add wave -noupdate /ALU_tb/rw
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_pc1/next_pc_reg
add wave -noupdate -radix hexadecimal /ALU_tb/RV1/b2v_imem1/data_out
add wave -noupdate /ALU_tb/RV1/b2v_dec1/instr_bus
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_rfile1/rs1
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_rfile1/rs2
add wave -noupdate /ALU_tb/RV1/b2v_dec1/imm
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_alu1/ALUoutput
add wave -noupdate /ALU_tb/RV1/b2v_alu1/ALUready
add wave -noupdate /ALU_tb/RV1/b2v_cu1/rd_write
add wave -noupdate /ALU_tb/RV1/b2v_cu1/ALUenable
add wave -noupdate /ALU_tb/RV1/b2v_rfile1/rd_data
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_rfile1/rs1_addr
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_rfile1/rs2_addr
add wave -noupdate /ALU_tb/RV1/b2v_cu1/state
add wave -noupdate /ALU_tb/RV1/b2v_cu1/pc_j_valid
add wave -noupdate -radix decimal /ALU_tb/RV1/b2v_cu1/next_pc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {403 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 244
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {370 ps} {602 ps}
