library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg32 is
	port( enable : in std_logic;
			in1 : in std_logic_vector(31 downto 0);
			clk : in std_logic;
			out1 : out std_logic_vector(31 downto 0));
end Reg32;

architecture Behavioral of Reg32 is
	signal s_memory : std_logic_vector(31 downto 0);
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			s_memory <= in1;
		end if;
	end process;
	out1 <= s_memory;
end Behavioral;