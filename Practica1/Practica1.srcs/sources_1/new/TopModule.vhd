-- Archivo: TopModule.vhd
-- Módulo TOP que conecta todo el sistema de suma/resta BCD con displays

library ieee;
use ieee.std_logic_1164.all;

entity TopModule is
    port(
        -- Entradas de la Basys3
        clk    : in  std_logic;                     -- Reloj de 100 MHz
        reset  : in  std_logic;                     -- Reset (puede usar un botón)
        sw     : in  std_logic_vector(15 downto 0); -- Switches de la Basys3
        
        -- Salidas a la Basys3
        seg    : out std_logic_vector(6 downto 0);  -- Segmentos CA-CG  
        an     : out std_logic_vector(3 downto 0);  -- Ánodos AN3-AN0
        led    : out std_logic_vector(9 downto 0)  -- LEDs para debug
    );
end entity TopModule;

architecture behavioral of TopModule is
    
    -- Declaración de componentes
    component SumaRestaBCD is
        port(
            A     : in  std_logic_vector(7 downto 0);
            B     : in  std_logic_vector(7 downto 0); 
            SR    : in  std_logic;
            ans1  : out std_logic_vector(3 downto 0);
            ans2  : out std_logic_vector(3 downto 0);
            COUT  : out std_logic
        );
    end component;
    
    component DisplayController is
        port(
            clk      : in  std_logic;
            reset    : in  std_logic;
            unidades : in  std_logic_vector(3 downto 0);
            decenas  : in  std_logic_vector(3 downto 0);
            seg      : out std_logic_vector(6 downto 0);
            an       : out std_logic_vector(3 downto 0)
        );
    end component;
    
    -- Señales internas
    signal A_input     : std_logic_vector(7 downto 0);
    signal B_input     : std_logic_vector(7 downto 0);
    signal SR_input    : std_logic;
    signal resultado_unidades : std_logic_vector(3 downto 0);
    signal resultado_decenas  : std_logic_vector(3 downto 0);
    signal carry_out   : std_logic;
    
begin
    
    -- Mapeo de entradas desde los switches
    -- A[3:0] = SW[3:0], A[7:4] = "0000" (no conectado, será 0)
    A_input <= "0000" & sw(3 downto 0);
    
    -- B[3:0] = SW[7:4], B[7:4] = "0000" (no conectado, será 0)  
    B_input <= "0000" & sw(7 downto 4);
    
    -- Control suma/resta desde SW8
    SR_input <= sw(8);
    
    -- Instancia del sumador/restador BCD
    suma_resta_inst: SumaRestaBCD
        port map(
            A    => A_input,
            B    => B_input,
            SR   => SR_input,
            ans1 => resultado_unidades,
            ans2 => resultado_decenas, 
            COUT => carry_out
        );
    
    -- Instancia del controlador de displays
    display_inst: DisplayController
        port map(
            clk      => clk,
            reset    => reset,
            unidades => resultado_unidades,
            decenas  => resultado_decenas,
            seg      => seg,
            an       => an
        );
    
    -- Conexión de LEDs para debug
    led(3 downto 0)   <= resultado_unidades;  -- Unidades en LEDs 0-3
    led(7 downto 4)   <= resultado_decenas;   -- Decenas en LEDs 4-7
    led(8)            <= carry_out;           -- Carry out en LED 8
    led(9)            <= SR_input;            -- Estado suma/resta en LED 9
    
end architecture behavioral;