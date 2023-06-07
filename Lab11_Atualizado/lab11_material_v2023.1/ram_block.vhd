library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_block is
  port (
    Clock : in std_logic;
    Address : in std_logic_vector(6 downto 0);
    Data : in std_logic_vector(7 downto 0);
    Q : out std_logic_vector(7 downto 0);
    WrEn : in std_logic
  );
end ram_block;

architecture direct of ram_block is
	
	SUBTYPE byte is std_logic_vector(7 downto 0);
	TYPE memoria is array(127 downto 0) of byte;
	
	signal ram : memoria;
	signal endereco : integer;
	
begin
  -- Your code here!
  endereco <= to_integer(unsigned(Address));
  
  process(Clock)
  begin
	if (Clock'event and Clock='1') then
		if (WrEn = '1') then
			ram(endereco) <= Data;
		end if;
	end if;
  end process;
	
  Q <= ram(endereco);
  
end direct;
