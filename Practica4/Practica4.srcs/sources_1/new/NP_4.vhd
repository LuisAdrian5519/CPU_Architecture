library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity NP_4 is
	port( 
	CLK : in STD_LOGIC;				-- Clock	
	
	BTN_Reset : in STD_LOGIC;		-- Boton para hacer reset					-- Boton del medio

	Switches_Entradas : in std_logic_vector(11 downto 0) := (others => '0');-- Entradas del ususario

	BTN_Save_Var_A : in STD_Logic;	-- Boton para guardar en la variable A		-- Boton izquierdo
	BTN_Save_Var_B : in STD_LOGIC;	-- Boton para guardar en la variable B		-- Boton derecho

	LED_Resultado : out std_logic_vector(11 downto 0) := (others => '0')
	);
end NP_4;

architecture arq1 of NP_4 is
	--signals
	signal regA_S : std_logic;
	signal regA_E : std_logic_vector(4 downto 0):= (others => '0');		
	signal regA_M : std_logic_vector(5 downto 0);		--Mantisa de A, 6 bits

	signal regB_S : std_logic;
	signal regB_E : std_logic_vector(4 downto 0):= (others => '0');		
	signal regB_M : std_logic_vector(5 downto 0);		--Mantisa de A, 6 bits

	--Mantisa--
	signal mantisaMasUnoA : unsigned(6 downto 0);		--Mattisa, 7 bits
	signal mantisaMasUnoB : unsigned(6 downto 0);		--Mattisa, 7 bits
	signal multiplicacionMantisas : unsigned(13 downto 0);
	signal checkNorm : integer range -1 to 1 := 0;
	
	--Exponente--
	signal regIntExponenteA : integer range 0 to 31 := 0;
	signal regIntExponenteB : integer range 0 to 31 := 0;
	signal sumaExponente : integer range 0 to 31 := 0;


	--Resultados--
	signal regLED_R : std_logic_vector(11 downto 0):= (others => '0');
	signal regR_S : std_logic;							-- 1
	signal regR_E : std_logic_vector(4 downto 0):= (others => '0');		-- 5
	signal regR_M : std_logic_vector(5 downto 0):= (others => '0');		-- 6
	
	
begin

	process(clk)
variable tmp : integer;
	begin
		if rising_edge(CLK) then
			if BTN_Reset = '1' then
				--regLED_A <= (others => '0');
				regA_S <= '0';
				regA_E  <= (others => '0');
    			regA_M  <= (others => '0');
				--regLED_B <= (others => '0');
				regB_S <= '0';
				regB_E  <= (others => '0');
    			regB_M  <= (others => '0');
			else
				if BTN_Save_Var_A = '1' then
					--regLED_A <= Switches_Entradas;
					regA_S <= Switches_Entradas(11);
					regA_E  <= Switches_Entradas(10 downto 6);
   					regA_M  <= Switches_Entradas(5 downto 0);
				end if;
				if BTN_Save_Var_B = '1' then
					--regLED_B <= Switches_Entradas;
					regB_S <= Switches_Entradas(11);
					regB_E  <= Switches_Entradas(10 downto 6);
   					regB_M  <= Switches_Entradas(5 downto 0);
				end if;
				
				-- Multiplicacion
				-- Mantisa --
				mantisaMasUnoA <= unsigned('1' & regA_M); -- añadir bit implícito
				mantisaMasUnoB <= unsigned('1' & regB_M); -- añadir bit implícito


				multiplicacionMantisas <= mantisaMasUnoA * mantisaMasUnoB;

				if multiplicacionMantisas(13) = '1' then
					-- Overflow
					checkNorm <= 1;
				elsif multiplicacionMantisas(12) = '1' then
					-- Normal
					checkNorm <= 0;
				else
					checkNorm <= -1;
				end if;

				if checkNorm = 1 then
					regR_M <= std_logic_vector(multiplicacionMantisas(12 downto 7));
				elsif checkNorm = 0 then
					regR_M <= std_logic_vector(multiplicacionMantisas(11 downto 6));
				else 
					regR_M <= std_logic_vector(multiplicacionMantisas(10 downto 5));
				end if;

				-- Exponente --
				regIntExponenteA <= to_integer(unsigned(regA_E));
				regIntExponenteB <= to_integer(unsigned(regB_E));
				tmp := regIntExponenteA + regIntExponenteB - 15 + checkNorm;

				if tmp > 31 then
            		sumaExponente <= 31; -- saturar al máximo representable
        		elsif tmp < 0 then
            		sumaExponente <= 0; -- saturar al mínimo
        		else
            		sumaExponente <= tmp;
        		end if;
	
				-- Resultado final
				-- Signo
				regR_S <= regA_S XOR regB_S;
				-- Exponente
				regR_E <= std_logic_vector(to_unsigned(sumaExponente, 5));
		
        		regLED_R <= regR_S & regR_E & regR_M;
				
			end if;
		end if;
	end process;

	--registros
	LED_Resultado <= regLED_R;

end arq1;