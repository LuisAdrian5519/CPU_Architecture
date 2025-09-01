-- Archivo: suma_resta_bcd.vhd
-- Este código implementa un sumador y restador BCD de dos digitos.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- La entidad define las entradas y salidas del módulo
entity SumaRestaBCD is
    port (
        A     : in  std_logic_vector(7 downto 0); -- Primer numero BCD de 2 digitos (8 bits)
        B     : in  std_logic_vector(7 downto 0); -- Segundo numero BCD de 2 digitos (8 bits)
        SR    : in  std_logic;                    -- Selector de operacion ('0' = Suma, '1' = Resta)
        ans1  : out std_logic_vector(3 downto 0); -- Digito de las unidades del resultado BCD
        ans2  : out std_logic_vector(3 downto 0); -- Digito de las decenas del resultado BCD
        COUT  : out std_logic                     -- Acarreo para el digito de las centenas o signo
    );
end entity SumaRestaBCD;

-- La arquitectura se definira a continuacion...
architecture behavioral of SumaRestaBCD is

    -- Declaracion del componente para el complemento a 9
    component ComplementoBCD is
        port(
            entrada : in std_logic_vector(3 downto 0);
            salida  : out std_logic_vector(3 downto 0)
        );
    end component;
	 
	 -- Declaracion del componente para el sumador binario
    component TTL7483 is
        port(
            a0, a1, a2, a3, b0, b1, b2, b3, cin : in std_logic;
            s0, s1, s2, s3, cout               : out std_logic
        );
    end component;

    -- Senales internas para manejar los digitos individuales
    signal A_unidades         : std_logic_vector(3 downto 0);
    signal A_decenas          : std_logic_vector(3 downto 0);
    signal B_unidades         : std_logic_vector(3 downto 0);
    signal B_decenas          : std_logic_vector(3 downto 0);
    signal B_comp_unidades    : std_logic_vector(3 downto 0);
    signal B_comp_decenas     : std_logic_vector(3 downto 0);
    signal B_adj_unidades     : std_logic_vector(3 downto 0);
    signal B_adj_decenas      : std_logic_vector(3 downto 0);
	 
	 -- Senales para los resultados de la suma binaria
    signal sum_unidades_bin   : std_logic_vector(3 downto 0);
    signal sum_decenas_bin    : std_logic_vector(3 downto 0);
    signal carry_unidades     : std_logic;
    signal carry_decenas      : std_logic;
	 
	 -- Senales para la logica de correccion
    signal corr_unidades      : std_logic;
    signal corr_decenas       : std_logic;
    signal sum_unidades_corr  : std_logic_vector(3 downto 0);
    signal sum_decenas_corr   : std_logic_vector(3 downto 0);
    signal carry_unidades_corr: std_logic;
    signal carry_decenas_corr : std_logic;
	 
	 -- Senales para el resultado final y logica de resta
    signal final_unidades     : std_logic_vector(3 downto 0);
    signal final_decenas      : std_logic_vector(3 downto 0);
    signal cout_final         : std_logic;
    signal final_ans1         : std_logic_vector(3 downto 0);
    signal final_ans2         : std_logic_vector(3 downto 0);

begin
    -- Paso 1: Separar los digitos de las entradas de 8 bits
    A_unidades <= A(3 downto 0);
    A_decenas  <= A(7 downto 4);
    B_unidades <= B(3 downto 0);
    B_decenas  <= B(7 downto 4);
	 
	 -- Instanciar dos componentes de complemento a 9, uno para cada digito de B
    comp_unidades: ComplementoBCD port map (
        entrada => B_unidades,
        salida  => B_comp_unidades
    );
	 
	 comp_decenas: ComplementoBCD port map (
        entrada => B_decenas,
        salida  => B_comp_decenas
    );
	 
	 -- Paso 2: Logica condicional para seleccionar entre suma y resta
    -- Si SR = '0', usamos el numero B original
    -- Si SR = '1', usamos el complemento a 9 del numero B
    process(SR, B_unidades, B_comp_unidades, B_decenas, B_comp_decenas)
    begin
        if SR = '0' then
            B_adj_unidades <= B_unidades;
            B_adj_decenas  <= B_decenas;
        else -- SR = '1'
            B_adj_unidades <= B_comp_unidades;
            B_adj_decenas  <= B_comp_decenas;
        end if;
    end process;
    
    -- Paso 3: Realizar la suma binaria de los digitos (unidades y decenas)
    -- Suma de las unidades
    suma_unidades: TTL7483 port map (
        a0   => A_unidades(0),
        a1   => A_unidades(1),
        a2   => A_unidades(2),
        a3   => A_unidades(3),
        b0   => B_adj_unidades(0),
        b1   => B_adj_unidades(1),
        b2   => B_adj_unidades(2),
        b3   => B_adj_unidades(3),
        cin  => SR, -- El acarreo de entrada es la senal SR para la resta
        s0   => sum_unidades_bin(0),
        s1   => sum_unidades_bin(1),
        s2   => sum_unidades_bin(2),
        s3   => sum_unidades_bin(3),
        cout => carry_unidades
    );
	 
	 -- Suma de las decenas
    suma_decenas: TTL7483 port map (
        a0   => A_decenas(0),
        a1   => A_decenas(1),
        a2   => A_decenas(2),
        a3   => A_decenas(3),
        b0   => B_adj_decenas(0),
        b1   => B_adj_decenas(1),
        b2   => B_adj_decenas(2),
        b3   => B_adj_decenas(3),
        cin  => carry_unidades, -- El acarreo de la suma de unidades es la entrada
        s0   => sum_decenas_bin(0),
        s1   => sum_decenas_bin(1),
        s2   => sum_decenas_bin(2),
        s3   => sum_decenas_bin(3),
        cout => carry_decenas
    );
    
    -- Paso 4: Logica de correccion BCD
    -- Deteccion de correccion para las unidades: si el resultado es > 9 o hay acarreo
    corr_unidades <= '1' when (sum_unidades_bin > "1001") or (carry_unidades = '1') else '0';
    
    -- Suma de correccion para las unidades
    suma_corr_unidades: TTL7483 port map (
        a0   => sum_unidades_bin(0),
        a1   => sum_unidades_bin(1),
        a2   => sum_unidades_bin(2),
        a3   => sum_unidades_bin(3),
        b0   => '0',
        b1   => '1',
        b2   => '1',
        b3   => '0', -- Sumamos 6 (0110)
        cin  => '0',
        s0   => sum_unidades_corr(0),
        s1   => sum_unidades_corr(1),
        s2   => sum_unidades_corr(2),
        s3   => sum_unidades_corr(3),
        cout => carry_unidades_corr
    );
	 
	 -- Deteccion de correccion para las decenas: si el resultado es > 9 o hay acarreo
    corr_decenas <= '1' when (sum_decenas_bin > "1001") or (carry_decenas = '1') else '0';

    -- Suma de correccion para las decenas
    suma_corr_decenas: TTL7483 port map (
        a0   => sum_decenas_bin(0),
        a1   => sum_decenas_bin(1),
        a2   => sum_decenas_bin(2),
        a3   => sum_decenas_bin(3),
        b0   => '0',
        b1   => '1',
        b2   => '1',
        b3   => '0', -- Sumamos 6 (0110)
        cin  => carry_unidades_corr, -- El acarreo de la correccion de unidades es la entrada
        s0   => sum_decenas_corr(0),
        s1   => sum_decenas_corr(1),
        s2   => sum_decenas_corr(2),
        s3   => sum_decenas_corr(3),
        cout => carry_decenas_corr
    );
	 
    -- Paso 5: Asignar los resultados de la suma o resta antes de la correccion final
    final_unidades <= sum_unidades_corr when corr_unidades = '1' else sum_unidades_bin;
    final_decenas  <= sum_decenas_corr when corr_decenas = '1' else sum_decenas_bin;
    cout_final     <= carry_decenas_corr when corr_decenas = '1' else carry_decenas;

    -- Paso 6: Logica de resta y asignacion final
    -- Si es una resta (SR = '1') y no hay acarreo final (cout_final = '0'), el resultado es negativo.
    -- En ese caso, debemos aplicar el complemento a 9 al resultado para obtener la magnitud correcta.
    -- Para cualquier otro caso (suma o resta positiva), el resultado ya esta correcto.
    
    -- Instancia del complemento a 9 para las unidades de la respuesta final
    final_comp_unidades: ComplementoBCD port map(
        entrada => final_unidades,
        salida  => final_ans1
    );

    -- Instancia del complemento a 9 para las decenas de la respuesta final
    final_comp_decenas: ComplementoBCD port map(
        entrada => final_decenas,
        salida  => final_ans2
    );

    -- Asignacion condicional a las salidas finales
    ans1 <= final_ans1 when SR = '1' and cout_final = '0' else final_unidades;
    ans2 <= final_ans2 when SR = '1' and cout_final = '0' else final_decenas;
    COUT <= cout_final;
	 
end architecture behavioral;
