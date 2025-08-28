-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    10/04/2024 12:01:17
-- Project Name:   RegFetch
-- Module Name:    RegFetch_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity RegFetch_tb is
end    RegFetch_tb;

architecture Testbench of RegFetch_tb is

   component RegFetch
   port(CLK : in std_logic;
		Instr: out std_logic_vector(3 downto 0) );
   
	end component;

	signal Instr : std_logic_vector(3 downto 0) := "ZZZZ";
   signal   CLK : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   uut: RegFetch port map (CLK, Instr );

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

   wait for 1000 ns;

clock_on <= false;
 
   wait;

end process;

end Testbench;
