library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Inmultire is
  Port  (clk : in  std_logic;
         rst : in  std_logic; 
         A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         MUL : out STD_LOGIC_VECTOR (63 downto 0));
end Inmultire;

architecture Behavioral of Inmultire is

component Negare is
   Port ( clk : in  std_logic;
          rst : in  std_logic; 
          A : in STD_LOGIC_VECTOR(31 downto 0);
          rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

 Signal Anegat, Bnegat, Bb : STD_LOGIC_VECTOR (31 downto 0);
 Signal partial : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
 Signal Acopie  : STD_LOGIC_VECTOR (31 downto 0);
 
begin
    NEG1 : Negare port map (
        clk => clk,
        rst => rst,
        A => A,
        rez=> Anegat);
      
     NEG2 : Negare port map (
        clk => clk,
        rst => rst,
        A => B,
        rez => Bnegat);
        
    process(A,B,Anegat,Bnegat)
         begin
             if A(31) = '1' then
                    Acopie <= Anegat;
                  else
                    Acopie <= A;
                  end if;
                  
                  if B(31) = '1' then
                    Bb <=Bnegat;
                    else
                    Bb <= B;  
                  end if;
                       
            end process;    
        
        partial <= STD_LOGIC_VECTOR(unsigned(Acopie) * unsigned(Bb));
            
        process(A,B,partial)
            begin
              if (A(31) ='1' and B(31) = '0' ) or (A(31) ='0' and B(31) = '1' ) then
                    MUL <= std_logic_vector(unsigned(not partial) + 1);
               else
                  MUL <= partial;
               end if;
         end process;
                                   
end Behavioral;

