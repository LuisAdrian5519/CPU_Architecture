-- Archivo: DisplayController.vhd  
-- Controlador de displays de 7 segmentos con multiplexación
-- Maneja 2 dígitos BCD en los displays AN1 (decenas) y AN0 (unidades)

library ieee;
use ieee.std_logic_1164.all;

entity DisplayController is
    port(
        clk       : in  std_logic;                     -- Reloj principal (100 MHz)
        reset     : in  std_logic;                     -- Reset
        unidades  : in  std_logic_vector(3 downto 0);  -- Dígito de unidades (BCD)
        decenas   : in  std_logic_vector(3 downto 0);  -- Dígito de decenas (BCD)  
        seg       : out std_logic_vector(6 downto 0);  -- Segmentos CA-CG
        an        : out std_logic_vector(3 downto 0)   -- Ánodos AN3-AN0
    );
end entity DisplayController;

architecture behavioral of DisplayController is
    
    -- Declaración de componentes
    component ClockDivider is
        port(
            clk_in  : in  std_logic;
            reset   : in  std_logic;
            clk_out : out std_logic
        );
    end component;
    
    component BCD_to_7Seg is
        port(
            bcd_in  : in  std_logic_vector(3 downto 0);
            seg_out : out std_logic_vector(6 downto 0)
        );
    end component;
    
    -- Señales internas
    signal clk_div        : std_logic;                     -- Reloj dividido para multiplexación
    signal display_select : std_logic := '0';              -- Selector de display (0=unidades, 1=decenas)
    signal current_bcd    : std_logic_vector(3 downto 0);  -- BCD actual para mostrar
    
begin
    
    -- Instancia del divisor de reloj
    clk_divider_inst: ClockDivider 
        port map(
            clk_in  => clk,
            reset   => reset,
            clk_out => clk_div
        );
    
    -- Instancia del convertidor BCD a 7-segmentos
    bcd_converter: BCD_to_7Seg
        port map(
            bcd_in  => current_bcd,
            seg_out => seg
        );
    
    -- Proceso de multiplexación
    multiplex_process: process(clk_div, reset)
    begin
        if reset = '1' then
            display_select <= '0';
        elsif rising_edge(clk_div) then
            display_select <= not display_select; -- Alterna entre 0 y 1
        end if;
    end process;
    
    -- Lógica de selección de display y BCD
    selection_process: process(display_select, unidades, decenas)
    begin
        if display_select = '0' then
            -- Mostrar unidades en AN0
            an <= "1110";         -- Solo AN0 activo (en bajo)
            current_bcd <= unidades;
        else
            -- Mostrar decenas en AN1  
            an <= "1101";         -- Solo AN1 activo (en bajo)
            current_bcd <= decenas;
        end if;
    end process;
    
end architecture behavioral;