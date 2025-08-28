-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Blanca Ramirez
-- 
-- Create Date:    16/02/2024 11:10:47
-- Project Name:   TTL7483
-- Module Name:    TTL7483_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity TTL7483_tb is
end    TTL7483_tb;

architecture Testbench of TTL7483_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component TTL7483
      port(a0,a1,a2,a3,b0,b1,b2,b3, cin : in std_logic;
			s0,s1,s2,s3, cout : out std_logic);
   end component;

	signal a0,a1,a2,a3,b0,b1,b2,b3, cin : std_logic := '0';
	signal s0,s1,s2,s3, cout : std_logic := '0';

begin
   uut: TTL7483 port map (a0,a1,a2,a3,b0,b1,b2,b3,cin,s0,s1,s2,s3,cout);

stim_proc: process
begin
   wait for 100 ns;

	a3 <= '0';

	a2 <= '1';

	a1 <= '0';

	a0 <= '0';

	b3 <= '0';

	b2 <= '1';

	b1 <= '1';

	b0 <= '0';
   wait for 100 ns;
	a3 <= '1';

	a2 <= '1';

	a1 <= '1';

	a0 <= '0';

	b3 <= '0';

	b2 <= '1';

	b1 <= '0';

	b0 <= '1';
 	
   wait for 100 ns;
	
   wait;

end process;

end Testbench;
