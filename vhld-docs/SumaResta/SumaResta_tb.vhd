-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Blanca Ramirez

-- 
-- Create Date:    16/02/2024 11:53:58
-- Project Name:   SumaResta
-- Module Name:    SumaResta_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity SumaResta_tb is
end    SumaResta_tb;

architecture Testbench of SumaResta_tb is

   component SumaResta
     port(A, B : in std_logic_vector(3 downto 0);
		SR : in std_logic;
		Resultado : out std_logic_vector(3 downto 0);
		cout : out std_logic);
   end component;


	signal A, B, Resultado : std_logic_vector(3 downto 0) := "0000";
	signal SR, cout : std_logic := '0';

begin


   uut: SumaResta port map (A, B, SR, Resultado, cout);


stim_proc: process
begin
  
   wait for 100 ns;

	A <= "1110";
	B <= "0100";
   wait for 100 ns;
	SR <= '1';
   wait for 100 ns;
   
   wait;

end process;

end Testbench;
