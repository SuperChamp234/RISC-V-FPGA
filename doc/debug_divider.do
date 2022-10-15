onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_tb/clk
add wave -noupdate /RISC_V_tb/reset
add wave -noupdate /RISC_V_tb/rw
add wave -noupdate /RISC_V_tb/RV1_m/divided_clk
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_pc1/next_pc_reg
add wave -noupdate -radix hexadecimal /RISC_V_tb/RV1_m/RV1/b2v_imem1/data_out
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_dec1/instr_bus
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_rfile1/rs1
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_rfile1/rs2
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_dec1/imm
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_alu1/ALUoutput
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_alu1/ALUready
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_cu1/rd_write
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_cu1/ALUenable
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_rfile1/rd_data
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_rfile1/rs1_addr
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_rfile1/rs2_addr
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_cu1/state
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_cu1/pc_j_valid
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/RV1/b2v_cu1/next_pc
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_inst/BCD
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D1
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB0
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB1
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB2
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB3
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB4
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB5
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D2BB6
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB0
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB1
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB2
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB3
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB4
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB5
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D3BB6
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB0
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB1
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB2
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB3
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB4
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB5
add wave -noupdate /RISC_V_tb/RV1_m/RV1/D4BB6
add wave -noupdate /RISC_V_tb/RV1_m/RV1/b2v_pc1/cyc_4
add wave -noupdate -radix decimal /RISC_V_tb/RV1_m/counter_value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {338354 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 322
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
configure wave -timelineunits sec
update
WaveRestoreZoom {207766 ps} {410118 ps}
