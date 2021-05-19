library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hrcs_accummulator_new is
            generic( 
               n : integer := 33;
               k : integer := 62
            );
            port ( 
               x    : in  unsigned(n*k-1 downto 0);
               clk  : in std_logic;
               init : in std_logic;
               rst  : in std_logic;
               sum  : out unsigned(n*k-1 downto 0);
               c    : out std_logic_vector(n-1 downto 0)
            );

end hrcs_accummulator_new;

architecture arch of hrcs_accummulator_new is

    component hrcs_accummulator
         generic( n : integer; k : integer);
         port ( 
             x    : in  unsigned(n*k-1 downto 0);
             clk  : in std_logic;
             init : in std_logic;
             rst  : in std_logic;
             sum  : out unsigned(n*k-1 downto 0);
             c    : out std_logic_vector(n-1 downto 0)
         );
    end component;
    
begin
 uu : hrcs_accummulator
        generic map ( n => 33 , k => 62)
        port map (x => x, clk => clk, init => init, rst => rst, sum => sum, c => c);
end arch;