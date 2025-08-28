-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Blanca Ramirez
-- 
-- Create Date:    14/02/2024 12:03:14
-- Project Name:   TTL7404
-- Module Name:    TTL7404.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity TTL7404_tb is
end    TTL7404_tb;

architecture Testbench of TTL7404_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component TTL7404
	port(ent1, ent2, ent3, ent4, ent5, ent6 : in std_logic;-- 6 entradas
		 sal1, sal2, sal3, sal4, sal5, sal6: out std_logic);
-- 6 salidas
   end component;

   signal ent1, ent2, ent3, ent4, ent5, ent6, sal1, sal2, sal3, sal4, sal5, sal6 : std_logic := '0';
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: TTL7404 port map ( ent1, ent2, ent3, ent4, ent5, ent6, sal1, sal2, sal3, sal4, sal5, sal6 );

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
	ent1 <= '1';
	ent3 <= '1';
   wait for 100 ns;
	ent2 <= '1';
	ent4 <= '1';
   wait for 100 ns;
	ent5 <= '1';
	ent6 <= '1';

   wait;

end process;

end Testbench;
