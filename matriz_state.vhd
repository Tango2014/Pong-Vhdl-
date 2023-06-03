LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
----------------------------------------
ENTITY matriz_state IS
	PORT(		rst  : IN STD_LOGIC;
				rst1   : IN STD_LOGIC;
	         clk : IN STD_LOGIC;
				COL_O	   : OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				ROW_O	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				COLB_O	   : OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				ROWB_O	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				RAM         : IN STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENTITY matriz_state;
-------------------------------------------------------
 ARCHITECTURE funtional OF matriz_state IS
TYPE state is (state0,state1,state2,state3,state4,state5,state6,state7,state8,state9,state10,state11,state12,state13,state14,state15,
 state16,state17,state18,state19,state20,state21,state22,state23,state24,
 state25,state26,state27,state28,state29,state30,state31,state32,state33,state34,state35,state36,state37,state38,state39,state40,state41,state42,state43,state44,
state45,state46,state47,state48,state49,state50,state51,state52,state53,state54,state55,state56,state57,state58,state59,state60,state61,state62,state63,state64,state65,state66,
state67,state68,state69,state70,state71,state72,state73,state74,state75,state76,state77,state78,state79,state80,state81,state82,state83,state84,state85,state86,state87,state88,
state89,state90,state91,state92,state93,state94,state95,
state96,state97,state98,state99,state100,state101,state102,state103,state104,state105,state106,state107,state108,state109,state110,state111,state112,
state113,state114,state115,state116,state117,state118,state119,state120,state121,state122,state123,state124,state125,state126,state127);
SIGNAL  pr_state,nx_state :state;
SIGNAL Logic, Unlogic,LogicB,UnlogicB : STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS=>'0');
SIGNAL go	:	STD_LOGIC;
SIGNAL RAM_S : STD_LOGIC_VECTOR(127 DOWNTO 0);
BEGIN

PROCESS(rst,clk)
BEGIN
	IF(rst='1' OR rst1='1') THEN
		pr_state	<=	state0;
	ELSIF(rising_edge(clk)) THEN
		pr_state	<=	nx_state;
	END IF;
END PROCESS;


PROCESS (pr_state, RAM, go)
BEGIN
	CASE pr_state IS
		WHEN state0 => 
			IF(RAM(0)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state1;
			ELSIF (RAM(0)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state1;
			ELSIF (RAM(0)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state0;
			ELSIF(RAM(0)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state0;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state1;
			END IF;	
		WHEN state1 => 
			IF(RAM(1)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state2;
			ELSIF (RAM(1)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state2;	
			ELSIF (RAM(1)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state1;		
			ELSIF(RAM(1)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state1;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state2;
			END IF;	
			
		WHEN state2 => 
			IF(RAM(2)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state3;
			ELSIF (RAM(2)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state3;	
			ELSIF (RAM(2)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state2;	
			ELSIF(RAM(2)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state2;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state3;
			END IF;
		
		WHEN state3 => 
			IF(RAM(3)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state4;
			ELSIF (RAM(3)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state4;	
			ELSIF (RAM(3)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state3;		
			ELSIF(RAM(3)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state3;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state4;
			END IF;
			
		WHEN state4 => 
			IF(RAM(4)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state5;
			ELSIF (RAM(4)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state5;	
			ELSIF (RAM(4)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state4;	
			ELSIF(RAM(4)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state4;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state5;
			END IF;
			
		WHEN state5 => 
			IF(RAM(5)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state6;
			ELSIF (RAM(5)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state6;	
			ELSIF (RAM(5)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state5;	
			ELSIF(RAM(5)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state5;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state6;
			END IF;
			
		WHEN state6 => 
			IF(RAM(6)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state7;
			ELSIF (RAM(6)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state7;		
			ELSIF (RAM(6)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state6;	
			ELSIF(RAM(6)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state6;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state7;
			END IF;
			
		WHEN state7 => 
			IF(RAM(7)='1' AND go='1') THEN
				Logic		<="00000001";
				Unlogic	<="11111110"; 
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state8;
			ELSIF (RAM(7)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state8;
			ELSIF (RAM(7)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state7;
			ELSIF(RAM(7)='1' AND go='0') THEN
				Logic		<="00000001";
				Unlogic	<="11111110"; 
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state7;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state8;
			END IF;
		
		WHEN state8 => 
			IF(RAM(8)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state9;
			ELSIF (RAM(8)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state9;
			ELSIF (RAM(8)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111"; 
				LogicB	<="00000000";
				UnlogicB<="11111111";
				nx_state <= state8;
			ELSIF(RAM(8)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state8;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state9;
			END IF;	
		
		WHEN state9 => 
			IF(RAM(9)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state10;
			ELSIF (RAM(9)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state10;	
			ELSIF (RAM(9)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state9;	
			ELSIF(RAM(9)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state9;		
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state10;
			END IF;	
			
		WHEN state10 => 
			IF(RAM(10)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state11;
			ELSIF (RAM(10)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state11;	
			ELSIF (RAM(10)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state10;	
			ELSIF(RAM(10)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state10;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state11;
			END IF;
			
		WHEN state11 => 
			IF(RAM(11)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state12;
			ELSIF (RAM(11)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state12;	
			ELSIF (RAM(11)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state11;		
			ELSIF(RAM(11)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state11;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state12;
			END IF;
			
		WHEN state12 => 
			IF(RAM(12)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state13;
			ELSIF (RAM(12)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state13;	
			ELSIF (RAM(12)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state12;	
			ELSIF(RAM(12)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state12;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state13;
			END IF;
			
		WHEN state13 => 
			IF(RAM(13)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state14;
			ELSIF (RAM(13)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state14;		
			ELSIF (RAM(13)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state13;	
			ELSIF(RAM(13)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state13;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state14;
			END IF;
			
		WHEN state14 => 
			IF(RAM(14)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state15;
			ELSIF (RAM(14)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state15;		
			ELSIF (RAM(14)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state14;	
			ELSIF(RAM(14)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state14;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state15;
			END IF;
			
		WHEN state15 => 
			IF(RAM(15)='1' AND go='1') THEN
				Logic		<="00000010";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state16;
			ELSIF (RAM(15)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state16;		
			ELSIF (RAM(15)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state15;	
			ELSIF(RAM(15)='1' AND go='0') THEN
				Logic		<="00000010";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state15;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state16;
			END IF;
			
		WHEN state16 => 
			IF(RAM(16)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state17;
			ELSIF (RAM(16)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state17;
			ELSIF (RAM(16)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state16;
			ELSIF(RAM(16)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state16;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state17;
			END IF;	
		
		WHEN state17 => 
			IF(RAM(17)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state18;
			ELSIF (RAM(17)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state18;		
			ELSIF (RAM(17)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state17;		
			ELSIF(RAM(17)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state17;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state18;
			END IF;	
			
		WHEN state18 => 
			IF(RAM(18)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state19;
			ELSIF (RAM(18)='0' AND go='1') THEN
				Logic		<="00000000";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Unlogic	<="11111111";
				nx_state <= state19;	
			ELSIF (RAM(18)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state18;		
			ELSIF(RAM(18)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state18;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state19;
			END IF;
		
		WHEN state19 => 
			IF(RAM(19)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state20;
			ELSIF (RAM(19)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state20;		
			ELSIF (RAM(19)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state19;	
			ELSIF(RAM(19)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state19;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state20;
			END IF;
			
		WHEN state20 => 
			IF(RAM(20)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state21;
			ELSIF (RAM(20)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state21;	
			ELSIF (RAM(20)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state20;		
			ELSIF(RAM(20)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state20;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state21;
			END IF;
			
		WHEN state21 => 
			IF(RAM(21)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state22;
			ELSIF (RAM(21)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state22;		
			ELSIF (RAM(21)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state21;	
			ELSIF(RAM(21)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state21;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state22;
			END IF;
			
		WHEN state22 => 
			IF(RAM(22)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state23;
			ELSIF (RAM(22)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state23;	
			ELSIF (RAM(22)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state22;		
			ELSIF(RAM(22)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state22;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state23;
			END IF;
			
		WHEN state23 => 
			IF(RAM(23)='1' AND go='1') THEN
				Logic		<="00000100";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state24;
			ELSIF (RAM(23)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state24;		
			ELSIF (RAM(23)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state23;
			ELSIF(RAM(23)='1' AND go='0') THEN
				Logic		<="00000100";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state23;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state24;
			END IF;
		
		WHEN state24 => 
			IF(RAM(24)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state25;
			ELSIF (RAM(24)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state25;
			ELSIF (RAM(24)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state24;
			ELSIF(RAM(24)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state24;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state25;
			END IF;	
		
		WHEN state25 => 
			IF(RAM(25)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state26;
			ELSIF (RAM(25)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state26;		
			ELSIF (RAM(25)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state25;	
			ELSIF(RAM(25)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state25;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state26;
			END IF;	
			
		WHEN state26 => 
			IF(RAM(26)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state27;
			ELSIF (RAM(26)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state27;		
			ELSIF (RAM(26)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state26;	
			ELSIF(RAM(26)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state26;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state27;
			END IF;
			
		WHEN state27 => 
			IF(RAM(27)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state28;
			ELSIF (RAM(27)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state28;	
			ELSIF (RAM(27)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state27;	
		   ELSIF(RAM(27)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state27;		
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state28;
			END IF;
			
		WHEN state28 => 
			IF(RAM(28)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state29;
			ELSIF (RAM(28)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state29;		
			ELSIF (RAM(28)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state28;	
			ELSIF(RAM(28)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state28;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state29;
			END IF;
			
		WHEN state29 => 
			IF(RAM(29)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state30;
			ELSIF (RAM(29)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state30;	
			ELSIF (RAM(29)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state29;
			ELSIF(RAM(29)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state29;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state30;
			END IF;
			
		WHEN state30 => 
			IF(RAM(30)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state31;
			ELSIF (RAM(30)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state31;		
			ELSIF (RAM(30)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state30;	
			ELSIF(RAM(30)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state30;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state31;
			END IF;
			
		WHEN state31 => 
			IF(RAM(31)='1' AND go='1') THEN
				Logic		<="00001000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state32;
			ELSIF (RAM(31)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state32;	
			ELSIF (RAM(31)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state31;	
			ELSIF(RAM(31)='1' AND go='0') THEN
				Logic		<="00001000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state31;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state32;
			END IF;
			
		WHEN state32 => 
			IF(RAM(32)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state33;
			ELSIF (RAM(32)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state33;
			ELSIF (RAM(32)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state32;
			ELSIF(RAM(32)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state32;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state33;
			END IF;	
		
		WHEN state33 => 
			IF(RAM(33)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state34;
			ELSIF (RAM(33)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state34;		
			ELSIF (RAM(33)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state33;
			ELSIF(RAM(33)='1' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state33;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state34;
			END IF;	
			
		WHEN state34 => 
			IF(RAM(34)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state35;
			ELSIF (RAM(34)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state35;
			ELSIF (RAM(34)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state34;		
			ELSIF(RAM(34)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state34;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state35;
			END IF;
			
		WHEN state35 => 
			IF(RAM(35)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state36;
			ELSIF (RAM(35)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state36;	
			ELSIF (RAM(35)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state35;	
			ELSIF(RAM(35)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state35;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state36;
			END IF;
			
		WHEN state36 => 
			IF(RAM(36)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state37;
			ELSIF (RAM(36)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state37;		
			ELSIF (RAM(36)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state36;	
			ELSIF(RAM(36)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state36;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state37;
			END IF;
			
		WHEN state37 => 
			IF(RAM(37)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state38;
			ELSIF (RAM(37)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state38;		
			ELSIF (RAM(37)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state37;		
			ELSIF(RAM(37)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state37;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state38;
			END IF;
			
		WHEN state38 => 
			IF(RAM(38)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state39;
			ELSIF (RAM(38)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state39;		
			ELSIF (RAM(38)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state38;	
			ELSIF(RAM(38)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state38;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state39;
			END IF;
			
		WHEN state39 => 
			IF(RAM(39)='1' AND go='1') THEN
				Logic		<="00010000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state40;
			ELSIF (RAM(39)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state40;		
			ELSIF (RAM(39)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state39;	
			ELSIF(RAM(39)='1' AND go='0') THEN
				Logic		<="00010000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state39;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state40;
			END IF;
		
		WHEN state40 => 
			IF(RAM(40)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state41;
			ELSIF (RAM(40)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state41;
			ELSIF (RAM(40)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state40;
			ELSIF(RAM(40)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state40;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state41;
			END IF;	
		
		WHEN state41 => 
			IF(RAM(41)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state42;
			ELSIF (RAM(41)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state42;		
			ELSIF (RAM(41)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state41;	
			ELSIF(RAM(41)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state41;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state42;
			END IF;	
			
		WHEN state42 => 
			IF(RAM(42)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state43;
			ELSIF (RAM(42)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state43;		
			ELSIF (RAM(42)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state42;
			ELSIF(RAM(42)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state42;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state43;
			END IF;
			
		WHEN state43 => 
			IF(RAM(43)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state44;
			ELSIF (RAM(43)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state44;	
			ELSIF (RAM(43)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state43;	
			ELSIF(RAM(43)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state43;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state44;
			END IF;
			
		WHEN state44 => 
			IF(RAM(44)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state45;
			ELSIF (RAM(44)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state45;		
			ELSIF (RAM(44)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state44;	
			ELSIF(RAM(44)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state44;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state45;
			END IF;
			
		WHEN state45 => 
			IF(RAM(45)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state46;
			ELSIF (RAM(45)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state46;		
			ELSIF (RAM(45)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state45;
			ELSIF(RAM(45)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state45;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state46;
			END IF;
			
		WHEN state46 => 
			IF(RAM(46)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state47;
			ELSIF (RAM(46)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state47;	
			ELSIF (RAM(46)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state46;		
			ELSIF(RAM(46)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state46;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state47;
			END IF;
			
		WHEN state47 => 
			IF(RAM(47)='1' AND go='1') THEN
				Logic		<="00100000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state48;
			ELSIF (RAM(47)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state48;		
			ELSIF (RAM(47)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state47;
			ELSIF(RAM(47)='1' AND go='0') THEN
				Logic		<="00100000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state47;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state48;
			END IF;
			
		WHEN state48 => 
			IF(RAM(48)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state49;
			ELSIF (RAM(48)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state49;
			ELSIF (RAM(48)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state48;
			ELSIF(RAM(48)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state48;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state49;
			END IF;	
		
		WHEN state49 => 
			IF(RAM(49)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state50;
			ELSIF (RAM(49)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state50;
			ELSIF (RAM(49)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state49;
			ELSIF(RAM(49)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state49;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state50;
			END IF;	
			
		WHEN state50 => 
			IF(RAM(50)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state51;
			ELSIF (RAM(50)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state51;	
			ELSIF (RAM(50)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state50;	
			ELSIF(RAM(50)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state50;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state51;
			END IF;
		
		WHEN state51 => 
			IF(RAM(51)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state52;
			ELSIF (RAM(51)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state52;	
			ELSIF (RAM(51)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state51;	
			ELSIF(RAM(51)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state51;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state52;
			END IF;
			
		WHEN state52 => 
			IF(RAM(52)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state53;
			ELSIF (RAM(52)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state53;	
			ELSIF (RAM(52)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state52;		
			ELSIF(RAM(52)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state52;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state53;
			END IF;
			
		WHEN state53 => 
			IF(RAM(53)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state54;
			ELSIF (RAM(53)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state54;	
			ELSIF (RAM(53)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state53;	
			ELSIF(RAM(53)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state53;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state54;
			END IF;
			
		WHEN state54 => 
			IF(RAM(54)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state55;
			ELSIF (RAM(54)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state55;		
			ELSIF (RAM(54)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state54;	
			ELSIF(RAM(54)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state54;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state55;
			END IF;
			
		WHEN state55 => 
			IF(RAM(55)='1' AND go='1') THEN
				Logic		<="01000000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state56;
			ELSIF (RAM(55)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state56;		
			ELSIF (RAM(55)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state55;	
			ELSIF(RAM(55)='1' AND go='0') THEN
				Logic		<="01000000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state55;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state56;
			END IF;
			
			WHEN state56 => 
			IF(RAM(56)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state57;
			ELSIF (RAM(56)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state57;
			ELSIF (RAM(56)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state56;
			ELSIF(RAM(56)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="01111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state56;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state57;
			END IF;	
		
		WHEN state57 => 
			IF(RAM(57)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state58;
			ELSIF (RAM(57)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state58;		
			ELSIF (RAM(57)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state57;	
			ELSIF(RAM(57)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="10111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state57;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state58;
			END IF;	
			
		WHEN state58 => 
			IF(RAM(58)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state59;
			ELSIF (RAM(58)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state59;		
			ELSIF (RAM(58)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state58;	
			ELSIF(RAM(58)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="11011111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state58;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state59;
			END IF;
			
		WHEN state59 => 
			IF(RAM(59)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state60;
			ELSIF (RAM(59)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state60;		
			ELSIF (RAM(59)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state59;	
			ELSIF(RAM(59)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="11101111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state59;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state60;
			END IF;
		
		WHEN state60 => 
			IF(RAM(60)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state61;
			ELSIF (RAM(60)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state61;	
			ELSIF (RAM(60)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state60;	
			ELSIF(RAM(60)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11110111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state60;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state61;
			END IF;
			
		WHEN state61 => 
			IF(RAM(61)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state62;
			ELSIF (RAM(61)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state62;		
			ELSIF (RAM(61)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state61;
			ELSIF(RAM(61)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="11111011";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state61;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state62;
			END IF;
			
		WHEN state62 => 
			IF(RAM(62)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state63;
			ELSIF (RAM(62)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state63;		
			ELSIF (RAM(62)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state62;	
			ELSIF(RAM(62)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="11111101";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state62;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state63;
			END IF;
			
		WHEN state63=> 
			IF(RAM(63)='1' AND go='1') THEN
				Logic		<="10000000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state64;
			ELSIF (RAM(63)='0' AND go='1') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state64;	
			ELSIF (RAM(63)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state63;		
			ELSIF(RAM(63)='1' AND go='0') THEN
				Logic		<="10000000";
				Unlogic	<="11111110";
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				nx_state <= state63;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state64;
			END IF;
			
			
			
		WHEN state64 => 
			IF(RAM(64)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="01111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state65;
			ELSIF (RAM(64)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state65;
			ELSIF (RAM(64)='0' AND go='0') THEN
				Logic		<="00000000";
				Unlogic	<="11111111";
				LogicB	<="00000000";
				UnlogicB<="11111111";
				nx_state <= state64;
			ELSIF(RAM(64)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state64;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state65;
			END IF;	
			
		WHEN state65 => 
			IF(RAM(65)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state66;
			ELSIF (RAM(65)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state66;	
			ELSIF (RAM(65)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state65;	
			ELSIF(RAM(65)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state65;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state66;
			END IF;	
			
		WHEN state66 => 
			IF(RAM(66)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state67;
			ELSIF (RAM(66)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state67;		
			ELSIF (RAM(66)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state66;
			ELSIF(RAM(66)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state66;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state67;
			END IF;
			
		WHEN state67 => 
			IF(RAM(67)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state68;
			ELSIF (RAM(67)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state68;	
			ELSIF (RAM(67)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state67;		
			ELSIF(RAM(67)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state67;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state68;
			END IF;
			
		WHEN state68 => 
			IF(RAM(68)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state69;
			ELSIF (RAM(68)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state69;		
			ELSIF (RAM(68)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state68;	
			ELSIF(RAM(68)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state68;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state69;
			END IF;
			
		WHEN state69 => 
			IF(RAM(69)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state70;
			ELSIF (RAM(69)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state70;		
			ELSIF (RAM(69)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state69;	
			ELSIF(RAM(69)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state69;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state70;
			END IF;
		
		WHEN state70 => 
			IF(RAM(70)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="11111101";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state71;
			ELSIF (RAM(70)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state71;	
			ELSIF (RAM(70)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state70;	
			ELSIF(RAM(70)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state70;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state71;
			END IF;
			
		WHEN state71 => 
			IF(RAM(71)='1' AND go='1') THEN
				LogicB	<="00000001";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state72;
			ELSIF (RAM(71)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state72;	
			ELSIF (RAM(71)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state71;		
			ELSIF(RAM(71)='1' AND go='0') THEN
				LogicB	<="00000001";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state71;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state72;
			END IF;
		
		WHEN state72 => 
			IF(RAM(72)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state73;
			ELSIF (RAM(72)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state73;
			ELSIF (RAM(72)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state72;
			ELSIF(RAM(72)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state72;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state73;
			END IF;	
		
		WHEN state73 => 
			IF(RAM(73)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state74;
			ELSIF (RAM(73)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state74;	
			ELSIF (RAM(73)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state73;
			ELSIF(RAM(73)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state73;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state74;
			END IF;	
			
		WHEN state74 => 
			IF(RAM(74)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state75;
			ELSIF (RAM(74)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state75;		
			ELSIF (RAM(74)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state74;	
			ELSIF(RAM(74)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="11011111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state74;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state75;
			END IF;
			
		WHEN state75 => 
			IF(RAM(75)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state76;
			ELSIF (RAM(75)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state76;	
			ELSIF (RAM(75)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state75;	
			ELSIF(RAM(75)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state75;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state76;
			END IF;
			
		WHEN state76 => 
			IF(RAM(76)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state77;
			ELSIF (RAM(76)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state77;	
			ELSIF (RAM(76)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state76;	
			ELSIF(RAM(76)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state76;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state77;
			END IF;
			
		WHEN state77 => 
			IF(RAM(77)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state78;
			ELSIF (RAM(77)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state78;		
			ELSIF (RAM(77)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state77;	
			ELSIF(RAM(77)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state77;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state78;
			END IF;
			
		WHEN state78 => 
			IF(RAM(78)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state79;
			ELSIF (RAM(78)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state79;	
			ELSIF (RAM(78)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state78;	
			ELSIF(RAM(78)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state78;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state79;
			END IF;
			
		WHEN state79 => 
			IF(RAM(79)='1' AND go='1') THEN
				LogicB	<="00000010";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state80;
			ELSIF (RAM(79)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state80;
			ELSIF (RAM(79)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state79;		
			ELSIF(RAM(79)='1' AND go='0') THEN
				LogicB	<="00000010";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state79;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state80;
			END IF;
			
		WHEN state80 => 
			IF(RAM(80)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state81;
			ELSIF (RAM(80)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state81;
			ELSIF (RAM(80)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state80;
			ELSIF(RAM(80)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="01111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state80;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state81;
			END IF;	
		
		WHEN state81 => 
			IF(RAM(81)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state82;
			ELSIF (RAM(81)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state82;		
			ELSIF (RAM(81)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state81;	
			ELSIF(RAM(81)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state81;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state82;
			END IF;	
			
		WHEN state82 => 
			IF(RAM(82)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state83;
			ELSIF (RAM(82)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state83;
			ELSIF (RAM(82)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state82;		
			ELSIF(RAM(82)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state82;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state83;
			END IF;
			
		WHEN state83 => 
			IF(RAM(83)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state84;
			ELSIF (RAM(83)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state84;	
			ELSIF (RAM(83)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state83;		
			ELSIF(RAM(83)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="11101111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state83;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state84;
			END IF;
		
		WHEN state84 => 
			IF(RAM(84)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state85;
			ELSIF (RAM(84)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state85;
			ELSIF (RAM(84)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state84;		
			ELSIF(RAM(84)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state84;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state85;
			END IF;
			
		WHEN state85 => 
			IF(RAM(85)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state86;
			ELSIF (RAM(85)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state86;	
			ELSIF (RAM(85)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state85;
			ELSIF(RAM(85)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state85;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state86;
			END IF;
			
		WHEN state86 => 
			IF(RAM(86)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state87;
			ELSIF (RAM(86)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state87;	
			ELSIF (RAM(86)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state86;
			ELSIF(RAM(86)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state86;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state87;
			END IF;
			
		WHEN state87 => 
			IF(RAM(87)='1' AND go='1') THEN
				LogicB	<="00000100";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state88;
			ELSIF (RAM(87)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state88;		
			ELSIF (RAM(87)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state87;
			ELSIF(RAM(87)='1' AND go='0') THEN
				LogicB	<="00000100";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state87;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state88;
			END IF;
		
		WHEN state88 => 
			IF(RAM(88)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state89;
			ELSIF (RAM(88)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state89;
			ELSIF (RAM(88)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state88;
			ELSIF(RAM(88)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state88;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state89;
			END IF;	
		
		WHEN state89 => 
			IF(RAM(89)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state90;
			ELSIF (RAM(89)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state90;	
			ELSIF (RAM(89)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state89;	
			ELSIF(RAM(89)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state89;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state90;
			END IF;	
			
		WHEN state90 => 
			IF(RAM(90)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state91;
			ELSIF (RAM(90)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state91;		
			ELSIF (RAM(90)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state90;	
			ELSIF(RAM(90)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state90;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state91;
			END IF;
	
		WHEN state91 => 
			IF(RAM(91)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state92;
			ELSIF (RAM(91)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state92;	
			ELSIF (RAM(91)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state91;	
			ELSIF(RAM(91)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state91;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state92;
			END IF;
			
		WHEN state92 => 
			IF(RAM(92)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state93;
			ELSIF (RAM(92)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state93;	
			ELSIF (RAM(92)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state92;		
			ELSIF(RAM(92)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state92;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state93;
			END IF;
			
		WHEN state93 => 
			IF(RAM(93)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state94;
			ELSIF (RAM(93)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state94;	
			ELSIF (RAM(93)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state93;	
			ELSIF(RAM(93)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state93;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state94;
			END IF;
			
		WHEN state94 => 
			IF(RAM(94)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state95;
			ELSIF (RAM(94)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state95;	
			ELSIF (RAM(94)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state94;	
			ELSIF(RAM(94)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state94;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state95;
			END IF;
			
		WHEN state95 => 
			IF(RAM(95)='1' AND go='1') THEN
				LogicB	<="00001000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state96;
			ELSIF (RAM(95)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state96;	
			ELSIF (RAM(95)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state95;	
			ELSIF(RAM(95)='1' AND go='0') THEN
				LogicB	<="00001000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state95;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state96;
			END IF;
		
		WHEN state96 => 
			IF(RAM(96)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state97;
			ELSIF (RAM(96)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state97;
			ELSIF (RAM(96)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state96;
			ELSIF(RAM(96)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state96;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state97;
			END IF;	
		
		WHEN state97 => 
			IF(RAM(97)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state98;
			ELSIF (RAM(97)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state98;		
			ELSIF (RAM(97)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state97;
			ELSIF(RAM(97)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state97;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state98;
			END IF;	
			
		WHEN state98 => 
			IF(RAM(98)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state99;
			ELSIF (RAM(98)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state99;	
			ELSIF (RAM(98)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state98;	
			ELSIF(RAM(98)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state98;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state99;
			END IF;
			
		WHEN state99 => 
			IF(RAM(99)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state100;
			ELSIF (RAM(99)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state100;	
			ELSIF (RAM(99)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state99;	
			ELSIF(RAM(99)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state99;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state100;
			END IF;
			
		WHEN state100 => 
			IF(RAM(100)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state101;
			ELSIF (RAM(100)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state101;	
			ELSIF (RAM(100)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state100;
			ELSIF(RAM(100)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state100;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state101;
			END IF;
			
		WHEN state101 => 
			IF(RAM(101)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state102;
			ELSIF (RAM(101)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state102;	
			ELSIF (RAM(101)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state101;
			ELSIF(RAM(101)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state101;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state102;
			END IF;
			
		WHEN state102 => 
			IF(RAM(102)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state103;
			ELSIF (RAM(102)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state103;
			ELSIF (RAM(102)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state102;
			ELSIF(RAM(102)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state102;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state103;
			END IF;
			
		WHEN state103 => 
			IF(RAM(103)='1' AND go='1') THEN
				LogicB	<="00010000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state104;
			ELSIF (RAM(103)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state104;	
			ELSIF (RAM(103)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state103;	
			ELSIF(RAM(103)='1' AND go='0') THEN
				LogicB	<="00010000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state103;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state104;
			END IF;
		
		WHEN state104 => 
			IF(RAM(104)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state105;
			ELSIF (RAM(104)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state105;
			ELSIF (RAM(104)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state104;
			ELSIF(RAM(104)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state104;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state105;
			END IF;	
		
		WHEN state105 => 
			IF(RAM(105)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state106;
			ELSIF (RAM(105)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state106;	
			ELSIF (RAM(105)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state105;
			ELSIF(RAM(105)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state105;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state106;
			END IF;	
			
		WHEN state106 => 
			IF(RAM(106)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="11011111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state107;
			ELSIF (RAM(106)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state107;		
			ELSIF (RAM(106)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state106;
			ELSIF(RAM(106)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="11011111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state106;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state107;
			END IF;
			
		WHEN state107 => 
			IF(RAM(107)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state108;
			ELSIF (RAM(107)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state108;	
			ELSIF (RAM(107)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state107;
			ELSIF	(RAM(107)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state107;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state108;
			END IF;
			
		WHEN state108 =>
			IF(RAM(108)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state109;
			ELSIF (RAM(108)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state109;	
			ELSIF (RAM(108)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state108;
			ELSIF(RAM(108)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state108;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state109;
			END IF;
			
		WHEN state109 => 
			IF(RAM(109)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state110;
			ELSIF (RAM(109)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state110;		
			ELSIF (RAM(109)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state109;	
			ELSIF(RAM(109)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state109;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state110;	
			END IF;
			
		WHEN state110 => 
			IF(RAM(110)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="11111101";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state111;
			ELSIF (RAM(110)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state111;		
			ELSIF (RAM(110)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state110;
			ELSIF(RAM(110)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="11111101";
				Logic	<="00000000";
				Unlogic<="11111111";
				nx_state <= state110;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state111;	
			END IF;
			
		WHEN state111 => 
			IF(RAM(111)='1' AND go='1') THEN
				LogicB	<="00100000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state112;
			ELSIF (RAM(111)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state112;	
			ELSIF (RAM(111)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state111;	
			ELSIF(RAM(111)='1' AND go='0') THEN
				LogicB	<="00100000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state111;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state112;	
			END IF;
			
		WHEN state112 => 
			IF(RAM(112)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state113;
			ELSIF (RAM(112)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state113;
			ELSIF (RAM(112)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state112;
			ELSIF(RAM(112)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state112;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state113;	
			END IF;	
		
		WHEN state113 => 
			IF	(RAM(113)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state114;
			ELSIF (RAM(113)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state114;	
			ELSIF (RAM(113)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state113;
			ELSIF	(RAM(113)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state113;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state114;			
			END IF;	
			
		WHEN state114 => 
			IF(RAM(114)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state115;
			ELSIF (RAM(114)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state115;	
			ELSIF (RAM(114)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state114;	
			ELSIF(RAM(114)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state114;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state115;	
			END IF;
			
		WHEN state115 => 
			IF(RAM(115)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state116;
			ELSIF (RAM(115)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state116;
			ELSIF (RAM(115)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state115;		
			ELSIF(RAM(115)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state115;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state116;	
			END IF;
			
		WHEN state116 => 
			IF(RAM(116)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state117;
			ELSIF (RAM(116)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state117;	
			ELSIF (RAM(116)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state116;	
			ELSIF(RAM(116)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state116;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state117;	
			END IF;
			
		WHEN state117 => 
			IF(RAM(117)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state118;
			ELSIF (RAM(117)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state118;	
			ELSIF (RAM(117)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state117;	
			ELSIF(RAM(117)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state117;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state118;	
			END IF;
			
		WHEN state118 => 
			IF(RAM(118)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state119;
			ELSIF (RAM(118)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state119;	
			ELSIF (RAM(118)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state118;	
			ELSIF(RAM(118)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state118;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state119;	
			END IF;
			
		WHEN state119 => 
			IF(RAM(119)='1' AND go='1') THEN
				LogicB	<="01000000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state120;
			ELSIF (RAM(119)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state120;	
			ELSIF (RAM(119)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state119;	
			ELSIF(RAM(119)='1' AND go='0') THEN
				LogicB	<="01000000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state119;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state120;	
			END IF;
			
			WHEN state120 => 
			IF(RAM(120)='1' AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state121;
			ELSIF (RAM(120)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state121;
			ELSIF (RAM(120)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state120;
			ELSIF(RAM(120)='1' AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="01111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state120;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state121;
			END IF;	
		
		WHEN state121 => 
			IF(RAM(121)='1' AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state122;
			ELSIF (RAM(121)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state122;	
			ELSIF (RAM(121)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state121;	
			ELSIF(RAM(121)='1' AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="10111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state121;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state122;
			END IF;	
			
		WHEN state122 => 
			IF(RAM(122)='1' AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state123;
			ELSIF (RAM(122)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state123;	
			ELSIF (RAM(122)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state122;	
			ELSIF(RAM(122)='1' AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="11011111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state122;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state123;
			END IF;
			
		WHEN state123 => 
			IF(RAM(123)='1' AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state124;
			ELSIF (RAM(123)='0' AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state124;	
			ELSIF (RAM(123)='0' AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state123;	
			ELSIF(RAM(123)='1' AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="11101111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state123;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state124;
			END IF;
			
		WHEN state124 => 
			IF(RAM(124)='1' AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state125;
			ELSIF (RAM(124)='0'AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state125;	
			ELSIF (RAM(124)='0'AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state124;	
			ELSIF(RAM(124)='1' AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="11110111";
				Logic		<="00000000";
				Unlogic	<="11111111";	
				nx_state <= state124;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state125;
			END IF;
			
		WHEN state125 => 
			IF(RAM(125)='1' AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state126;
			ELSIF (RAM(125)='0'AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state126;	
			ELSIF (RAM(125)='0'AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state125;	
			ELSIF(RAM(125)='1' AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111011";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state125;	
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state126;
			END IF;
			
		WHEN state126 => 
			IF(RAM(126)='1'AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state127;
			ELSIF (RAM(126)='0'AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state127;	
			ELSIF (RAM(126)='1'AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111101";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state126;	
			ELSIF (RAM(126)='0'AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state126;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state127;
			END IF;
			
		WHEN state127 => 
			IF(RAM(127)='1'AND go='1') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state0;
			ELSIF (RAM(127)='0'AND go='0') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state127;
			ELSIF (RAM(127)='0'AND go='1') THEN
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state0;
			ELSIF (RAM(127)='1'AND go='0') THEN
				LogicB	<="10000000";
				UnlogicB	<="11111110";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state127;
			ELSE
				LogicB	<="00000000";
				UnlogicB	<="11111111";
				Logic		<="00000000";
				Unlogic	<="11111111";
				nx_state <= state0;
			END IF;
		
			END CASE;
END PROCESS;

COL_O<=Logic;
ROW_O<=Unlogic;
COLB_O<=LogicB;
ROWB_O<=UnlogicB;	

Contador2:ENTITY work.univ_bin_counter
		  GENERIC MAP( N				=>16)
		  PORT MAP(		clk		 	=>	clk,
							rst			=> rst,
							rst1  =>rst1,
							ena			=> '1',
							max_tick		=>go);					
END ARCHITECTURE;