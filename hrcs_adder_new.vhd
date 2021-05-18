library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hrcs_adder_new is
            generic( 
               n : integer := 33;
               k : integer :=62
            );
            port ( 
               x : in  unsigned(n*k-1 downto 0);
               y : in  unsigned(n*k-1 downto 0);
               cin : in unsigned(n-1 downto 0) := (others => '0');
               s : out unsigned(n*k-1 downto 0);
               c : out std_logic_vector(n-1 downto 0)
            );

end hrcs_adder_new;

architecture arch of hrcs_adder_new is

    component hrcs_adder
         generic( n : integer; k : integer);
         port ( 
            x : in  unsigned(n*k-1 downto 0);
            y : in  unsigned(n*k-1 downto 0);
            cin : in unsigned(n-1 downto 0) := (others => '0');
            s : out unsigned(n*k-1 downto 0);
            c : out std_logic_vector(n-1 downto 0)
         );
    end component;
    
begin
 uu : hrcs_adder
        generic map ( n => 33 , k => 62)
        port map (x => x, y => y, cin => cin, s => s, c => c);
end arch;