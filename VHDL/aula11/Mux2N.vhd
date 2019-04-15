library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux2N is
	generic ( k : integer := 32);
	port( x1 : in std_logic_vector(k-1 downto 0);
			x2 : in std_logic_vector(k-1 downto 0);
			s : in std_logic;
			y : out std_logic_vector(k-1 downto 0));
end Mux2N;

architecture Behavioral of Mux2N is
	signal s_out : std_logic_vector(k-1 downto 0);
	begin
	Process(x1,x2,s)
		begin
			if(s = '0') then
				s_out <= x1;
			else
				s_out <= x2;
			end if;
	end process;
	y <= s_out;
end Behavioral;
	