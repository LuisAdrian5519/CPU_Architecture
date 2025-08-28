-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 22:32:05
-- Project Name:   SumaRestaBCD
-- Module Name:    SumaRestaBCD_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity SumaRestaBCD_tb is
end    SumaRestaBCD_tb;

architecture Testbench of SumaRestaBCD_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component SumaRestaBCD
      port (
      A, B : in std_logic_vector(3 downto 0);
      SR : in std_logic;
      ans1, ans2 : out std_logic_vector(3 downto 0)
   );
   end component;

	signal A, B, ans1, ans2 : std_logic_vector(3 downto 0) := "0000";
	signal SR : std_logic := '0';

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: SumaRestaBCD port map (A,B,SR);


stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	A <= "0100";
	B <= "1001";
	SR <= '0';
  
   wait for 100 ns;
	A <= "0001";
	B <= "0001";
	SR <= '0';
 
   wait for 100 ns;
	A <= "0001";
	B <= "0010";
	SR <= '1';

   wait for 100 ns;
	A <= "0001";
	B <= "0001";
	SR <= '1';

	wait;

end process;

end Testbench;
