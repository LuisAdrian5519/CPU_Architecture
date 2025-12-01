## Clock signal (100 MHz)
set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

## Switches - Entrada X (SW3-SW0) - 4 bits
set_property PACKAGE_PIN V17 [get_ports {X[0]}]
set_property PACKAGE_PIN V16 [get_ports {X[1]}]
set_property PACKAGE_PIN W16 [get_ports {X[2]}]
set_property PACKAGE_PIN W17 [get_ports {X[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {X[*]}]

## Switches - MUX1 (SW5-SW4) - 2 bits
set_property PACKAGE_PIN W15 [get_ports {MUX1[0]}]
set_property PACKAGE_PIN V15 [get_ports {MUX1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MUX1[*]}]

## Switches - MUX2 (SW7-SW6) - 2 bits
set_property PACKAGE_PIN W14 [get_ports {MUX2[0]}]
set_property PACKAGE_PIN W13 [get_ports {MUX2[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {MUX2[*]}]

## Switches - Oper (SW12-SW8) - 5 bits selector de operación
set_property PACKAGE_PIN V2  [get_ports {Oper[0]}]
set_property PACKAGE_PIN T3  [get_ports {Oper[1]}]
set_property PACKAGE_PIN T2  [get_ports {Oper[2]}]
set_property PACKAGE_PIN R3  [get_ports {Oper[3]}]
set_property PACKAGE_PIN W2  [get_ports {Oper[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Oper[*]}]

## Buttons - Control de registros y reset
# BTNC - Reset
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# BTNU - LDR1 (Load Register 1)
set_property PACKAGE_PIN T18 [get_ports LDR1]
set_property IOSTANDARD LVCMOS33 [get_ports LDR1]

# BTNL - LDR2 (Load Register 2)
set_property PACKAGE_PIN W19 [get_ports LDR2]
set_property IOSTANDARD LVCMOS33 [get_ports LDR2]

# BTNR - LDR3 (Load Register 3)
set_property PACKAGE_PIN T17 [get_ports LDR3]
set_property IOSTANDARD LVCMOS33 [get_ports LDR3]

# BTND - LDR4 (Load Register 4)
set_property PACKAGE_PIN U17 [get_ports LDR4]
set_property IOSTANDARD LVCMOS33 [get_ports LDR4]

## LEDs - SalALU (LD7-LD0) - 8 bits salida de la ALU
set_property PACKAGE_PIN U16 [get_ports {SalALU[0]}]
set_property PACKAGE_PIN E19 [get_ports {SalALU[1]}]
set_property PACKAGE_PIN U19 [get_ports {SalALU[2]}]
set_property PACKAGE_PIN V19 [get_ports {SalALU[3]}]
set_property PACKAGE_PIN W18 [get_ports {SalALU[4]}]
set_property PACKAGE_PIN U15 [get_ports {SalALU[5]}]
set_property PACKAGE_PIN U14 [get_ports {SalALU[6]}]
set_property PACKAGE_PIN V14 [get_ports {SalALU[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SalALU[*]}]

## LEDs - Señales de estado
# LD14 - Ready (indica cuando operación termina)
set_property PACKAGE_PIN V13 [get_ports ready]
set_property IOSTANDARD LVCMOS33 [get_ports ready]

# LD15 - Cout (carry out / acarreo)
set_property PACKAGE_PIN L1 [get_ports Cout]
set_property IOSTANDARD LVCMOS33 [get_ports Cout]