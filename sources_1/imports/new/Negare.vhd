library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Negare is
  Port (clk : in  std_logic;
        rst : in  std_logic;  
        A : in STD_LOGIC_VECTOR(31 downto 0);
        rez : out STD_LOGIC_VECTOR (31 downto 0));
end;

architecture Behavioral of Negare is

component Incrementare is
  Port (  clk : in  std_logic;
          rst : in  std_logic; 
          A : in STD_LOGIC_VECTOR(31 downto 0);
          rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

Signal Anegat : STD_LOGIC_VECTOR (31 downto 0);

begin

    Anegat <= not A;
    
    INC : Incrementare port map (
        clk => clk,
        rst => rst,
        A => Anegat,
        rez=> rez);

end Behavioral;
