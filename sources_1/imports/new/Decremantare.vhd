library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decrementare is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR(31 downto 0);
         rez : out STD_LOGIC_VECTOR(31 downto 0));
end Decrementare;

architecture Behavioral of Decrementare is

component Scadere is

   Port ( clk : in  std_logic;
          rst : in  std_logic; 
          A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          RES : out STD_LOGIC_VECTOR (31 downto 0));
        
end component;
Signal error : STD_LOGIC;
begin
   
   DEC : Scadere port map(
       clk => clk,
       rst => rst,
       A => A,
       B => "00000000000000000000000000000001",
       RES => rez);
   
end Behavioral;