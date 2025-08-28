-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    06/03/2024 11:33:26
-- Project Name:   EjemploTransf
-- Module Name:    EjemploTransf_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity EjemploTransf_tb is
end    EjemploTransf_tb;

architecture Testbench of EjemploTransf_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component EjemploTransf
      port(DatoEnt : in std_logic_vector(3 downto 0);
		DatoSal : out std_logic_vector(3 downto 0);
		L1, L2, clk : in std_logic);
   end component;
	signal L1, L2, clk : std_logic := '0';
	signal DatoEnt, DatoSal : std_logic_vector(3 downto 0) := "0000"; 

   constant clock_period : time := 50 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: EjemploTransf port map (DatoEnt, DatoSal, L1, L2, clk);

clock_process : process
begin
   while (clock_on) loop
      clk <= '0';
      wait for clock_period/2;
      clk <= '1';
      wait for clock_period/2;
   end loop;

   wait;
 end process;

stim_proc: process
begin
	DatoEnt <= "0101";
	wait for 100 ns;

		L1 <= '1';
	wait for 100 ns;
		L1 <= '0';
  	wait for 100 ns;
		DatoEnt <= "1111";
		L2 <= '1';
		L1 <= '1';
	wait for 100 ns;
   		clock_on <= false;
	
   wait;

end process;

end Testbench;
