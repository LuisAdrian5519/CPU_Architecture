-- Archivo: BCD_to_7Seg.vhd
-- Convertidor de BCD a 7 segmentos para displays de la Basys3
-- Los segmentos están activos en BAJO (common anode)

library ieee;
use ieee.std_logic_1164.all;

entity BCD_to_7Seg is
    port(
        bcd_in : in  std_logic_vector(3 downto 0);  -- Entrada BCD (0-9)
        seg_out: out std_logic_vector(6 downto 0)   -- Salida 7-seg (CA, CB, CC, CD, CE, CF, CG)
    );
end entity BCD_to_7Seg;

architecture behavioral of BCD_to_7Seg is
begin
    process(bcd_in)
    begin
        case bcd_in is
            when "0000" => seg_out <= "1000000"; -- 0: muestra "0"
            when "0001" => seg_out <= "1111001"; -- 1: muestra "1" 
            when "0010" => seg_out <= "0100100"; -- 2: muestra "2"
            when "0011" => seg_out <= "0110000"; -- 3: muestra "3"
            when "0100" => seg_out <= "0011001"; -- 4: muestra "4"
            when "0101" => seg_out <= "0010010"; -- 5: muestra "5"
            when "0110" => seg_out <= "0000010"; -- 6: muestra "6"
            when "0111" => seg_out <= "1111000"; -- 7: muestra "7"
            when "1000" => seg_out <= "0000000"; -- 8: muestra "8"
            when "1001" => seg_out <= "0010000"; -- 9: muestra "9"
            when others => seg_out <= "0111111"; -- Error: muestra "-"
        end case;
    end process;
    
end architecture behavioral;