-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/02/2024 12:35:25
-- Project Name:   TTL7486
-- Module Name:    TTL7486_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity TTL7486_tb is
end    TTL7486_tb;

architecture Testbench of TTL7486_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component TTL7486
	port(ent1a, ent1b, ent2a, ent2b, ent3a, ent3b, ent4a, ent4b : in std_logic;
		 sal1, sal2, sal3, sal4 : out std_logic);
   end component;


   -- Select an architecture if needed (default is last one analyzed).
   --for uut: TTL7486 use entity WORK.TTL7486(arq1);

   -- Inputs/Outputs
 signal ent1a, ent1b, ent2a, ent2b, ent3a, ent3b, ent4a, ent4b, sal1, sal2, sal3, sal4 : std_logic := '0';

   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
--   signal   <clock> : std_logic := '0';
--   constant clock_period : time := 50 ns;
--   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: TTL7486 port map (ent1a, ent1b, ent2a, ent2b, ent3a, ent3b, ent4a, ent4b, sal1, sal2, sal3, sal4);

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
--clock_process : process
--begin
--   while (clock_on) loop
--      <clock> <= '0';
--      wait for clock_period/2;
--      <clock> <= '1';
--      wait for clock_period/2;
--   end loop;
--   --assert (false) report ("Finished") severity error;
--   -- Wait forever
--   wait;
-- end process;

-- Stimulus process
stim_proc: process
begin
      wait for 100 ns;
	ent1a <= '1';
	ent3a <= '1';
   wait for 100 ns;
	ent2a <= '1';
	ent4a <= '1';
   wait for 100 ns;

   wait;
end process;

end Testbench;
