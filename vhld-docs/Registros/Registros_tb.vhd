-------------------------------------------------------------------------------
--
-- Company : Cetys
-- Engineer: JP
-- 
-- Create Date:    03/05/2024 12:16:39
-- Project Name:   Registros
-- Module Name:    Registros.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Registros_tb is
end    Registros_tb;

architecture Testbench of Registros_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Registros
      port(CLK : in std_logic;
		LDR1, LDR2, LDR3 : in std_logic;
		X : in std_logic_vector(3 downto 0);
		MUX1 : in std_logic_vector(1 downto 0);
		MUX2 : in std_logic_vector(1 downto 0);
		OUT1, OUT2 : out std_logic_vector(3 downto 0)
		);
   end component;

	signal LDR1, LDR2, LDR3 : std_logic := '0';
	signal X : std_logic_vector(3 downto 0) := "0000";
	signal MUX1, MUX2 : std_logic_vector(1 downto 0) := "00";
	signal OUT1, OUT2 : std_logic_vector(3 downto 0) := "0000";

   signal   CLK : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   uut: Registros port map (CLK, LDR1, LDR2, LDR3, X, MUX1, MUX2, OUT1, OUT2);

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

-- Stimulus process
stim_proc: process
begin

   wait for 100 ns;

	LDR1 <= '1';
	LDR2 <= '1';
	LDR3<= '1';
	X <= "0011";

   wait for 100 ns;
	MUX1<="01";
	MUX2<="10";
   wait for 100 ns;
	LDR1<= '1';
	LDR2 <= '0';
	LDR3<= '0';
	X <= "0001";
   wait for 100 ns;
	MUX1<="01";
	MUX2<="10";
   wait for 100 ns;
   clock_on <= false;

   wait;

end process;

end Testbench;
