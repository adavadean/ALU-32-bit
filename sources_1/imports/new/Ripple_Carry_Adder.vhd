library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Carry_Adder is
    Port ( clk : in  std_logic;
           rst : in  std_logic; 
           A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           SUMA : out STD_LOGIC_VECTOR (31 downto 0));
end Ripple_Carry_Adder;

architecture Behavioral of Ripple_Carry_Adder is

component Full_Adder
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           COUT : out STD_LOGIC );
end component;

Signal carry : STD_LOGIC_VECTOR (32 downto 0);
Signal summa : STD_LOGIC_VECTOR (31 downto 0);
begin
    carry(0) <= '0';
    Addition: 
    for i in 0 to 31 generate
        FA: Full_Adder port map (
            A => A(i),
            B => B(i),
            CIN => carry(i),
            SUM => summa(i),
            COUT => carry(i+1));           
     end generate;    
     SUMA <= summa;   

end Behavioral;
