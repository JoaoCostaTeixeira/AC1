library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegFile is
	port(clk	: in std_logic;
			writeEnable : in std_logic;
			writeReg	: in std_logic_vector(4 downto 0);
			writeData	:	in std_logic_vector(31 downto 0);
			readReg1		:	in std_logic_vector(4 downto 0);
			readReg2		: 	in std_logic_vector(4 downto 0);
			readData1	:	out std_logic_vector(31 downto 0);
			readData2 	:	out std_logic_vector(31 downto 0));
end RegFile;


architecture Behavioral of RegFile is
	subtype TDataWord	is std_logic_vector(31 downto 0);
	type TMemory is array (0 to 31) of TDataWord;
	signal s_memory : TMemory;
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(writeEnable = '1') then
				s_memory(to_integer(unsigned(writeReg))) <= writeData;
			end if;
		end if;
	end process;
	
	readData1 <= (others => '0') when (readReg1 = "00000") else
					s_memory(to_integer(unsigned(readReg1)));
					
	readData2 <= (others => '0') when (readReg2 = "00000") else
					s_memory(to_integer(unsigned(readReg2)));

end Behavioral;