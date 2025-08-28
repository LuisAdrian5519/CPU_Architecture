-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    21/02/2024 11:33:54
-- Project Name:   TTL74194
-- Module Name:    TTL74194_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity TTL74194_tb is
end    TTL74194_tb;

architecture Testbench of TTL74194_tb is

   component TTL74194
      port(ABCD : in std_logic_vector(3 downto 0);
		QABCD : out std_logic_vector(3 downto 0);
		SR, SL, S0, S1, CLK, CLR : in std_logic);
   end component;

   signal ABCD, QABCD : std_logic_vector(3 downto 0);
   signal   SR, SL, S0, S1, CLK, CLR : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   uut: TTL74194 port map (ABCD, QABCD, SR, SL, S0, S1, CLK, CLR);

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
   wait for 15 ns;
	CLR <= '1';
	ABCD <= "0101";
   wait for 100 ns;
  	S1 <= '1';
	S0 <= '1';
   wait for 100 ns;
  	S1 <= '0';
	S0 <= '1';
	wait for 100 ns;
  	S1 <= '1';
	S0 <= '0';
   wait for 100 ns;
	ABCD <= "1100";
   wait for 100 ns;
   clock_on <= false;
   wait;

end process;

end Testbench;