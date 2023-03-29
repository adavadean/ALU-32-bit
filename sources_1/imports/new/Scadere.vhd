library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Scadere is
    Port (clk : in  std_logic;
          rst : in  std_logic; 
          A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          RES : out STD_LOGIC_VECTOR (31 downto 0));
end Scadere;

architecture Behavioral of Scadere is

component Ripple_Carry_Adder is
    
    Port ( clk : in  std_logic;
           rst : in  std_logic; 
           A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           SUMA : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Negare is
 Port ( clk : in  std_logic;
        rst : in  std_logic;  
        A : in STD_LOGIC_VECTOR(31 downto 0);
        rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

Signal Bnegat, result : STD_LOGIC_VECTOR (31 downto 0);

begin

  NEG: Negare port map(
    clk => clk,
    rst => rst,
    A => B,
    rez => Bnegat);
    
  RCA: Ripple_Carry_Adder port map (
    clk => clk,
    rst => rst,
    A => A,
    B => Bnegat,
    SUMA => result); 
    RES <= result;
    
   
end Behavioral;
