-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    15/03/2024 01:45:37
-- Project Name:   Complemento2
-- Module Name:    Complemento2.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Complemento2_tb is
end    Complemento2_tb;

architecture Testbench of Complemento2_tb is

   component Complemento2
      port(s1,s2,s3,s4,cout : in std_logic;
		a,b,c,d : out std_logic);

   end component;


	signal s1,s2,s3,s4 : std_logic := '0';
	signal a, b, c, d, cout : std_logic := '0';

begin


   uut: Complemento2 port map (s1,s2,s3,s4,cout,a,b,c,d);

stim_proc: process
begin

   wait for 100 ns;

	s1 <= '0';
	s2 <= '0';
	s3 <= '0';
	s4 <= '1';
   wait for 100 ns;
	s1 <= '1';
	s2 <= '0';
	s3 <= '0';
	s4 <= '1';
   wait for 100 ns;
	s1 <= '1';
	s2 <= '1';
	s3 <= '1';
	s4 <= '1';


   wait;

end process;

end Testbench;
