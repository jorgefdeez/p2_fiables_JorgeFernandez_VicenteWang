library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_3 is
    Port (
        clk      : in  STD_LOGIC;
        ena      : in  STD_LOGIC;
        f_div_5  : out STD_LOGIC;
        f_div_2_5 : out STD_LOGIC;
        f_div_1  : out STD_LOGIC
    );
end divisor_3;

architecture Behavioral of divisor_3 is
    signal count_5   : integer := 0;
    signal count_2_5 : integer := 0;
    signal count_1   : integer := 0;
    
    signal clk_5    : STD_LOGIC := '0';
    signal clk_2_5  : STD_LOGIC := '0';
    signal clk_1    : STD_LOGIC := '0';

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if ena = '0' then
                count_5   <= 0;
                count_2_5 <= 0;
                count_1   <= 0;
                clk_5     <= '1';
                clk_2_5   <= '1';
                clk_1     <= '1';
            else
                if count_5 = 9 then
                    count_5 <= 0;
                    clk_5 <= '1';
                else
                    count_5 <= count_5 + 1;
                    clk_5 <= '0';
                end if;
                
                if count_2_5 = 19 then
                    count_2_5 <= 0;
                    clk_2_5 <= '1';
                else
                    count_2_5 <= count_2_5 + 1;
                    clk_2_5 <= '0';
                end if;
                
                if count_1 = 49 then
                    count_1 <= 0;
                    clk_1 <= '1';
                else
                    count_1 <= count_1 + 1;
                    clk_1 <= '0';
                end if;
            end if;
        end if;
    end process;

    f_div_5  <= clk_5;
    f_div_2_5 <= clk_2_5;
    f_div_1  <= clk_1;

end Behavioral;