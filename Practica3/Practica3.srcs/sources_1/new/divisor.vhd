library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divisor is
    port(
        clk, reset, start : in  std_logic;
        dividendo         : in  std_logic_vector(4 downto 0);  -- 5 bits sin signo
        divisor_in        : in  std_logic_vector(4 downto 0);  -- 5 bits sin signo
        ready             : out std_logic;
        cociente          : out std_logic_vector(4 downto 0);  -- 5 bits
        residuo           : out std_logic_vector(4 downto 0)   -- 5 bits
    );
end divisor;

architecture arq1 of divisor is
    signal contador : integer range 0 to 12 := 0;
    
begin

process (clk, reset)
    variable A : unsigned(4 downto 0) := "00000";  -- Registro acumulador/residuo
    variable Q : unsigned(4 downto 0) := "00000";  -- Registro cociente
    variable M : unsigned(4 downto 0) := "00000";  -- Divisor
    variable temp_resta : unsigned(4 downto 0);     -- Temporal para resta
    variable working : std_logic := '0';            -- Flag de trabajo
begin
    if reset = '1' then
        contador <= 0;
        ready <= '1';
        cociente <= (others => '0');
        residuo <= (others => '0');
        working := '0';
        
    elsif rising_edge(clk) then 
        case contador is
            when 0 => 
                -- Estado IDLE
                ready <= '1';
                if start = '1' and working = '0' then
                    -- Inicializar variables
                    A := "00000";                      -- Acumulador en 0
                    Q := unsigned(dividendo);          -- Q = dividendo
                    M := unsigned(divisor_in);         -- M = divisor
                    contador <= 1;
                    ready <= '0';
                    working := '1';
                end if;
                
            when 1|3|5|7|9 => 
                -- Pasos impares: Shift izquierdo de [A][Q]
                A := A(3 downto 0) & Q(4);             -- MSB de Q pasa a LSB de A
                Q := Q(4 downto 1) & '0';              -- Shift Q izquierdo, LSB = 0
                contador <= contador + 1;
                
            when 2|4|6|8|10 =>
                -- Pasos pares: Restar divisor y decidir bit del cociente
                temp_resta := A - M;
                
                if temp_resta(4) = '0' then
                    -- La resta es positiva (A >= M)
                    A := temp_resta;                   -- Aceptar la resta
                    Q(0) := '1';                       -- Bit del cociente = 1
                else
                    -- La resta es negativa (A < M)
                    -- A se mantiene sin cambios
                    Q(0) := '0';                       -- Bit del cociente = 0
                end if;
                
                if contador = 10 then
                    contador <= 0;                     -- Terminar
                    working := '0';
                    ready <= '1';
                else
                    contador <= contador + 1;
                end if;
                
            when others =>
                -- Estado de error
                contador <= 0;
                working := '0';
                ready <= '1';
        end case;
        
        -- Asignar resultados finales
        if contador = 0 and working = '0' then
            cociente <= std_logic_vector(Q);
            residuo <= std_logic_vector(A);
        end if;
    end if;
end process;

end arq1;