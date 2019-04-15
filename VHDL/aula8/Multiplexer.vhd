library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Multiplexer is
	port( in1	: in std_logic_vector(31 downto 0);
			in2	: in std_logic_vector(31 downto 0);
			sel 	: in std_logic;
			out1 	: out std_logic_vector(31 downto 0));
end Multiplexer;

architecture Behavioral of Multiplexer is
	begin
			out1 <= in2 when (sel='1') else in1;
end Behavioral;