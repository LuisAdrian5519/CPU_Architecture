-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 20:00:06
-- Project Name:   TTL7408
-- Module Name:    TTL7408.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

-- 2-input AND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           F : out STD_LOGIC);
end AND_GATE;

architecture Behavioral of AND_GATE is
begin
    F <= A AND B;
end Behavioral;

