library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
    port(
        X : in std_logic_vector(3 downto 0); -- 4 bits
        SalALU : out std_logic_vector(7 downto 0); -- 8 bits para resultados completos
        Oper : in std_logic_vector(4 downto 0); -- Selector de operación
        Cout : out std_logic; -- Carry out
        CLK, reset, LDR1, LDR2, LDR3, LDR4 : in std_logic; -- Señales de control
        MUX1, MUX2 : in std_logic_vector(1 downto 0); -- Selectores de multiplexor
        ready : out std_logic -- Indica cuando operación termina
    );
end ALU;

architecture arq1 of ALU is

    -- ========== DECLARACIÓN DE COMPONENTES ==========
    component multiplicador_booth is
        port(
            clk, reset, start : in  std_logic;
            A_in              : in  std_logic_vector(3 downto 0);
            B_in              : in  std_logic_vector(3 downto 0);
            ready             : out std_logic;
            resultado         : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component divisor is
        port(
            clk, reset, start : in  std_logic;
            dividendo         : in  std_logic_vector(3 downto 0);
            divisor_in        : in  std_logic_vector(3 downto 0);
            ready             : out std_logic;
            cociente          : out std_logic_vector(3 downto 0);
            residuo           : out std_logic_vector(3 downto 0)
        );
    end component;

    -- ========== SEÑALES INTERNAS ==========
    -- Registros (4 registros de 4 bits cada uno)
    signal R1, R2, R3, R4 : std_logic_vector(3 downto 0) := "0000";
    
    -- Salidas de multiplexores
    signal OUT1, OUT2 : std_logic_vector(3 downto 0);
    
    -- Resultado interno (8 bits para acomodar multiplicación)
    signal R : std_logic_vector(7 downto 0);
    
    -- Señales para multiplicador Booth
    signal mult_start : std_logic := '0';
    signal mult_ready : std_logic;
    signal mult_result : std_logic_vector(7 downto 0);
    
    -- Señales para divisor
    signal div_start : std_logic := '0';
    signal div_ready : std_logic;
    signal div_cociente : std_logic_vector(3 downto 0);
    signal div_residuo : std_logic_vector(3 downto 0);
    
    -- Control de operaciones largas
    signal operation_active : std_logic := '0';
    signal last_oper : std_logic_vector(4 downto 0) := "00000";

begin

    -- ========== SALIDA PRINCIPAL ==========
    SalALU <= R;

    -- ========== INSTANCIAS DE COMPONENTES ==========
    
    -- Instancia del multiplicador de Booth
    mult_inst: multiplicador_booth
        port map(
            clk => CLK,
            reset => reset,
            start => mult_start,
            A_in => OUT1,
            B_in => OUT2,
            ready => mult_ready,
            resultado => mult_result
        );
    
    -- Instancia del divisor con resta y corrimiento
    div_inst: divisor
        port map(
            clk => CLK,
            reset => reset,
            start => div_start,
            dividendo => OUT1,
            divisor_in => OUT2,
            ready => div_ready,
            cociente => div_cociente,
            residuo => div_residuo
        );

    -- ========== REGISTROS ==========
    
    -- Registro 1
    Reg1 : process(CLK, reset)
    begin
        if reset = '1' then
            R1 <= "0000";
        elsif rising_edge(CLK) and LDR1 = '1' then
            R1 <= R(3 downto 0); -- Guarda bits bajos del resultado
        end if;
    end process;

    -- Registro 2
    Reg2 : process(CLK, reset)
    begin
        if reset = '1' then
            R2 <= "0000";
        elsif rising_edge(CLK) and LDR2 = '1' then
            R2 <= R(3 downto 0);
        end if;
    end process;

    -- Registro 3
    Reg3 : process(CLK, reset)
    begin
        if reset = '1' then
            R3 <= "0000";
        elsif rising_edge(CLK) and LDR3 = '1' then
            R3 <= R(3 downto 0);
        end if;
    end process;
    
    -- Registro 4 (guarda bits altos para mult/div)
    Reg4 : process(CLK, reset)
    begin
        if reset = '1' then
            R4 <= "0000";
        elsif rising_edge(CLK) and LDR4 = '1' then
            R4 <= R(7 downto 4); -- Guarda bits altos del resultado
        end if;
    end process;

    -- ========== MULTIPLEXORES ==========
    
    process(MUX1, MUX2, X, R1, R2, R3)
    begin
        -- Multiplexor 1: selecciona primer operando
        case MUX1 is
            when "00" => OUT1 <= X;
            when "01" => OUT1 <= R1;
            when "10" => OUT1 <= R2;
            when "11" => OUT1 <= R3;
            when others => OUT1 <= "0000";
        end case;

        -- Multiplexor 2: selecciona segundo operando
        case MUX2 is
            when "00" => OUT2 <= X;
            when "01" => OUT2 <= R1;
            when "10" => OUT2 <= R2;
            when "11" => OUT2 <= R3;
            when others => OUT2 <= "0000";
        end case;
    end process;

    -- ========== ALU Y CONTROL DE OPERACIONES ==========
    
    process(CLK, reset)
        variable Rt : std_logic_vector(7 downto 0);
        variable temp_result : std_logic_vector(4 downto 0);
    begin
        if reset = '1' then
            mult_start <= '0';
            div_start <= '0';
            operation_active <= '0';
            ready <= '1';
            R <= (others => '0');
            Cout <= '0';
            last_oper <= "00000";
            
        elsif rising_edge(CLK) then
            
            -- Detectar cambio de operación
            if Oper /= last_oper then
                last_oper <= Oper;
                operation_active <= '0';
                mult_start <= '0';
                div_start <= '0';
            end if;
            
            -- Operaciones de la ALU
            case Oper is
                
                -- ===== TRANSFERENCIA =====
                when "00000" => -- NOP / Transferencia
                    Rt := "0000" & OUT1;
                    Cout <= '0';
                    ready <= '1';
                
                -- ===== OPERACIONES ARITMÉTICAS =====
                when "00001" => -- SUMA
                    temp_result := std_logic_vector(resize(unsigned(OUT1), 5) + resize(unsigned(OUT2), 5));
                    Rt := "000" & temp_result;
                    Cout <= temp_result(4);
                    ready <= '1';
                    
                when "00010" => -- RESTA
                    temp_result := std_logic_vector(resize(unsigned(OUT1), 5) - resize(unsigned(OUT2), 5));
                    Rt := "000" & temp_result;
                    Cout <= temp_result(4);
                    ready <= '1';
                    
                when "00011" => -- MULTIPLICACIÓN (usando Booth)
                    if operation_active = '0' then
                        -- Iniciar multiplicación
                        mult_start <= '1';
                        operation_active <= '1';
                        ready <= '0';
                    else
                        -- Esperando resultado
                        mult_start <= '0';
                        if mult_ready = '1' then
                            Rt := mult_result;
                            ready <= '1';
                            operation_active <= '0';
                        else
                            ready <= '0';
                        end if;
                    end if;
                    Cout <= '0';
                    
                when "00100" => -- DIVISIÓN (usando resta y corrimiento)
                    if operation_active = '0' then
                        -- Iniciar división
                        div_start <= '1';
                        operation_active <= '1';
                        ready <= '0';
                    else
                        -- Esperando resultado
                        div_start <= '0';
                        if div_ready = '1' then
                            -- [bits 7-4: residuo][bits 3-0: cociente]
                            Rt := div_residuo & div_cociente;
                            ready <= '1';
                            operation_active <= '0';
                        else
                            ready <= '0';
                        end if;
                    end if;
                    Cout <= '0';
                
                -- ===== OPERACIONES LÓGICAS =====
                when "00101" => -- NOT
                    Rt := "0000" & (not OUT1);
                    Cout <= '0';
                    ready <= '1';
                    
                when "00110" => -- AND
                    Rt := "0000" & (OUT1 and OUT2);
                    Cout <= '0';
                    ready <= '1';
                    
                when "00111" => -- OR
                    Rt := "0000" & (OUT1 or OUT2);
                    Cout <= '0';
                    ready <= '1';
                    
                when "01000" => -- XOR
                    Rt := "0000" & (OUT1 xor OUT2);
                    Cout <= '0';
                    ready <= '1';
                
                -- ===== OTRAS OPERACIONES =====
                when "01101" => -- MOV (transferencia)
                    Rt := "0000" & OUT1;
                    Cout <= '0';
                    ready <= '1';
                    
                when others =>
                    Rt := (others => 'Z');
                    Cout <= '0';
                    ready <= '1';
            end case;
            
            -- Actualizar resultado
            R <= Rt;
            
        end if;
    end process;

end arq1;