-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    20/02/2024 11:11:09
-- Project Name:   TTL7474
-- Module Name:    TTL7474_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity TTL7474_tb is
end    TTL7474_tb;

architecture Testbench of TTL7474_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component TTL7474
	 port(D0, CLK, CLR, PRE : in std_logic;
		Q0, QN0 : out std_logic);
   end component;

    signal D0, CLK, CLR, PRE, Q0, QN0 : std_logic := '0';
	constant clock_period : time := 50 ns;
	signal clock_on : boolean :=true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: TTL7474 port map (D0, CLK, CLR, PRE, Q0, QN0);

clock_process : process
begin
	while (clock_on) loop
	CLK<='0';
	wait for clock_period/2;
	CLK<='1';
	wait for clock_period/2;
end loop;
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
	 CLR<='1';
	wait for 75 ns;
	 PRE<='1';
	wait for 100 ns;
	 D0<='0';
	wait for 100 ns;
	 D0<='1';
	wait for 100 ns;
	 clock_on<= false;
   wait;

end process;

end Testbench;
