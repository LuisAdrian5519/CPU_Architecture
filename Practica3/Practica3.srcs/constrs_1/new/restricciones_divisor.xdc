## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches - dividendo (SW0 to SW4) - Primeros 5 de la derecha
set_property PACKAGE_PIN V17 [get_ports {dividendo[0]}]
set_property PACKAGE_PIN V16 [get_ports {dividendo[1]}]
set_property PACKAGE_PIN W16 [get_ports {dividendo[2]}]
set_property PACKAGE_PIN W17 [get_ports {dividendo[3]}]
set_property PACKAGE_PIN W15 [get_ports {dividendo[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dividendo[*]}]

## Switches - divisor_in (SW5 to SW9) - Siguientes 5 hacia la izquierda
set_property PACKAGE_PIN V15 [get_ports {divisor_in[0]}]
set_property PACKAGE_PIN W14 [get_ports {divisor_in[1]}]
set_property PACKAGE_PIN W13 [get_ports {divisor_in[2]}]
set_property PACKAGE_PIN V2  [get_ports {divisor_in[3]}]
set_property PACKAGE_PIN T3  [get_ports {divisor_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {divisor_in[*]}]

## Buttons
# Reset button (BTNC - center button)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Start button (BTNU - up button)
set_property PACKAGE_PIN T18 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

## LEDs - cociente (LD0 to LD4)
set_property PACKAGE_PIN U16 [get_ports {cociente[0]}]
set_property PACKAGE_PIN E19 [get_ports {cociente[1]}]
set_property PACKAGE_PIN U19 [get_ports {cociente[2]}]
set_property PACKAGE_PIN V19 [get_ports {cociente[3]}]
set_property PACKAGE_PIN W18 [get_ports {cociente[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cociente[*]}]

## LEDs - residuo (LD5 to LD9)
set_property PACKAGE_PIN U15 [get_ports {residuo[0]}]
set_property PACKAGE_PIN U14 [get_ports {residuo[1]}]
set_property PACKAGE_PIN V14 [get_ports {residuo[2]}]
set_property PACKAGE_PIN V13 [get_ports {residuo[3]}]
set_property PACKAGE_PIN V3  [get_ports {residuo[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {residuo[*]}]

## LED - ready (LD15)
set_property PACKAGE_PIN L1 [get_ports ready]
set_property IOSTANDARD LVCMOS33 [get_ports ready]