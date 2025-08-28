-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    21/03/2024 10:57:19
-- Project Name:   Booth
-- Module Name:    Booth_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Booth_tb is
end    Booth_tb;

architecture Testbench of Booth_tb is

   component Booth
      port(Multiplicando, Multiplicadr : in std_logic_vector(3 downto 0);
			Producto : out std_logic_vector(7 downto 0);
			clk : std_logic);

   end component;

	signal Multiplicando, Multiplicadr : std_logic_vector(3 downto 0) := "0111";
	signal Producto : std_logic_vector(7 downto 0) := x"00";


	signal clk : std_logic := '0';
	constant clock_period : time := 50 ns;
	signal clock_on : boolean := true;

begin


   uut: Booth port map (Multiplicando, Multiplicadr, Producto, clk);

clock_process : process
begin
   while (clock_on) loop
      clk <= '0';
      wait for clock_period/2;
      clk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

stim_proc: process
begin
   
   wait for 1500 ns;
	clock_on <= false;
   wait;

end process;

end Testbench;
