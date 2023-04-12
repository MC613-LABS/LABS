-- brief : lab05 - question 1

library ieee;
use ieee.std_logic_1164.all;

entity barrel_shifter is
  port(
    w : in  std_logic_vector (3 downto 0);
    s : in  std_logic_vector (1 downto 0);
    y : out std_logic_vector (3 downto 0)
  );
end barrel_shifter;

architecture rtl of barrel_shifter is
  -- add your code!
  begin
  process(s, w)
  begin
	if s = "00" then
	y <= w;
	elsif s = "01" then
	y(0) <= w(1);
	y(1) <= w(2);
	y(2) <= w(3);
	y(3) <= w(0);
	
	elsif s = "10" then
	y(0) <= w(2);
	y(1) <= w(3);
	y(2) <= w(0);
	y(3) <= w(1);
	
	elsif s = "11" then
	y(0) <= w(3);
	y(1) <= w(0);
	y(2) <= w(1);
	y(3) <= w(2);
	end if;
	end process;
end rtl;

