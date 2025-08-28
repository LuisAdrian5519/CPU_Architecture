---------------------------------------------------------------------------------
----
---- Company : Universidad Miguel Hernandez
---- Engineer: User
---- 
---- Create Date:    06/06/2024 01:22:12
---- Project Name:   Procesador
---- Module Name:    Procesador_tb.vhd
---- Description:
----
---- Additional Comments:
----
---------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Procesador_tb is
end Procesador_tb;

architecture behavior of Procesador_tb is
    component Procesador
        port(
            X: in std_logic_vector(8 downto 0);
            SalALU: out std_logic_vector(8 downto 0);
            Cout: out std_logic;
            CLK: in std_logic;
            Instr: out std_logic_vector(8 downto 0);
             data_out: out std_logic_vector(15 downto 0);
            Dout: out std_logic_vector(8 downto 0)
        );
    end component;

    signal X: std_logic_vector(8 downto 0) := (others => '0');
    signal SalALU: std_logic_vector(8 downto 0);
    signal Oper: std_logic_vector(4 downto 0) := (others => '0');
    signal Cout: std_logic;
    signal CLK, LDR1, LDR2, LDR3: std_logic := '0';
    signal MUX1, MUX2: std_logic_vector(1 downto 0) := (others => '0');
    signal Instr: std_logic_vector(8 downto 0);
    signal rd, wr: std_logic := '0';
--    signal address: std_logic_vector(8 downto 0) := (others => '0');
    signal data_out: std_logic_vector(15 downto 0);
    signal Dir, Din: std_logic_vector(8 downto 0) := (others => '0');
    signal Dout: std_logic_vector(8 downto 0);
	signal clkon: boolean  := true;

begin
    uut: Procesador
        port map(
            X => X,
            SalALU => SalALU,
--            Oper => Oper,
            Cout => Cout,
            CLK => CLK,
            Instr => Instr,
          
--            address => address,
            data_out => data_out
        );

    clk_process: process
    begin
        while clkon loop
            CLK <= '0';
            wait for 1000 ns;
            CLK <= '1';
            wait for 1000 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        X <= "000000011";
        
--        LDR1 <= '1';
        wait for 100 ns;
--        LDR1 <= '0';
        
--        MUX1 <= "01";
--        MUX2 <= "01";
--        Oper <= "00001";
--        LDR2 <= '1';
--        wait for 1000 ns;
--        LDR2 <= '0';
        
--        X <= "000000001";
--        LDR3 <= '1';
--        wait for 1000 ns;
--        LDR3 <= '0';
        
--        MUX1 <= "10";
--        MUX2 <= "11";
--        Oper <= "00001";
--        wait for 1000 ns;
        clkon <= false;
        wait;
    end process;

end behavior;
