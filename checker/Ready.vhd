library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Ready is
	port(	clk	  : in  std_logic;
			dataIn  : in  std_logic_vector(7 downto 0);
			ready   : out std_logic := '0');

end Ready;

architecture Behavioral of Ready is
	signal s_count: natural range 0 to 25;
begin
	process (clk)
	begin
		if(rising_edge(clk)) then
			s_count <= s_count + 1;
			if(s_count = 24 and dataIn = "00000000") then
				ready <= '1';
			end if;
		end if;
	end process;
end Behavioral;