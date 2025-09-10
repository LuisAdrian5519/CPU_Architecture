
-- Archivo: ClockDivider.vhd
-- Divisor de reloj para multiplexar los displays de 7 segmentos
-- Divide el reloj de 100MHz de la Basys3 para obtener una frecuencia de multiplexación

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ClockDivider is
    port(
        clk_in  : in  std_logic;  -- Reloj de entrada (100 MHz)
        reset   : in  std_logic;  -- Reset
        clk_out : out std_logic   -- Reloj de salida (~1kHz para multiplexación)
    );
end entity ClockDivider;

architecture behavioral of ClockDivider is
    -- Contador para dividir el reloj
    -- Para obtener ~1kHz desde 100MHz necesitamos dividir entre ~100,000
    -- Usamos 17 bits: 2^17 = 131,072
    signal counter : unsigned(16 downto 0) := (others => '0');
    signal clk_div : std_logic := '0';
    
begin
    process(clk_in, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
            clk_div <= '0';
        elsif rising_edge(clk_in) then
            if counter = "11111111111111111" then -- Cuando llega al máximo
                counter <= (others => '0');
                clk_div <= not clk_div; -- Cambia el estado del reloj
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= clk_div;
    
end architecture behavioral;