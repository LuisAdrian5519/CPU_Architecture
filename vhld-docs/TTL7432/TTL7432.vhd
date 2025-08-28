-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 20:02:26
-- Project Name:   TTL7432
-- Module Name:    TTL7432.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

-- 2-input OR gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_GATE is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           F : out STD_LOGIC);
end OR_GATE;

architecture Behavioral of OR_GATE is
begin
    F <= A OR B;
end Behavioral;

