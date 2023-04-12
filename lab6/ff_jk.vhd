library ieee;
use ieee.std_logic_1164.all;

entity ff_jk is
  port (
    Clk : in std_logic;
    J : in std_logic;
    K : in std_logic;
    Q : out std_logic;
    Q_n : out std_logic;
    Preset : in std_logic;
    Clear : in std_logic
  );
end ff_jk;

architecture rtl of ff_jk is
	
begin

  PROCESS ( Clk )
		variable Q_temp : std_logic;
	BEGIN
						
		IF Clk'EVENT AND Clk = '1' THEN

			IF Preset = '1' AND Clear = '0' THEN
				
				Q_temp := '1';
				
			ELSIF Preset = '1' AND Clear = '1' THEN
			
				Q_temp := '0';
				
			ELSIF Clear = '1' THEN
				
				Q_temp := '0';
				
			ELSE 
				
				Q_temp := (J AND NOT(Q_temp)) OR (NOT(K) AND Q_temp);
			
			END IF;

		END IF ;
		Q <= Q_temp;
		Q_n <= not Q_temp;

	END PROCESS ;
end rtl;
