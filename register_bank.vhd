library ieee;
use ieee.std_logic_1164.all;

entity register_bank is
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(3 downto 0);
    data_out : out std_logic_vector(3 downto 0);
    reg_rd : in std_logic_vector(2 downto 0);
    reg_wr : in std_logic_vector(2 downto 0);
    we : in std_logic;
    clear : in std_logic
  );
end register_bank;

architecture structural of register_bank is
	component zbuffer
		generic (
			N : integer := 4
		);
		port (
			x : in std_logic_vector(N-1 downto 0);
			e : in std_logic;
			f : out std_logic_vector(N-1 downto 0)
		);
	end component;
	component reg
		generic (
			N : integer := 4
		);
		port (
			clk : in std_logic;
			data_in : in std_logic_vector(N-1 downto 0);
			data_out : out std_logic_vector(N-1 downto 0);
			load : in std_logic; -- Write enable
			clear : in std_logic
		);
	end component;
	component dec3_to_8
		port (
			w : in std_logic_vector(2 downto 0);
			y : out std_logic_vector(7 downto 0)
		);
	end component;
	signal d2r, r2d: std_logic_vector(7 downto 0);
	signal rg0, rg1, rg2, rg3, rg4, rg5, rg6, rg7 : std_logic_vector(3 downto 0)
begin
	
	dec1 : dec3_to_8 port map(reg_wr, d2r);
	dec2 : dec3_to_8 port map(reg_rd, r2d);
	
	reg0 : reg port map(clk, data_in, rg0, d2r(0), clear);
	reg1 : reg port map(clk, data_in, rg1, d2r(1), clear);
	reg2 : reg port map(clk, data_in, rg2, d2r(2), clear);
	reg3 : reg port map(clk, data_in, rg3, d2r(3), clear);
	reg4 : reg port map(clk, data_in, rg4, d2r(4), clear);
	reg5 : reg port map(clk, data_in, rg5, d2r(5), clear);
	reg6 : reg port map(clk, data_in, rg6, d2r(6), clear);
	reg7 : reg port map(clk, data_in, rg7, d2r(7), clear);
	
	bf0: zbuffer port map(rg0, r2d(0), data_out);
	bf1: zbuffer port map(rg1, r2d(1), data_out);
	bf2: zbuffer port map(rg2, r2d(2), data_out);
	bf3: zbuffer port map(rg3, r2d(3), data_out);
	bf4: zbuffer port map(rg4, r2d(4), data_out);
	bf5: zbuffer port map(rg5, r2d(5), data_out);
	bf6: zbuffer port map(rg6, r2d(6), data_out);
	bf7: zbuffer port map(rg7, r2d(7), data_out);
	
end structural;
