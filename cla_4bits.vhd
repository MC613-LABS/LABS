-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_4bits is
  port(
    x    : in  std_logic_vector(3 downto 0);
    y    : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(3 downto 0);
    cout : out std_logic
  );
end cla_4bits;



architecture rtl of cla_4bits is
signal g, p, c: std_logic_vector(3 downto 0);

begin
  -- add your code!
  g(0) <= x(0) and y(0); p(0) <= x(0) or y(0);
  g(1) <= x(1) and y(1); p(1) <= x(1) or y(1);
  g(2) <= x(2) and y(2); p(2) <= x(2) or y(2);
  g(3) <= x(3) and y(3); p(3) <= x(3) or y(3);
  
  c(1) <= g(0) or (p(0) and cin);
  c(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
  c(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
  cout <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and cin);
  
  sum(0) <= x(0) xor y(0) xor cin;
  sum(1) <= x(1) xor y(1) xor c(1);
  sum(2) <= x(2) xor y(2) xor c(2);
  sum(3) <= x(3) xor y(3) xor c(3);
end rtl;

