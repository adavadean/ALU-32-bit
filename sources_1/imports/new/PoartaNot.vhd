library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PoartaNot is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR (31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end PoartaNot;

architecture Behavioral of PoartaNot is
  begin
   rez <= not A;

end Behavioral;
