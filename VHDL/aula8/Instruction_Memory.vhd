library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Instruction_Memory is 
	generic(ADDR_BUS_SIZE : positive := 4);
	port(address : in std_logic_vector(ADDR_BUS_SIZE-1 downto 0);
			readData : out std_logic_vector(31 downto 0));
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
	constant NUM_WORDS : positive := (2 ** ADDR_BUS_SIZE);
	subtype TData is std_logic_vector(31 downto 0);
	type TMemory is Array(0 to NUM_WORDS -1) of TData;
	constant s_memory : TMemory :=
								(	 X"2002001A",
									 X"20030052",
									 X"00432020",
									 X"00432822",
									 X"00433024",
									 X"00433825",
									 X"00434826",
									 X"00430827",
									 X"0043502A",
									 X"284B0020",
									 X"298CFFA6",
									 others => X"00000000");	
	begin
		readData <= s_memory(to_integer(unsigned(address)));
end Behavioral;