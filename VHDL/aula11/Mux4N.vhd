library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux4N is
	generic ( k : integer := 32);
	port( x1 : in std_logic_vector(k-1 downto 0);
			x2 : in std_logic_vector(k-1 downto 0);
			x3 : in std_logic_vector(k-1 downto 0);
			x4 : in std_logic_vector(k-1 downto 0);
			s : in std_logic_vector(1 downto 0);
			y : out std_logic_vector(k-1 downto 0));
end Mux4N;

architecture Behavioral of Mux4N is
	signal s_out : std_logic_vector(k-1 downto 0);
	begin
	Process(x1,x2,x3,x4,s)
		begin
			if(s = "00") then
				s_out <= x1;
			elsif(s = "01") then
				s_out <= x2;
			elsif(s = "10") then
				s_out <= x3;
			else
				s_out <= x4;
			end if;
	end process;
	y <= s_out;
end Behavioral;
	