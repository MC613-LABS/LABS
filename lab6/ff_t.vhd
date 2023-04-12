library ieee;
use ieee.std_logic_1164.all;

entity ff_t is
  port (
    Clk : in std_logic;
    T : in std_logic;
    Q : out std_logic;
    Q_n : out std_logic;
    Preset : in std_logic;
    Clear : in std_logic
  );
end ff_t;

architecture rtl of ff_t is

	
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
				
			ELSIF T = '1' THEN 
				
				Q_temp := not Q_temp;
			
			END IF;

		END IF ;
		Q <= Q_temp;
		Q_n <= not Q_temp;

	END PROCESS ;
end rtl;
