Library IEEE;
use IEEE.std_logic_1164.all;

Entity minimizado IS
PORT(
 a, b, c, d, e: IN STD_LOGIC;
 f : OUT STD_LOGIC
 );
 END minimizado;

ARCHITECTURE LogicFunction of minimizado IS
signal x1, x2, x3, x4, x5 : STD_LOGIC;
BEGIN
	f <= x1 or x2 or x3 or x4 or x5;
	x1 <= b and c and e;
	x2 <= not a and not b and not c and not e;
	x3 <= not b and not c and d and not e;
	x4 <= not a and c and not d and e;
	x5 <= b and not c and not d and not e;
END LogicFunction;