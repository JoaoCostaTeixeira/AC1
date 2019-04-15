library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
	generic(ADDR_BUS_SIZE : positive := 4);
	port(writeEnable : in std_logic;
			readEnable : in std_logic;
			clk : in std_logic;
			Address : in std_logic_vector(31 downto 0);
			writeData : in std_logic_vector(31 downto 0);
			readData : out std_logic_vector(31 downto 0));
			
end RAM;

architecture Behavioral of RAM is
	constant NUM_WORDS : positive := (2 ** ADDR_BUS_SIZE );
	subtype TData is std_logic_vector(31 downto 0);
	type TMemory is array(0 to NUM_WORDS - 1) of TData;
signal s_memory : TMemory := ( X"8C010000", -- lw $1,0x0000($0)
										 X"20210004", -- addi $1,$1,4
										 X"AC010004", -- sw $1,4($0)
										 others => X"00000000");
begin
	process(clk)
	begin
		if(rising_edge(clk)) then 
			if(writeEnable = '1') then
				s_memory(to_integer(unsigned(address)))<= writeData;
			end if;
		end if;
		if(readEnable = '1') then
			readData <= s_memory(to_integer(unsigned(address)));
		end if;
	end process;
end Behavioral; 
