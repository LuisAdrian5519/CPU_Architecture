-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    03/05/2024 11:30:42
-- Project Name:   ALU2
-- Module Name:    ALU2.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- For std_logic
use IEEE.numeric_std.all;     -- For unsigned

entity ALU2 is
    port(
        X : in std_logic_vector(3 downto 0); -- 4-bit input
        SalALU : out std_logic_vector(3 downto 0); -- 4-bit ALU result output
        Oper : in std_logic_vector(4 downto 0); -- 5-bit operation selector
        Cout : out std_logic; -- Carry out
        CLK, LDR1, LDR2, LDR3 : in std_logic; -- Control signals
        MUX1, MUX2 : in std_logic_vector(1 downto 0) -- Multiplexer selectors
    );
end ALU2;

architecture arq1 of ALU2 is

    signal R1, R2, R3 : std_logic_vector(3 downto 0) := "0000";
    signal OUT1, OUT2 : std_logic_vector(3 downto 0);
    signal ALU_result_with_carry : std_logic_vector(4 downto 0);
    signal R : std_logic_vector(3 downto 0);

begin

    SalALU <= R;

    -- Register processes
    Reg1 : process(LDR1, CLK)
    variable tmp1 : std_logic_vector(3 downto 0) := "0000";
    begin
        if rising_edge(CLK) and LDR1 = '1' then
            tmp1 := R;
        end if;
        R1 <= tmp1;
    end process;

    Reg2 : process(LDR2, CLK)
    variable tmp2 : std_logic_vector(3 downto 0) := "0000";
    begin
        if rising_edge(CLK) and LDR2 = '1' then
            tmp2 := R;
        end if;
        R2 <= tmp2;
    end process;

    Reg3 : process(LDR3, CLK)
    variable tmp3 : std_logic_vector(3 downto 0) := "0000";
    begin
        if rising_edge(CLK) and LDR3 = '1' then
            tmp3 := R;
        end if;
        R3 <= tmp3;
    end process;

    -- Multiplexer process
    process(MUX1, MUX2, X, R1, R2, R3)
    begin
        case MUX1 is
            when "00" => OUT1 <= X;
            when "01" => OUT1 <= R1;
            when "10" => OUT1 <= R2;
            when "11" => OUT1 <= R3;
            when others => OUT1 <= "0000";
        end case;

        case MUX2 is
            when "00" => OUT2 <= X;
            when "01" => OUT2 <= R1;
            when "10" => OUT2 <= R2;
            when "11" => OUT2 <= R3;
            when others => OUT2 <= "0000";
        end case;
    end process;

    -- ALU operation process
    process (Oper, OUT1, OUT2)
    variable At, Bt, Rt : std_logic_vector(4 downto 0);
    variable RMt : std_logic_vector(9 downto 0);
    begin
        At := '0' & OUT1;
        Bt := '0' & OUT2;
        case Oper is
            when "00000" => -- NOP
                Rt := At;
                Cout <= '0';
            when "00001" => -- SUM
                Rt := std_logic_vector(unsigned(At) + unsigned(Bt));
                Cout <= Rt(4);
            when "00010" => -- SUB
                Rt := std_logic_vector(unsigned(At) - unsigned(Bt));
                Cout <= '0';
            when "00011" => -- MUL
                RMt := std_logic_vector(unsigned(At) * unsigned(Bt));
                Rt := RMt(4 downto 0); -- limited multiplication result
                Cout <= '0';
            when "00100" => -- DIV
                Rt := std_logic_vector(unsigned(At) / unsigned(Bt));
                Cout <= '0';
            when "00101" => -- NOT
                Rt := not At;
                Cout <= '0';
            when "00110" => -- AND
                Rt := At and Bt;
                Cout <= '0';
            when "00111" => -- OR
                Rt := At or Bt;
                Cout <= '0';
            when "01000" => -- XOR
                Rt := At xor Bt;
                Cout <= '0';
            when "01001" => -- SHR
                Rt := std_logic_vector(shift_right(unsigned(At), 1));
                Cout <= '0';
            when "01010" => -- SHL
                Rt := std_logic_vector(shift_left(unsigned(At), 1));
                Cout <= '0';
            when "01011" => -- INC
                Rt := std_logic_vector(unsigned(At) + 1);
                Cout <= Rt(4);
            when "01100" => -- DEC
                Rt := std_logic_vector(unsigned(At) - 1);
                Cout <= '0';
            when "01101" => -- MOV
                Rt := At;
                Cout <= '0';
            when "01110" => -- CMP
                if unsigned(At) = unsigned(Bt) then
                    Rt := "00001";
                else
                    Rt := "00000";
                end if;
                Cout <= '0';
            when "10000" => -- RD
                -- Implement read logic if needed
                Rt := At;
                Cout <= '0';
            when "10001" => -- WRT
                -- Implement write logic if needed
                Rt := At;
                Cout <= '0';
            when "10011" => -- LOOP
                -- Implement loop logic if needed
                Rt := At;
                Cout <= '0';
            when "10100" => -- JMP
                -- Implement jump logic if needed
                Rt := At;
                Cout <= '0';
            when "10101" => -- JML
                -- Implement jump if less logic if needed
                Rt := At;
                Cout <= '0';
            when "10110" => -- JME
                -- Implement jump if equal logic if needed
                Rt := At;
                Cout <= '0';
            when "10111" => -- JMG
                -- Implement jump if greater logic if needed
                Rt := At;
                Cout <= '0';
            when "11000" => -- MOV
                Rt := At;
                Cout <= '0';
            when "11001" => -- MOV
                Rt := At;
                Cout <= '0';
            when others =>
                Rt := "ZZZZZ";
        end case;
        ALU_result_with_carry <= Rt;
        R <= Rt(3 downto 0);
    end process;

end arq1;
