library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alu is
  Port (clk : in STD_LOGIC);
end Alu;

architecture Behavioral of Alu is

component Ripple_Carry_Adder is

    Port ( clk : in  std_logic;
           rst : in  std_logic; 
           A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           SUMA : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Scadere is
    Port (clk : in  std_logic;
          rst : in  std_logic;
          A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          RES : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Incrementare is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR(31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Negare is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR(31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Decrementare is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR(31 downto 0);
         rez : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component PoartaOr is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR (31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component PoartaAnd is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR (31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component PoartaNot is
 Port ( clk : in  std_logic;
         rst : in  std_logic;
         A : in STD_LOGIC_VECTOR (31 downto 0);
         rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component RotireDreapta is
     Port (clk : in  std_logic;
       rst : in  std_logic; 
       A : in STD_LOGIC_VECTOR (31 downto 0);
       rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component RotireStanga is
      Port (clk : in  std_logic;
       rst : in  std_logic; 
       A : in STD_LOGIC_VECTOR (31 downto 0);
       rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Inmultire is
   Port (clk : in  std_logic;
         rst : in  std_logic; 
         A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         MUL : out STD_LOGIC_VECTOR (63 downto 0));
end component;

component Impartire is 
   Port   ( clk : in  std_logic;
           rst : in  std_logic;
           dividend : in  std_logic_vector(31 downto 0);
           divisor : in  std_logic_vector(31 downto 0);
           quotient : out  std_logic_vector(31 downto 0);
           remainder : out  std_logic_vector(31 downto 0));
end component;

Signal A,MULL,OUTREG : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');
Signal quotientt, remainderr: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
Signal B : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');

Signal SUMA,SUBB,NEGR,ROTR,ROTL,NOTR,ANDR,ORR,INCR,DECR : STD_LOGIC_VECTOR (31 downto 0);
Signal dividend, divisor, quotient, remainder : STD_LOGIC_VECTOR (31 downto 0);
Signal clkk,rstt : std_logic;
begin
      
    ADD: Ripple_Carry_Adder port map(clk=> clkk,rst=> rstt,A=> A(31 downto 0), B=>B(31 downto 0),SUMA=>SUMA);   
    SUB: Scadere port map(clk=> clkk,rst=> rstt,A=> A(31 downto 0), B=>B(31 downto 0),RES=>SUBB);  
    INC : Incrementare port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez => INCR);  
    DEC : Decrementare port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez => DECR);   
    INM: Inmultire port map(clk=> clkk,rst=> rstt,A=> A(31 downto 0),B=>B(31 downto 0),MUL=>MULL);     
    NEG : Negare port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez=>NEGR);  
    RD : RotireDreapta port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez=> ROTR);  
    RS : RotireStanga port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez => ROTL);  
    PNU : PoartaNot port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez => NOTR); 
    PSI : PoartaAnd port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez => ANDR);  
    PSAU : PoartaOr port map(clk=> clkk,rst=> rstt,A => A(31 downto 0), rez => ORR);  
    IMP : Impartire port map (clk=> clkk,rst=> rstt, dividend => dividend (31 downto 0), divisor =>divisor (31 downto 0), quotient => quotientt, remainder =>remainderr);
                        
end Behavioral;
