library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1 is
  port(d3, d2, d1, d0 : in std_logic;
       sel : in std_logic_vector(1 downto 0);
       output : out std_logic);
end mux4_to_1;

architecture rtl of mux4_to_1 is

	SIGNAL m : STD_LOGIC_VECTOR(0 TO 3) ;
	
begin

	dec: entity work.dec2_to_4 PORT MAP ('1', sel(1), sel(0), m(0), m(1), m(2), m(3));
	
	extra : entity work.extra_logic PORT MAP (d3, d2, d1, d0, m(0), m(1), m(2), m(3), output);
	
end rtl;

