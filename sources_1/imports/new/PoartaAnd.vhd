library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PoartaAnd is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end PoartaAnd;

architecture Behavioral of PoartaAnd is
  begin
    rez <= A and B;
end Behavioral;
