library ieee;
use ieee.std_logic_1164.all;

entity dec2_to_4 is
  port(en, w1, w0: in std_logic;
       y3, y2, y1, y0: out std_logic);
end dec2_to_4;

architecture rtl of dec2_to_4 is
begin
  y0 <= '1' when en = '1' and w0 = '0' and w1 = '0' else '0';
  y1 <= '1' when en = '1' and w0 = '1' and w1 = '0' else '0';
  y2 <= '1' when en = '1' and w0 = '0' and w1 = '1' else '0';
  y3 <= '1' when en = '1' and w0 = '1' and w1 = '1' else '0';
  
end rtl;

