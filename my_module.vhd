library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_module is
    port (
        clk : in std_logic;
        rst : in std_logic;
    );
end my_module;

architecture rtl of my_module is

    constant my_constant : integer := 0;
    signal my_signal : std_logic_vector(15 downto 0);
    signal my_int : integer range 0 to 63;

    type arr_type is array (0 to  255) of std_logic_vector(7 downto 0);
    type my_state_type_type is (IDLE, STATE_1);
    signal my_state_type : my_state_type_type;

begin
    
    FSM_PROC : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                my_state <= IDLE;
    
            else
                case my_state is
    
                    when IDLE =>
                    when STATE_1 =>

                        if counter = 1 then
                            counter <= counter + 1;
                            
                        elsif counter = 2 then
                            counter <= counter - 1;

                        else
                                    
                        end if;
                        
                        
    
                end case;
    
            end if;
        end if;
    end process;

end architecture;