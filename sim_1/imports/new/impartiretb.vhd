library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity impartiretb is
end impartiretb;

architecture tb of impartiretb is

    component Impartire is
    Port ( clk : in  std_logic;
           rst : in  std_logic; 
           dividend : in STD_LOGIC_VECTOR(63 downto 0);
           divisor : in STD_LOGIC_VECTOR(31 downto 0);
           dividezero: out STD_LOGIC;
           quotient : out STD_LOGIC_VECTOR(31 downto 0);
           remainder : out STD_LOGIC_VECTOR(63 downto 0));
end component;
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal dividend : std_logic_vector(63 downto 0) := (others => '0');
    signal divisor : std_logic_vector(31 downto 0) := (others => '0');
    signal dividezero : std_logic;
    signal quotient : std_logic_vector(31 downto 0);
    signal remainder : std_logic_vector(63 downto 0);
 

begin
    
    DUT: Impartire
        port map (
            clk => clk,
            rst => rst,
            dividend => dividend,
            divisor => divisor,
            dividezero => dividezero,
            quotient => quotient,
            remainder => remainder);
            
    clk_process: process
                begin
                    clk <= '0';
                    wait for 5 ns;
                    clk <= '1';
                    wait for 5 ns;
                end process;


    stim_process: process
    begin
        rst <= '1';
        dividend <= "0000000000000000000000000000000000000000000000000000000000001010" ;
        divisor <= "00000000000000000000000000000010" ;
        
        rst <= '0';
        wait for 20 ns;

        assert quotient = "00000000000000000000000000000101";
            report "!!!"
            severity failure;
        assert remainder = "0000000000000000000000000000000000000000000000000000000000000000";
            report "!!!"
            severity failure;
       dividend <="1111111111111111111111111111111111111111111111111111010111110111" ; -- -1527
       divisor <= "00000000000000000000000011100011" ; --227
       wait for 20 ns;
       assert quotient = "";
                   report "!!!"
                   severity failure;
               assert remainder = "";
                   report "!!!"
                   severity failure;
         dividend <="0000000000000000000000000000000000000000000000000000010111110111" ; -- 1527
         divisor <= "00000000000000000000000011100011"; --227
                wait for 20 ns;
         assert quotient = "";
                      report "!!!"
                       severity failure;
                assert remainder = "";
                       report "!!!"
                       severity failure;
                wait;
            end process;
        end architecture;
