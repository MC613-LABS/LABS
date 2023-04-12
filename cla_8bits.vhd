-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_8bits is
  port(
    x    : in  std_logic_vector(7 downto 0);
    y    : in  std_logic_vector(7 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end cla_8bits;

architecture rtl of cla_8bits is
signal g, p, c: std_logic_vector(7 downto 0);
begin
  -- add your code!
  g(0) <= x(0) and y(0); p(0) <= x(0) or y(0);
  g(1) <= x(1) and y(1); p(1) <= x(1) or y(1);
  g(2) <= x(2) and y(2); p(2) <= x(2) or y(2);
  g(3) <= x(3) and y(3); p(3) <= x(3) or y(3);
  g(4) <= x(4) and y(4); p(4) <= x(4) or y(4);
  g(5) <= x(5) and y(5); p(5) <= x(5) or y(5);
  g(6) <= x(6) and y(6); p(6) <= x(6) or y(6);
  g(7) <= x(7) and y(7); p(7) <= x(7) or y(7);
  
  c(1) <= g(0) or (p(0) and cin);
  c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
  c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
  c(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);
  c(5) <= g(4) or (p(4) and g(3)) or (p(4) and p(3) and g(2)) or (p(4) and p(3) and p(2) and g(1)) or (p(4) and p(3) and p(2) and p(1) and g(0)) or
  (p(4) and p(3) and p(2) and p(1) and cin);
  c(6) <= g(5) or (p(5) and g(4)) or (p(5) and p(4) and g(3)) or (p(5) and p(4) and p(3) and g(2)) or (p(5) and p(4) and p(3) and p(2) and g(1)) or 
  (p(5) and p(4) and p(3) and p(2) and p(1) and g(0)) or (p(5) and p(4) and p(3) and p(2) and p(1) and cin);
  c(7) <= g(6) or (p(6) and g(5)) or (p(6) and p(5) and g(4)) or (p(6) and p(5) and p(4) and g(3)) or (p(6) and p(5) and p(4) and p(3) and g(2)) or 
  (p(6) and p(5) and p(4) and p(3) and p(2) and g(1)) or (p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and g(0)) or 
  (p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and cin);
  cout <= g(7) or (p(7) and g(6)) or (p(7) and p(6) and g(5)) or (p(7) and p(6) and p(5) and g(4)) or (p(7) and p(6) and p(5) and p(4) and g(3)) 
  or (p(7) and p(6) and p(5) and p(4) and p(3) and g(2)) or (p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and g(1)) 
  or (p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and g(0)) or (p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and cin);
  
  sum(0) <= x(0) xor y(0) xor cin;
  sum(1) <= x(1) xor y(1) xor c(1);
  sum(2) <= x(2) xor y(2) xor c(2);
  sum(3) <= x(3) xor y(3) xor c(3);
  sum(4) <= x(4) xor y(4) xor c(4);
  sum(5) <= x(5) xor y(5) xor c(5);
  sum(6) <= x(6) xor y(6) xor c(6);
  sum(7) <= x(7) xor y(7) xor c(7);
end rtl;

