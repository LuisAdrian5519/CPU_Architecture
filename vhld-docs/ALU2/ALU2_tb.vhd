-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    03/05/2024 11:30:42
-- Project Name:   ALU2
-- Module Name:    ALU2_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity ALU2_tb is
end    ALU2_tb;

architecture Testbench of ALU2_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component ALU2
      port(X : in std_logic_vector(3 downto 0);
		SalALU : out std_logic_vector (3 downto 0);
		Oper : in std_logic_vector(2 downto 0);
		--Cin : in std_logic;
		Cout : out std_logic;
		CLK, LDR1, LDR2, LDR3 : in std_logic;
		MUX1, MUX2 : in std_logic_vector(1 downto 0)
			);
   end component;

	signal X : std_logic_vector(3 downto 0) := "0000";
	signal R : std_logic_vector (3 downto 0) := "0000";
	signal Oper : std_logic_vector(2 downto 0);
	--signal Cin : std_logic := '0';
	signal Cout : std_logic := '0';
	signal LDR1, LDR2, LDR3 : std_logic := '0';
	signal MUX1, MUX2 : std_logic_vector(1 downto 0) := "00";

   signal   CLK : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin


   uut: ALU2 port map (X, R, Oper, Cout, CLK, LDR1, LDR2, LDR3, MUX1, MUX2);

clock_process : process
begin
   while (clock_on) loop
      CLK <= '0';
      wait for clock_period/2;
      CLK <= '1';
      wait for clock_period/2;
   end loop;

   wait;
 end process;


stim_proc: process
begin

   wait for 100 ns;
	Oper <= "110";
	LDR1 <= '1';
	LDR2 <= '1';
	LDR3<= '0';
	X <= "0101";
	MUX1 <= "00";
	MUX2 <= "10";
   wait for 100 ns;
	MUX1 <= "01";
	MUX2 <= "10";
	Oper <= "000";
   wait for 100 ns;
	Oper <= "110";
	LDR1 <= '0';
	LDR2 <= '1';
	LDR3<= '0';
	X <= "0011";
	MUX1 <= "00";
	MUX2 <= "10";
   wait for 100 ns;
	MUX1 <= "01";
	MUX2 <= "10";
	Oper <= "000";
   wait for 100 ns;
   clock_on <= false;

   wait;

end process;

end Testbench;
