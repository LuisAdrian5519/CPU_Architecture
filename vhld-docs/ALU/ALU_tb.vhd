-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    09/04/2024 11:36:45
-- Project Name:   ALU
-- Module Name:    ALU_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity ALU_tb is
end    ALU_tb;

architecture Testbench of ALU_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component ALU
      port(A, B : in std_logic_vector(3 downto 0);
		R : out std_logic_vector (3 downto 0);
		Oper : in std_logic_vector(2 downto 0);
		Cin : in std_logic;
		Cout : out std_logic);
   end component;


	signal Cin, Cout : std_logic := '0';
	signal A,B,R : std_logic_vector(3 downto 0) := "0000";
	signal Oper : std_logic_vector(2 downto 0) := "000";

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: ALU port map (A,B,R,Oper,Cin,Cout);


stim_proc: process
begin
	A <= "0011";
	B <= "0011";
   wait for 100 ns;
	Oper <= "000";
   wait for 100 ns;
   wait;

end process;

end Testbench;
