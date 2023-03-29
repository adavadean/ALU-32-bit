library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity scaderetb is
end scaderetb;

architecture Behavioral of scaderetb is
component Scadere is
      Port (clk : in  std_logic;
            rst : in  std_logic; 
            A : in STD_LOGIC_VECTOR (31 downto 0);
            B : in STD_LOGIC_VECTOR (31 downto 0);
            RES : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal A : std_logic_vector (31 downto 0) := (others => '0');
signal B : std_logic_vector (31 downto 0) := (others => '0');
signal RES: std_logic_vector (31 downto 0);

begin
    DUTT: Scadere
        port map (
            clk => clk,
            rst => rst,
            A => A,
            B => B,
            RES => RES);

    clk_process: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    stim_process: process
    begin
        -- Initializare
        rst <= '1';
        A <= "00000000000000000000000000001010";
        B <= "00000000000000000000000000000100";
        wait for 20 ns;

        rst <= '0';
        wait for 20 ns;

        -- se face scaderea
        A <= "00000000000000000000000000001010";
        B <= "00000000000000000000000000000100";
        wait for 20 ns;

        -- se verifica output
        assert RES = "00000000000000000000000000000110";
            report "!!!"
            severity failure;

        A <= "11111111111111111111111111111111";
        B <= "00000000000000000000000000000110";
        wait for 20 ns;

        assert RES = "11111111111111111111111111111001";
            report "!!!"
            severity failure;
         A <= "11111111111111111111111111111111";
         B <= "11111111111111111111111111111010";
                   wait for 20 ns;
           
                   assert RES = "00000000000000000000000000000101";
                       report "!!!"
                       severity failure;
          A <= "00000000000000000000000011100011"; -- 227
          B <= "11111111111111111111101000001001"; -- -1527 
                    wait for 20 ns;
                                                    
         assert RES = ""; -- -1754
                   report "!!!"
                   severity failure;      
            wait;
        end process;
end architecture;
