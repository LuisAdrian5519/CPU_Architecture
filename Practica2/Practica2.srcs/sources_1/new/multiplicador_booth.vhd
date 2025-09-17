library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplicador_booth is
    port(
        clk, reset, start : in  std_logic;
        A_in              : in  std_logic_vector(4 downto 0);  -- 5 bits
        B_in              : in  std_logic_vector(4 downto 0);  -- 5 bits
        ready             : out std_logic;
        resultado         : out std_logic_vector(9 downto 0)   -- 10 bits
    );
end multiplicador_booth;

architecture arq1 of multiplicador_booth is
    signal contador : integer range 0 to 10 := 0;
    
begin

process (clk, reset)
    variable tA, tM, tQ : std_logic_vector(5 downto 0) := "000000";  -- 6 bits para manejar overflow
    variable working : std_logic := '0';
begin
    if reset = '1' then
        contador <= 0;
        ready <= '1';
        resultado <= (others => '0');
        working := '0';
        
    elsif rising_edge(clk) then 
        case contador is
            when 0 => 
                ready <= '1';
                if start = '1' and working = '0' then
                    -- Inicializar variables
                    tA := "000000";                    -- Acumulador en 0
                    tM := '0' & A_in;                  -- Multiplicador (A_in)
                    tQ := '0' & B_in;                  -- Multiplicando (B_in)
                    contador <= 1;
                    ready <= '0';
                    working := '1';
                end if;
                
            when 1|3|5|7|9 => 
                -- Pasos impares: verificar bit LSB de Q y sumar si es necesario
                if tQ(0) = '1' then
                    tA := std_logic_vector(unsigned(tA) + unsigned(tM));
                end if;
                contador <= contador + 1;
                
            when 2|4|6|8|10 =>
                -- Pasos pares: shift derecho
                tQ := tA(0) & tQ(5 downto 1);      -- Shift Q, MSB viene de A
                tA := '0' & tA(5 downto 1);        -- Shift A con 0 en MSB
                if contador = 10 then
                    contador <= 0;  -- Volver a estado idle
                    working := '0';
                else
                    contador <= contador + 1;
                end if;
                
            when others =>
                contador <= 0;
        end case;
        
        -- Asignar resultado final (concatenar partes altas de A y Q)
        if contador = 0 and working = '0' then
            resultado <= tA(4 downto 0) & tQ(5 downto 1);
        end if;
    end if;
end process;

end arq1;