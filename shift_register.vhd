library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
generic (N : integer := 6);
port(
    clk     : in  std_logic;
    mode    : in  std_logic_vector(1 downto 0);
    ser_in  : in  std_logic;
    par_in  : in  std_logic_vector((N - 1) downto 0);
    par_out : out std_logic_vector((N - 1) downto 0)
  );
end shift_register;

architecture rtl of shift_register is
  -- Your code here!
  signal temp : std_logic_vector((N - 1) downto 0);
begin
  -- Your code here!
  process(clk)
  begin
    if clk'EVENT and clk = '1' then
      if mode = "01" then
        temp((N - 2) downto 0) <= temp((N - 1) downto 1);
        temp(N - 1) <= ser_in; 
      elsif mode = "10" 
        temp((N - 1) downto 1) <= temp((N - 2) downto 0);
        temp(0) <= ser_in; 
      elsif mode = "11"
        temp <= par_in;
      end if;
    end if;
  end process;
  par_out <= temp;
end rtl;
