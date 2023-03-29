library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inmultiretb is
end inmultiretb;

architecture Behavioral of inmultiretb is
component Inmultire is
      Port  (clk : in  std_logic;
             rst : in  std_logic; 
             A : in STD_LOGIC_VECTOR (31 downto 0);
             B : in STD_LOGIC_VECTOR (31 downto 0);
             MUL : out STD_LOGIC_VECTOR (63 downto 0));
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal A : std_logic_vector (31 downto 0) := (others => '0');
signal B : std_logic_vector (31 downto 0) := (others => '0');
signal MUL : std_logic_vector (63 downto 0);

begin
    DUTT: Inmultire
        port map (
            clk => clk,
            rst => rst,
            A => A,
            B => B,
            MUL => MUL);

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
        A <= "00000000000000000000000000000001";
        B <= "00000000000000000000000000000001";
        wait for 20 ns;

        rst <= '0';
        wait for 20 ns;

        -- se face inmultirea
        A <= "00000000000000000000000000000001";
        B <= "00000000000000000000000000000001";
        wait for 20 ns;

        -- se verifica output
        assert MUL = "0000000000000000000000000000000000000000000000000000000000000001";
            report "!!!"
            severity failure;
            
         A <= "00000000000000000000001000011010";
         B <= "11111111111111111111111111111110";
             wait for 20 ns;
           
            -- se verifica output
         assert MUL = "111111111111111111111111111111111111111111111111111101111001100";
                report "!!!"
                severity failure;
          A <= "00000000000000000000000011100011"; -- 227
          B <= "11111111111111111111101000001001"; -- -1527
              wait for 20 ns;
                                             
          assert MUL = ""; -- -346629
                  report "!!!"
                  severity failure;   
                    
            wait;
        end process;
end architecture;
