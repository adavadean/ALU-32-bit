library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adunaretb is
end adunaretb;

architecture Behavioral of adunaretb is
component Ripple_Carry_Adder is
     Port ( clk : in  std_logic;
          rst : in  std_logic; 
          A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          SUMA : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal A : std_logic_vector (31 downto 0) := (others => '0');
signal B : std_logic_vector (31 downto 0) := (others => '0');
signal SUMA : std_logic_vector (31 downto 0);

begin
    DUTT: Ripple_Carry_Adder
        port map (
            clk => clk,
            rst => rst,
            A => A,
            B => B,
            SUMA => SUMA);

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
        A <= "00000000000000000000000000000001"; --1
        B <= "00000000000000000000000000000001"; --1
        wait for 20 ns;

        rst <= '0';
        wait for 20 ns;

        -- se face adunarea
        A <= "00000000000000000000000000000001";
        B <= "00000000000000000000000000000001";
        wait for 20 ns;

        -- se verifica output
        assert SUMA = "00000000000000000000000000000010"; --2
            report "!!!"
            severity failure;

        A <= "11111111111111111111111111111001"; -- -7
        B <= "11111111111111111111111111110110"; -- -10
        wait for 20 ns;

        assert SUMA = "11111111111111111111111111101111"; -- -17
            report "!!!"
            severity failure;
            
         A <= "10000000000000000000000000000000"; 
         B <= "10000000000000000000000000000000"; 
         wait for 20 ns;
         assert SUMA = "100000000000000000000000000000000";
               report "!!!"
               severity failure;    
         
           A <= "00000000000000000000000000000010"; -- 2
           B <= "11111111111111111111111111101111"; -- -17
           wait for 20 ns;
             
           assert SUMA = "11111111111111111111111111110001"; -- -15
                   report "!!!"
                   severity failure;
                   
              A <= "00000000000000000000000011100011"; -- 227
              B <= "11111111111111111111101000001001"; -- -1527 
                     wait for 20 ns;
                              
              assert SUMA = ""; -- -1300
                             report "!!!"
                             severity failure;                        
            wait;
        end process;
end architecture;