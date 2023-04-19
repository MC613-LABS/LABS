library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
  port (
    clk : in std_logic;
    clk_hz : out std_logic
  );
end clk_div;

architecture behavioral of clk_div is

	SIGNAL Count : integer range 0 to 50000000;
	SIGNAL Saida: std_logic := '0';

	BEGIN

	PROCESS ( clk )

		BEGIN

			IF (clk'EVENT AND clk = '1') THEN

				Count <= Count + 1;
				
				IF (Count = 49999999) THEN
					Count <= 0;
					Saida <= not Saida;
				END IF;

			END IF ;

		END PROCESS ;

	clk_hz <= Saida;
	
end behavioral;
