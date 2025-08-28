-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 19:32:37
-- Project Name:   FiltroBCD
-- Module Name:    FiltroBCD_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity FiltroBCD_tb is
end    FiltroBCD_tb;

architecture Testbench of FiltroBCD_tb is

   component FiltroBCD
      port(a1,a2,a3,a4,b1,b2,b3,b4,SR: in std_logic;
		sa1,sa2,sa3,sa4,sb1,sb2,sb3,sb4: out std_logic);
   end component;

	signal a1,a2,a3,a4,b1,b2,b3,b4,SR,sa1,sa2,sa3,sa4,sb1,sb2,sb3,sb4: std_logic := '0';

begin


   uut: FiltroBCD port map (a1,a2,a3,a4,b1,b2,b3,b4,SR,sa1,sa2,sa3,sa4,sb1,sb2,sb3,sb4);


stim_proc: process
begin
   
   wait for 100 ns;
	a1 <= '1';
	a2 <= '0';
	a3 <= '0';
	a4 <= '1';

	b1 <= '1';
	b2 <= '0';
	b3 <= '0';
	b4 <= '1';
   wait for 100 ns;
	a1 <= '1';
	a2 <= '1';
	a3 <= '1';
	a4 <= '1';

	b1 <= '1';
	b2 <= '1';
	b3 <= '1';
	b4 <= '1';
   wait for 100 ns;
	a1 <= '1';
	a2 <= '0';
	a3 <= '0';
	a4 <= '1';

	b1 <= '1';
	b2 <= '0';
	b3 <= '0';
	b4 <= '1';
 
   wait;

end process;

end Testbench;
