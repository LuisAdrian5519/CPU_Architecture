-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    15/03/2024 02:31:25
-- Project Name:   sum2b
-- Module Name:    sum2b_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity sum2b_tb is
end sum2b_tb;

architecture Testbench of sum2b_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component sum2b
      port(
         a, b, c : in std_logic;
         ans : out std_logic
      );
   end component;

   -- Signals for test bench
   signal a_tb, b_tb, c_tb : std_logic;
   signal ans_tb : std_logic;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: sum2b port map (a_tb, b_tb, c_tb, ans_tb);

   -- Stimulus process
   stim_proc: process
   begin
      -- Test case 1
      a_tb <= '0';
      b_tb <= '0';
      c_tb <= '0';
      wait for 100 ns;

      -- Test case 2
      a_tb <= '1';
      b_tb <= '0';
      c_tb <= '0';
      wait for 100 ns;

      -- Test case 3
      a_tb <= '1';
      b_tb <= '1';
      c_tb <= '1';
      wait for 100 ns;

      -- End of test bench
      wait;
   end process;

end Testbench;
