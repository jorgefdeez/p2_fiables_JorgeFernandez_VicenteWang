library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_divisor_3 is
end tb_divisor_3;

architecture testbench of tb_divisor_3 is
    signal clk_tb      : STD_LOGIC := '0';
    signal ena_tb      : STD_LOGIC := '0';
    signal f_div_5_tb  : STD_LOGIC;
    signal f_div_2_5_tb : STD_LOGIC;
    signal f_div_1_tb  : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin
    uut: entity work.divisor_3 port map (
        clk      => clk_tb,
        ena      => ena_tb,
        f_div_5  => f_div_5_tb,
        f_div_2_5 => f_div_2_5_tb,
        f_div_1  => f_div_1_tb
    );
    
    clk_process : process
    begin
        while now < 2000 ns loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stimulus_process: process
    begin
        ena_tb <= '0';
        wait for 100 ns;
        ena_tb <= '1';
        wait;
    end process;

end testbench;