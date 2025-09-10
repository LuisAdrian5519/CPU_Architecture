-- Archivo: complemento_bcd.vhd
-- Este modulo genera el complemento a 9 de un digito BCD de entrada

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComplementoBCD is
    port(
        entrada : in std_logic_vector(3 downto 0);
        salida  : out std_logic_vector(3 downto 0)
    );
end entity ComplementoBCD;

architecture behavioral of ComplementoBCD is

begin
    -- Proceso para calcular el complemento a 9
    process(entrada)
    begin
        case entrada is
            when "0000" => salida <= "1001"; -- 9 - 0 = 9
            when "0001" => salida <= "1000"; -- 9 - 1 = 8
            when "0010" => salida <= "0111"; -- 9 - 2 = 7
            when "0011" => salida <= "0110"; -- 9 - 3 = 6
            when "0100" => salida <= "0101"; -- 9 - 4 = 5
            when "0101" => salida <= "0100"; -- 9 - 5 = 4
            when "0110" => salida <= "0011"; -- 9 - 6 = 3
            when "0111" => salida <= "0010"; -- 9 - 7 = 2
            when "1000" => salida <= "0001"; -- 9 - 8 = 1
            when "1001" => salida <= "0000"; -- 9 - 9 = 0
            when others => salida <= "XXXX"; -- Manejo de estados invalidos
        end case;
    end process;

end architecture behavioral;
