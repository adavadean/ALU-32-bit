library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rstb is
end rstb;

architecture Behavioral of rstb is
component RotireStanga is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           A : in STD_LOGIC_VECTOR (31 downto 0);
           rez: out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal A : std_logic_vector (31 downto 0) := (others => '0');
signal rez : std_logic_vector (31 downto 0);

begin
    DUTT: RotireStanga
        port map (
            clk => clk,
            rst => rst,
            A => A,
            rez => rez);

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
        wait for 20 ns;

        rst <= '0';
        wait for 20 ns;

        -- se face rotirea
        A <= "00000000000000000000000000000001";
        wait for 20 ns;

        -- se verifica output
        assert rez = "00000000000000000000000000000010";
            report "!!!"
            severity failure;
            wait;
        end process;
end architecture;

