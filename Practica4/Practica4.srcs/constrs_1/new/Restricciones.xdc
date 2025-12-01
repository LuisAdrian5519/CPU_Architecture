## Clock signal (100 MHz)
set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

## Switches - Switches_Entradas (SW11-SW0) - 12 bits
# Formato: [Signo(1)][Exponente(5)][Mantisa(6)]
set_property PACKAGE_PIN V17 [get_ports {Switches_Entradas[0]}]
set_property PACKAGE_PIN V16 [get_ports {Switches_Entradas[1]}]
set_property PACKAGE_PIN W16 [get_ports {Switches_Entradas[2]}]
set_property PACKAGE_PIN W17 [get_ports {Switches_Entradas[3]}]
set_property PACKAGE_PIN W15 [get_ports {Switches_Entradas[4]}]
set_property PACKAGE_PIN V15 [get_ports {Switches_Entradas[5]}]
set_property PACKAGE_PIN W14 [get_ports {Switches_Entradas[6]}]
set_property PACKAGE_PIN W13 [get_ports {Switches_Entradas[7]}]
set_property PACKAGE_PIN V2  [get_ports {Switches_Entradas[8]}]
set_property PACKAGE_PIN T3  [get_ports {Switches_Entradas[9]}]
set_property PACKAGE_PIN T2  [get_ports {Switches_Entradas[10]}]
set_property PACKAGE_PIN R3  [get_ports {Switches_Entradas[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Switches_Entradas[*]}]

## Buttons - Control
# BTNC - Reset (botón del centro)
set_property PACKAGE_PIN U18 [get_ports BTN_Reset]
set_property IOSTANDARD LVCMOS33 [get_ports BTN_Reset]

# BTNL - Guardar Variable A (botón izquierdo)
set_property PACKAGE_PIN W19 [get_ports BTN_Save_Var_A]
set_property IOSTANDARD LVCMOS33 [get_ports BTN_Save_Var_A]

# BTNR - Guardar Variable B (botón derecho)
set_property PACKAGE_PIN T17 [get_ports BTN_Save_Var_B]
set_property IOSTANDARD LVCMOS33 [get_ports BTN_Save_Var_B]

## LEDs - LED_Resultado (LD11-LD0) - 12 bits
# Formato salida: [Signo(1)][Exponente(5)][Mantisa(6)]
set_property PACKAGE_PIN U16 [get_ports {LED_Resultado[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED_Resultado[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED_Resultado[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED_Resultado[3]}]
set_property PACKAGE_PIN W18 [get_ports {LED_Resultado[4]}]
set_property PACKAGE_PIN U15 [get_ports {LED_Resultado[5]}]
set_property PACKAGE_PIN U14 [get_ports {LED_Resultado[6]}]
set_property PACKAGE_PIN V14 [get_ports {LED_Resultado[7]}]
set_property PACKAGE_PIN V13 [get_ports {LED_Resultado[8]}]
set_property PACKAGE_PIN V3  [get_ports {LED_Resultado[9]}]
set_property PACKAGE_PIN W3  [get_ports {LED_Resultado[10]}]
set_property PACKAGE_PIN U3  [get_ports {LED_Resultado[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_Resultado[*]}]