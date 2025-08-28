-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 22:32:05
-- Project Name:   SumaRestaBCD
-- Module Name:    SumaRestaBCD.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity SumaRestaBCD is
   port (
      A, B : in std_logic_vector(3 downto 0);
      SR : in std_logic;
      ans1, ans2 : out std_logic_vector(3 downto 0)
   );
end SumaRestaBCD;

architecture arq1 of SumaRestaBCD is
   component FiltroBCD
      port (
         a1, a2, a3, a4, b1, b2, b3, b4, SR : in std_logic;
         sa1, sa2, sa3, sa4, sb1, sb2, sb3, sb4 : out std_logic
      );
   end component;

   component TTL7483
      port (
         a0, a1, a2, a3, b0, b1, b2, b3, cin : in std_logic;
         s0, s1, s2, s3, cout : out std_logic
      );
   end component;

   component Complemento2
      port (
         s1, s2, s3, s4, cout : in std_logic;
         a, b, c, d : out std_logic
      );
   end component;

    component TTL74157_4to1_Mux is
        port (
        S, D0, D1, D2, D3, G0, G1, G2, G3 : in std_logic;  
        Y : out std_logic_vector(3 downto 0)              
    );
    end component;


   component sum2b
      port (
         a, b, c : in std_logic;
         ans : out std_logic
      );
   end component;

   signal Fa, Fb, S1, S2, S3, C, R : std_logic_vector(3 downto 0);
   signal cout1, cout2, V, invc1, M : std_logic;
begin

   filtro: FiltroBCD port map (
      a1 => A(0), a2 => A(1), a3 => A(2), a4 => A(3),
      b1 => B(0), b2 => B(1), b3 => B(2), b4 => B(3),
      SR => SR,
      sa1 => Fa(0), sa2 => Fa(1), sa3 => Fa(2), sa4 => Fa(3),
      sb1 => Fb(0), sb2 => Fb(1), sb3 => Fb(2), sb4 => Fb(3)
   );

   sum1: TTL7483 port map (
      a0 => Fa(0), a1 => Fa(1), a2 => Fa(2), a3 => Fa(3),
      b0 => Fb(0), b1 => Fb(1), b2 => Fb(2), b3 => Fb(3),
      cin => SR,
      s0 => S1(0), s1 => S1(1), s2 => S1(2), s3 => S1(3),
      cout => cout1
   );

   andor: sum2b port map (
      a => S1(0), b => S1(1), c => S1(2),
      ans => V
   );

   sum2: TTL7483 port map (
      a0 => S1(0), a1 => S1(1), a2 => S1(2), a3 => S1(3),
      b0 => '0', b1 => V, b2 => V, b3 => '0',
      cin => '0',
      s0 => S2(0), s1 => S2(1), s2 => S2(2), s3 => S2(3),
      cout => cout2
   );

   sum3: TTL7483 port map (
      a0 => S2(0), a1 => S2(1), a2 => S2(2), a3 => S2(3),
      b0 => '0', b1 => cout1, b2 => cout1, b3 => '0',
      cin => '0',
      s0 => S3(0), s1 => S3(1), s2 => S3(2), s3 => S3(3),
      cout => cout2
   );

   comp: Complemento2 port map (
      s1 => S1(0), s2 => S1(1), s3 => S1(2), s4 => S1(3),
      cout => cout1,
      a => C(0), b => C(1), c => C(2), d => C(3)
   );
	invc1 <= NOT(cout1);
   plus1: TTL7483 port map (
      a0 => C(0), a1 => C(1), a2 => C(2), a3 => C(3),
      b0 => '0', b1 => '0', b2 => '0', b3 => '0', cin => invc1,
      s0 => R(0), s1 => R(1), s2 => R(2), s3 => R(3),
      cout => cout2
   );
   MUX1: TTL74157_4to1_Mux port map(SR, S3(3) , S3(2), S3(1), S3(0), R(3), R(2), R(1), R(0),
									ans2);
	M <= (V)OR(cout1);
   MUX2: TTL74157_4to1_Mux port map(SR, '0' , '0', '0', M, '0', '0', invc1, '0',
									ans1);

end arq1;




