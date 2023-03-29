library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Impartire is
    Port ( clk : in  std_logic;
           rst : in  std_logic; 
           dividend : in STD_LOGIC_VECTOR(63 downto 0);
           divisor : in STD_LOGIC_VECTOR(31 downto 0);
           dividezero: out STD_LOGIC;
           quotient : out STD_LOGIC_VECTOR(31 downto 0);
           remainder : out STD_LOGIC_VECTOR(63 downto 0));
end Impartire;

architecture Behavioral of Impartire is

begin

   process(dividend,divisor)
   variable r : STD_LOGIC_VECTOR(63 downto 0);
   variable q : STD_LOGIC_VECTOR(31 downto 0);
   begin
   
       q := (others => '0');
       r := (others => '0');
       dividezero <= '0';
       
       if (divisor = X"00000000") then
            dividezero <= '1';
       end if;
       
       for i in 31 downto 0 loop
       
          r := r(62 downto 0) & "0";
          r(0) := dividend(i);
          
          if r >= divisor then
              q(i) := '1';
              r := r - divisor;
          end if;     
       end loop;
       
       quotient <= STD_LOGIC_VECTOR(q);
       remainder <= STD_LOGIC_VECTOR(r);  
       
   end process;

end Behavioral;