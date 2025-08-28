-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    16/04/2024 12:02:21
-- Project Name:   Memoria
-- Module Name:    Memoria_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Memoria_tb is
end    Memoria_tb;

architecture Testbench of Memoria_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Memoria
   port(Dir, Din : in std_logic_vector(3 downto 0);
		Dout : out std_logic_vector(3 downto 0);
		Rd, Wr, Clk : in std_logic );
   end component;

	signal Dir, Din, Dout : std_logic_vector(3 downto 0) := "0000";
   signal   Rd, Wr,Clk : std_logic := '0';
   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Memoria port map (Dir, Din, Dout, Rd, Wr, Clk);


clock_process : process
begin
   while (clock_on) loop
      Clk <= '0';
      wait for clock_period/2;
      Clk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   Rd <= '1';
   wait for 100 ns;
	Dir <= "0000";
   wait for 100 ns;
	Rd <= '0';
	Wr <= '1';
	Din <= "1110";
   wait for 100 ns;
	Rd <= '1';
	Wr <= '0';
   wait for 100 ns;
   clock_on <= false;
   wait;

end process;

end Testbench;
