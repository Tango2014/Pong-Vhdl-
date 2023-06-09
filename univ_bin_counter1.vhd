LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------
ENTITY univ_bin_counter1 IS
	GENERIC	(	N				:	INTEGER	:= 23);
	PORT 		(	clk			: 	IN		STD_LOGIC;
					rst			: 	IN		STD_LOGIC;
					rst1		   : IN STD_LOGIC;
					ena			: 	IN		STD_LOGIC;
					max_count	: 	IN		UNSIGNED(N-1 DOWNTO 0);
					max_tick		: 	OUT	STD_LOGIC);
END ENTITY;
------------------------------------
ARCHITECTURE rt1 OF univ_bin_counter1 IS																					
	SIGNAL count_s			:	UNSIGNED (N-1 DOWNTO 0);
	SIGNAL count_next		:	UNSIGNED (N-1 DOWNTO 0);
	SIGNAL syn_clr_s		: STD_LOGIC;
	SIGNAL max_tick_s		: STD_LOGIC;
BEGIN
	count_next	<=		(OTHERS => '0')	WHEN	syn_clr_s = '1'	ELSE
							count_s + 1			WHEN	ena = '1'		ELSE
							count_s;
	PROCESS (clk,rst)
		VARIABLE	temp	:	UNSIGNED(N-1 DOWNTO 0);
	BEGIN
		IF(rst = '1' OR rst1='1') THEN
			temp :=	(OTHERS => '0');
		ELSIF (rising_edge(clk)) THEN
			IF (ena = '1') THEN
				temp := count_next;
			END IF;
		END IF;
		count_s <=	temp;
	END PROCESS;
	max_tick_s <= '1' WHEN count_s= max_count	ELSE '0';
	max_tick <= max_tick_s;
	syn_clr_s  <= '1' WHEN max_tick_s = '1' ELSE '0';
	
END ARCHITECTURE;