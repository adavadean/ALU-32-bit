library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RotireStanga is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           A : in STD_LOGIC_VECTOR (31 downto 0);
           rez: out STD_LOGIC_VECTOR (31 downto 0));
end RotireStanga;

architecture Behavioral of RotireStanga is
begin
      process(A)
        begin
            rez(0) <= A(31);
            rez(31 downto 1) <= A(30 downto 0);
    end process;
    
end Behavioral;
