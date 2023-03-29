library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Incrementare is
  Port (clk : in  std_logic;
        rst : in  std_logic;
        A : in STD_LOGIC_VECTOR(31 downto 0);
        rez : out STD_LOGIC_VECTOR (31 downto 0));
end;

architecture Behavioral of Incrementare is

component Ripple_Carry_Adder is
    Port (clk : in  std_logic;
          rst : in  std_logic;
          A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          SUMA : out STD_LOGIC_VECTOR (31 downto 0));
end component;
begin
  
    INC : Ripple_Carry_Adder port map (
        clk => clk,
        rst => rst,
        A => A,
        B => "00000000000000000000000000000001",
        SUMA => rez);
        
end Behavioral;
