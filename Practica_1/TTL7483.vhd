-- Archivo: TTL7483
-- Implementación de un sumador binario de 4 bits.

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity TTL7483 is
   port(a0, a1, a2, a3, b0, b1, b2, b3, cin : in std_logic;
		s0, s1, s2, s3, cout : out std_logic);
end TTL7483;

architecture arq1 of TTL7483 is
	signal A, B, C, Suma : unsigned (4 downto 0) := "00000";
begin

	-- Concatenar los valores de entrada para formar mis dos entradas BCD
	A <= '0' & a3 & a2 & a1 & a0;
	B <= '0' & b3 & b2 & b1 & b0;
	
	-- Acarreo de entrada
	C <= "0000" & cin;
	
	-- Suma Binaria
	Suma <= A + B + C;
	
	-- El resultado de la suma (5 bits) se divide
		-- 4 bits del resultado de la suma
		-- 1 bit de acarreo de salira
	s0 <= Suma(0);
	s1 <= Suma(1);
	s2 <= Suma(2);
	s3 <= Suma(3);
	cout <= Suma(4);
end arq1;
