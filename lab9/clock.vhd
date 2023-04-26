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
	signal sec_un_int    : integer range 0 to 9;
	signal sec_dec_int  	: integer range 0 to 9;
	signal min_un_int    : integer range 0 to 9;
	signal min_dec_int  	: integer range 0 to 9;
	signal hour_un_int   : integer range 0 to 9;
	signal hour_dec_int 	: integer range 0 to 9;
	
	
	signal unity_aux 		: unsigned(3 downto 0);
	signal decimal_aux 		: unsigned(3 downto 0);

	
	signal sec_un_aux 		: unsigned(3 downto 0);
	signal sec_dec_aux		: unsigned(3 downto 0);
	signal min_un_aux 		: unsigned(3 downto 0);
	signal min_dec_aux 		: unsigned(3 downto 0);
	signal hour_un_aux 		: unsigned(3 downto 0);
	signal hour_dec_aux 		: unsigned(3 downto 0);

	
	signal sec_un_bin    : std_logic_vector(3 downto 0);
	signal sec_dec_bin  	: std_logic_vector(3 downto 0);
	signal min_un_bin    : std_logic_vector(3 downto 0);
	signal min_dec_bin  	: std_logic_vector(3 downto 0);
	signal hour_un_bin   : std_logic_vector(3 downto 0);
	signal hour_dec_bin 	: std_logic_vector(3 downto 0);
  
begin	
  clock_divider : clk_div port map (clk, clk_hz);

		PROCESS(clk)
			
			BEGIN
				
				IF(clk'EVENT AND clk = '1') THEN
					
					IF(set_second = '1') THEN

						unity_aux <= unsigned(unity);

						decimal_aux <= unsigned(decimal);

						
                        IF (unity_aux < 10) AND (decimal_aux < 6) then	

                            sec_un_int <= to_integer(unity_aux);	

                            sec_dec_int <= to_integer(decimal_aux);

                        END IF;
					
					ELSIF(set_minute = '1') THEN

                        unity_aux <= unsigned(unity);

						decimal_aux <= unsigned(decimal);

						
                        IF (unity_aux < 10) AND (decimal_aux < 6) then	

                            min_un_int <= to_integer(unity_aux);	

                            min_dec_int <= to_integer(decimal_aux);

                        END IF;
					
					ELSIF(set_hour = '1') THEN

                        unity_aux <= unsigned(unity);

						decimal_aux <= unsigned(decimal);

						
                        IF (unity_aux < 10) AND (decimal_aux < 3) then	

                            hour_un_int <= to_integer(unity_aux);	

                            hour_dec_int <= to_integer(decimal_aux);

                        END if;

					
					ELSIF(clk_hz = '1') THEN

                        IF(sec_un_int = 9) THEN

                            sec_un_int <= 0;

                            IF(sec_dec_int = 5) THEN

                                sec_dec_int <= 0;

                                IF(min_un_int = 9) THEN

                                    min_un_int <= 0;

                                    IF(min_dec_int = 5) THEN

                                        min_dec_int <= 0;

                                        IF(hour_un_int = 9) THEN

                                            hour_un_int <= 0;

                                            hour_dec_int <= hour_dec_int + 1;

                                        ELSIF(hour_un_int = 3 AND hour_dec_int = 2) THEN

                                            hour_un_int <= 0;
                                            hour_dec_int <= 0;

                                        END if;

                                    ELSE
                                        
                                        min_dec_int <= min_dec_int + 1;

                                    
                                    END if;


                                ELSE

                                    min_un_int <= min_un_int + 1;

                                
                                END if;

                            ELSE

                                sec_dec_int <= sec_dec_int + 1;

                            END if;


                        ELSE

                            sec_un_int <= sec_un_int + 1;

                        END if;

                    END if;

                END if;

            END process;
				
        sec_un_aux <= to_unsigned(sec_un_int, 4);
        sec_un_bin <= std_logic_vector(sec_un_aux);
        
        sec_dec_aux <= to_unsigned(sec_dec_int, 4);
        sec_dec_bin <= std_logic_vector(sec_dec_aux);
        
        min_un_aux <= to_unsigned(min_un_int, 4);
        min_un_bin <= std_logic_vector(min_un_aux);
        
        min_dec_aux <= to_unsigned(min_dec_int, 4);
        min_dec_bin <= std_logic_vector(min_dec_aux);
        
        hour_un_aux <= to_unsigned(hour_un_int, 4);
        hour_un_bin <= std_logic_vector(hour_un_aux);
        
        hour_dec_aux <= to_unsigned(hour_dec_int, 4);
	    hour_dec_bin <= std_logic_vector(hour_dec_aux);


        bin1: bin2dec port map (sec_un_bin, sec_un);
        bin2: bin2dec port map (sec_dec_bin, sec_dec);
        bin3: bin2dec port map (min_un_bin, min_un);
        bin4: bin2dec port map (min_dec_bin, min_dec);
        bin5: bin2dec port map (hour_un_bin, hour_un);
        bin6: bin2dec port map (hour_dec_bin, hour_dec);
		
end rtl;