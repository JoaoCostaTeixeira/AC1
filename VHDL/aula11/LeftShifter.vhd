library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LeftShifter is
	port( x : in std_logic_vector(31 downto 0);
			y : out std_logic_vector(31 downto 0));
end LeftShifter;

architecture Behavioral of LeftShifter is
	signal s_out : std_logic_vector (31 downto 0);
	begin 
		s_out <= x(29 downto 0) & (others => '0');
		y<=s_out;
end Behavioral;