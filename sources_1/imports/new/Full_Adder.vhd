library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           COUT : out STD_LOGIC );
end Full_Adder;

architecture Behavioral of Full_Adder is

begin

SUM <= A xor B xor CIN; 
COUT <= ((A and B) or (A and CIN) or (B and CIN));

end Behavioral;