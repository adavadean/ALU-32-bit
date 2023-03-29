library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PoartaOr is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end PoartaOr;

architecture Behavioral of PoartaOr is
  begin
    rez <= A or B;
end Behavioral;

