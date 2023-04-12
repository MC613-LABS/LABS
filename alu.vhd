library ieee;
use ieee.std_logic_1164.all;

entity alu is
  port (
    a, b : in std_logic_vector(3 downto 0);
    F : out std_logic_vector(3 downto 0);
    s0, s1 : in std_logic;
    Z, C, V, N : out std_logic
  );
end alu;

architecture behavioral of alu is
signal tempa, tempb, tempf : std_logic_vector(3 downto 0);
signal tempc, tempv, tempcomplement : std_logic;
begin
	process(a, b, s0, s1)
	begin
		tempa <= a;
		tempb <= b;
		tempcomplement <= '0';
		
		if s0 = '1' and s1 = '0' then
			tempb <= not b;
			tempcomplement <= '1';
		end if;
		
		if s0 = '0' and s1 = '1' then
			tempa <= a and b;
			tempb <= "0000";
			
		elsif s0 = '1' and s1 = '1' then
			tempa <= a or b;
			tempb <= "0000";
		end if;
		
	end process;
	
	rp: entity work.ripple_carry port map(tempa, tempb, tempf, tempcomplement, tempc, tempv);
	
	F <= tempf;
	C <= tempc;
	V <= tempv;
	N <= tempf(3) when s1 = '0' else '0';
	Z <= (not tempf(0)) and (not tempf(1)) and (not tempf(2)) and (not tempf(3));
end behavioral;
