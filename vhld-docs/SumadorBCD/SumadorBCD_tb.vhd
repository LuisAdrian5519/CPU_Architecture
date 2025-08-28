-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 19:23:37
-- Project Name:   SumadorBCD
-- Module Name:    SumadorBCD_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity SumadorBCD_tb is
end    SumadorBCD_tb;

architecture Testbench of SumadorBCD_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component SumadorBCD
      port(A,B: in std_logic_vector(3 downto 0);
		R: out std_logic_vector(3 downto 0);
		cin: in std_logic;
		cout: out std_logic);
   end component;

	signal A, B, R : std_logic_vector(3 downto 0) := "0000";
	signal cin, cout : std_logic := '0';

begin

   uut: SumadorBCD port map (A,B,R,cin,cout);

stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	A <= "0001";
	B <= "0001";
   wait for 100 ns;
	A <= "0001";
	B <= "0010";
   
   wait for 100 ns;
	A <= "0001";
	B <= "0100";

   wait for 100 ns;
  
   wait;

end process;

end Testbench;
