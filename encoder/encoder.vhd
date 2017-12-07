LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
-- Antonio Silva && Rafael Oliveira

ENTITY encoder IS
PORT (    	
				a	: IN	STD_LOGIC_VECTOR(15 downto 0);
				result 	: OUT	STD_LOGIC_VECTOR(23 downto 0));
END encoder ;

ARCHITECTURE arch OF encoder IS
-- 1st level XOR SIGNALS
SIGNAL xor1w2: STD_LOGIC;
SIGNAL xor7w14: STD_LOGIC;
SIGNAL xor0w6: STD_LOGIC;
SIGNAL xor13w15: STD_LOGIC;
SIGNAL xor9w13: STD_LOGIC;
SIGNAL xor5w12: STD_LOGIC;
SIGNAL xor4w11: STD_LOGIC;
SIGNAL xor15w8: STD_LOGIC;
SIGNAL xor3w10: STD_LOGIC;
SIGNAL xor0w7: STD_LOGIC;
SIGNAL xor12w14: STD_LOGIC;
SIGNAL xor6w11: STD_LOGIC;
SIGNAL xor5w10: STD_LOGIC;
SIGNAL xor4w9: STD_LOGIC;
SIGNAL xor3w8: STD_LOGIC;
-- 2nd level XOR SIGNALS
SIGNAL xor3w8w1: STD_LOGIC;
SIGNAL xor5w12w2: STD_LOGIC;
SIGNAL xor1w2w7w14: STD_LOGIC;
SIGNAL xor0w6w13w15: STD_LOGIC;
SIGNAL xor1w2w4w11: STD_LOGIC;
SIGNAL xor0w6w9w13: STD_LOGIC;
SIGNAL xor5w12w13w15: STD_LOGIC;
SIGNAL xor15w8w6w11: STD_LOGIC;
SIGNAL xor15w8w4w9: STD_LOGIC;
-- 3rd level XOR SIGNALS
SIGNAL xor0w6w13w15w7w14: STD_LOGIC;
SIGNAL xor1w2w7w14w3w10: STD_LOGIC;
SIGNAL xor1w2w4w11w12w14: STD_LOGIC;
SIGNAL xor1w2w7w14w5w10: STD_LOGIC;

COMPONENT xor2_1
PORT (    	
				a	: IN	STD_LOGIC;
				b	: IN	STD_LOGIC;
				output : OUT	STD_LOGIC	);
END COMPONENT;

BEGIN
-- 1st level XOR SIGNALS
blk1_2: 		xor2_1 PORT MAP (a(1), 	a(2),  xor1w2);  
blk7_14: 	xor2_1 PORT MAP (a(7), 	a(14), xor7w14); 
blk0_6: 		xor2_1 PORT MAP (a(0), 	a(6),  xor0w6);  
blk13_15:	xor2_1 PORT MAP (a(13), a(15), xor13w15); 
blk9_13: 	xor2_1 PORT MAP (a(9), 	a(13), xor9w13);  
blk5_12: 	xor2_1 PORT MAP (a(5), 	a(12), xor5w12);  
blk4_11: 	xor2_1 PORT MAP (a(4), 	a(11), xor4w11); 
blk15_8: 	xor2_1 PORT MAP (a(15), a(8),  xor15w8);  
blk3_10: 	xor2_1 PORT MAP (a(3), 	a(10), xor3w10);  
blk0_7:  	xor2_1 PORT MAP (a(0), 	a(7),  xor0w7);  	
blk12_14:  	xor2_1 PORT MAP (a(12), a(14), xor12w14); 
blk6_11:  	xor2_1 PORT MAP (a(6), 	a(11), xor6w11);  
blk5_10:  	xor2_1 PORT MAP (a(5), 	a(10), xor5w10);  
blk4_9:  	xor2_1 PORT MAP (a(4), 	a(9),  xor4w9);  	
blk3_8:  	xor2_1 PORT MAP (a(3), 	a(8),  xor3w8);  	
-- 2nd level XOR SIGNALS
blk3_8_1:  			xor2_1 PORT MAP (xor3w8, 	a(1),  xor3w8w1);  	
blk5_12_2:  		xor2_1 PORT MAP (xor5w12, 	a(2),  xor5w12w2);  	
blk1_2_7_14:  		xor2_1 PORT MAP (xor1w2, 	xor7w14,  xor1w2w7w14);  	
blk0_6_13_15:  	xor2_1 PORT MAP (xor0w6, 	xor13w15,  xor0w6w13w15);  
blk1_2_4_11:  		xor2_1 PORT MAP (xor1w2, 	xor4w11,  xor1w2w4w11);  	
blk0_6_9_13:  		xor2_1 PORT MAP (xor0w6, 	xor9w13,  xor0w6w9w13);  	
blk5_12_13_15:  	xor2_1 PORT MAP (xor5w12, 	xor13w15,  xor5w12w13w15);  	
blk15_8_6_11:  	xor2_1 PORT MAP (xor15w8, 	xor6w11,  xor15w8w6w11);  	
blk15_8_4_9:  		xor2_1 PORT MAP (xor15w8, 	xor4w9,  xor15w8w4w9);  	
-- 3rd level XOR SIGNALS
blk0_6_13_15_7_14: 	xor2_1 PORT MAP (xor0w6w13w15, 	xor7w14,  xor0w6w13w15w7w14);  	
blk1_2_7_14_3_10:  	xor2_1 PORT MAP (xor1w2w7w14, 	xor3w10,  xor1w2w7w14w3w10);  	
blk1_2_4_11_12_14:  	xor2_1 PORT MAP (xor1w2w4w11, 	xor12w14,  xor1w2w4w11w12w14);  	
blk1_2_7_14_5_10:  	xor2_1 PORT MAP (xor1w2w7w14, 	xor5w10,  xor1w2w7w14w5w10);  	

result(23 downto 8) <= a(15 downto 0);

result(7) <= xor0w6w13w15w7w14 xor xor5w12w2; 		
result(6) <= xor1w2w4w11  		 xor xor0w7;					
result(5) <= xor1w2w7w14w3w10  xor xor5w12w13w15; 	
result(4) <= xor0w6w9w13  		 xor xor1w2w4w11w12w14; 	
result(3) <= xor1w2w7w14w3w10  xor xor15w8w6w11; 	
result(2) <= xor0w6w9w13  		 xor xor1w2w7w14w5w10; 	
result(1) <= xor1w2w7w14  		 xor xor15w8w4w9;	
result(0) <= xor0w6w13w15w7w14 xor xor3w8w1;		

END arch ;