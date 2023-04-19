library ieee;
use ieee.std_logic_1164.all;

entity clock is
  port (
    clk : in std_logic;
    decimal : in std_logic_vector(3 downto 0);
    unity : in std_logic_vector(3 downto 0);
    set_hour : in std_logic;
    set_minute : in std_logic;
    set_second : in std_logic;
    hour_dec, hour_un : out std_logic_vector(6 downto 0);
    min_dec, min_un : out std_logic_vector(6 downto 0);
    sec_dec, sec_un : out std_logic_vector(6 downto 0)
  );
end clock;

architecture rtl of clock is
  component clk_div is
    port (
      clk : in std_logic;
      clk_hz : out std_logic
    );
  end component;
  
  signal clk_hz : std_logic;
  
  variable sec_dec_temp : std_logic;
  variable sec_un_temp: std_logic;
  
  variable min_dec_temp : std_logic;
  variable min_un_temp : std_logic;
  
  variable hour_dec_temp : std_logic;
  variable hour_un_temp: std_logic;
  
  variable valid_input : std_logic;
  
begin	
  clock_divider : clk_div port map (clk, clk_hz);

		PROCESS(clk_hz)
		
			valid_input = '0';
		
			BEGIN
				
				IF(clk_hz'EVENT AND clk_hz = '1') THEN
				
				
				
					IF(set_hour or set_minute or set_second) THEN					
							
																				
						ELSE THEN
						
						END IF;
					
					
					
					
					ELSE THEN
					
						
					
					
					
					END IF;
				
				
				END IF;
				
				
			END PROCESS; 
			
		sec_dec <= sec_dec_temp;
		sec_un <= sec_un_temp;
		
		min_dec <= min_dec_temp;
		min_un <= min_un_temp;
		
		hour_dec <= hour_dec_temp;
		hour_un <= hour_un_temp;
		
end rtl;