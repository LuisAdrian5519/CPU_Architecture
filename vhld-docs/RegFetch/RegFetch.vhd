-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    03/05/2024 11:30:42
-- Project Name:   RegFetch
-- Module Name:    RegFetch.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;  -- For std_logic
use IEEE.numeric_std.all;     -- For unsigned

entity RegFetch is
   port(
        CLK : in std_logic;
        Instr: out std_logic_vector(8 downto 0)  -- Changed to 9 bits
   );
end RegFetch;

architecture arq1 of RegFetch is
    signal CLRPC, INCPC, LDMAR, LDMBR, LDIR, OEPC, LDPC, OEMBR, OEALU: std_logic := '0';
    signal WR, RD, LDR1, LDR2, LDR3 : std_logic := '0'; -- Added missing signal declarations
    signal PCOut, BusDir, BusDatos, MBROut, BUSD0, BUSD1 : std_logic_vector(3 downto 0) := "0000";
    signal InstrReg : std_logic_vector(8 downto 0) := (others => '0'); -- 9 bits for Instr
    signal Scontrol: std_logic_vector(15 downto 0); -- Assuming Scontrol is a 16-bit signal
begin

PC : process(CLRPC, INCPC, CLK, OEPC, LDPC, BUSD0)
variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
    if rising_edge(CLK) then
        if CLRPC = '1' then
            tmp := "0000";
        elsif INCPC = '1' then
            tmp := std_logic_vector(unsigned(tmp) + 1);
        end if;
    end if;
    if OEPC = '1' then 
        BUSD0 <= tmp; 
    else 
        BUSD0 <= "ZZZZ";
    end if;
end process;

MAR : process(LDMAR, CLK, PCout, BUSD0)
variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
    if rising_edge(CLK) and LDMAR = '1' then
        tmp := BUSD0;
    end if;
    BusDir <= tmp;
end process;

MBR : process(LDMBR, CLK, BUSD1, OEMBR)
variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
    if rising_edge(CLK) and LDMBR = '1' then
        tmp := BUSD1;
    end if;
    BUSD0 <= tmp;
end process;

IR : process(LDIR, CLK, BUSD0)
variable tmp : std_logic_vector(8 downto 0) := (others => '0'); -- 9-bit variable for Instr
begin
    if rising_edge(CLK) and LDIR = '1' then
        tmp := std_logic_vector(resize(unsigned(BUSD0), 9)); -- Resizing 4-bit to 9-bit
    end if;
    InstrReg <= tmp;
    Instr <= InstrReg;
end process;

WR <= Scontrol(13);
RD <= Scontrol(12);
LDMAR <= Scontrol(11);
CLRPC <= Scontrol(10);
INCPC <= Scontrol(9);
OEPC <= Scontrol(8);
LDPC <= Scontrol(7);
LDMBR <= Scontrol(6);
OEMBR <= Scontrol(5);
LDIR <= Scontrol(4);
LDR1 <= Scontrol(3);
LDR2 <= Scontrol(2);
LDR3 <= Scontrol(1);
OEALU <= Scontrol(0);

end arq1;
