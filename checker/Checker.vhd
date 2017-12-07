library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Checker is
	port(clk    : in  std_logic;
		  dataIn : in  std_logic;
		  ready  : out std_logic);
end Checker;	
	
architecture Structural of Checker is
	signal crc: unsigned(7 downto 0) := (others => '0');
	signal s_count: natural range 0 to 25;
	signal s_ready: std_logic := '0';
	
begin
	
	f1:	--1 x^0
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => (dataIn xor crc(7)),
								 q   => crc(0));
	f2:	--0 x^1
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => crc(0),
								 q   => crc(1)); 
	f3:	--1 x^2
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => (crc(1) xor crc(7)),
								 q   => crc(2));	
	
	f4:	--0 x^3
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => crc(2),
								 q   => crc(3));	
	f5:	--1 x^4
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => (crc(3) xor crc(7)),
								 q   => crc(4));	
	f6:	--0 x^5
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => crc(4),
								 q   => crc(5));	
	f7:	--1 x^6
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => (crc(5) xor crc(7)),
								 q   => crc(6));	
	f8:	--1 x^7
			entity work.FlipFlopD(Behavioral)
					 port map(clk => clk,
								 d   => (crc(6) xor crc(7)),
								 q   => crc(7));	
	checkIfEnd:
			entity work.Ready(Behavioral)
					 port map(clk    => clk,
								 dataIn => std_logic_vector(crc),
								 ready  => s_ready);
	
	ready <= s_ready;
end Structural;
