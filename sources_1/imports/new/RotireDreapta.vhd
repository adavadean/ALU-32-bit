library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RotireDreapta is
    Port (clk : in  std_logic;
          rst : in  std_logic; 
          A : in STD_LOGIC_VECTOR (31 downto 0);
          rez : out STD_LOGIC_VECTOR (31 downto 0));
end RotireDreapta;

architecture Behavioral of RotireDreapta is
begin
    process(A)
        begin
            rez(31) <= A(0);                 
            rez(30 downto 0) <= A(31 downto 1);             
    end process;
    
end Behavioral;
