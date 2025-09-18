library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplicador_booth is
    port(
        clk, reset, start : in  std_logic;
        A_in              : in  std_logic_vector(4 downto 0);  -- Multiplicador (5 bits)
        B_in              : in  std_logic_vector(4 downto 0);  -- Multiplicando (5 bits)
        ready             : out std_logic;
        resultado         : out std_logic_vector(9 downto 0)   -- Producto (10 bits)
    );
end multiplicador_booth;

architecture arq1 of multiplicador_booth is
    signal contador : integer range 0 to 12 := 0;
    
begin

process (clk, reset)
    variable tA, tM, tQ : std_logic_vector(4 downto 0) := "00000";  -- 5 bits cada uno
    variable QM1 : std_logic := '0';                                -- Bit Q-1 para Booth
    variable working : std_logic := '0';                            -- Flag de trabajo
begin
    if reset = '1' then
        contador <= 0;
        ready <= '1';
        resultado <= (others => '0');
        working := '0';
        QM1 := '0';
        
    elsif rising_edge(clk) then 
        case contador is
            when 0 => 
                -- Estado IDLE
                ready <= '1';
                if start = '1' and working = '0' then
                    -- Inicializar variables para algoritmo de Booth
                    tA := "00000";                     -- Acumulador en 0
                    tM := A_in;                        -- Multiplicador 
                    tQ := B_in;                        -- Multiplicando
                    QM1 := '0';                        -- Q-1 inicial en 0
                    contador <= 1;
                    ready <= '0';
                    working := '1';
                end if;
                
            when 1|3|5|7|9 => 
                -- Pasos impares: Lógica de Booth (suma/resta según patrón)
                if tQ(0) = '1' and QM1 = '0' then
                    -- Patrón "10" → Restar M del acumulador
                    tA := std_logic_vector(signed(tA) - signed(tM));
                elsif tQ(0) = '0' and QM1 = '1' then
                    -- Patrón "01" → Sumar M al acumulador  
                    tA := std_logic_vector(signed(tA) + signed(tM));
                end if;
                -- Patrones "00" y "11" → No operación
                contador <= contador + 1;
                
            when 2|4|6|8|10 =>
                -- Pasos pares: Shift aritmético derecho
                QM1 := tQ(0);                          -- Guardar Q(0) en Q-1
                tQ := tA(0) & tQ(4 downto 1);          -- Shift Q, MSB viene de A(0)
                tA := tA(4) & tA(4 downto 1);          -- Shift aritmético A (preserva signo)
                
                if contador = 10 then
                    contador <= 0;  -- Terminar y volver a IDLE
                    working := '0';
                    ready <= '1';
                else
                    contador <= contador + 1;
                end if;
                
            when others =>
                -- Estado de error, volver a IDLE
                contador <= 0;
                working := '0';
                ready <= '1';
        end case;
        
        -- Asignar resultado final cuando termina el proceso
        if contador = 0 and working = '0' then
            resultado <= tA & tQ;  -- Concatenar A(5) y Q(5) = 10 bits
        end if;
    end if;
end process;

end arq1;