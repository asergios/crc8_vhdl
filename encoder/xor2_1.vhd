LIBRARY ieee ;
USE ieee.std_logic_1164.all ;


ENTITY xor2_1 IS
PORT (    	
				a	: IN	STD_LOGIC;
				b	: IN	STD_LOGIC;
				output : OUT	STD_LOGIC);
END xor2_1 ;

ARCHITECTURE arch OF xor2_1 IS

BEGIN

output <= a xor b;

END arch ;