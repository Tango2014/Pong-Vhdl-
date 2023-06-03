LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.all;
----------------------------------------
ENTITY win_1 IS
PORT(		   rst : IN STD_LOGIC;
	         clk : IN STD_LOGIC;
				B_U1: IN STD_LOGIC;
				B_D1: IN STD_LOGIC;
				B_U2: IN STD_LOGIC;
				B_D2: IN STD_LOGIC;
				SC1    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				SC2    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
				COL_1		: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				ROW_1	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				COLB_1		: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
				ROWB_1	: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY win_1 ;
-------------------------------------------------------
ARCHITECTURE funtional OF win_1  IS
				SIGNAL ena,rst1            : STD_LOGIC;
				SIGNAL S1_S, S2_S   : STD_LOGIC_VECTOR(3 DOWNTO 0);
				SIGNAL RAM_S 		   : STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
				SIGNAL RAM_S0 		   : STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
				SIGNAL RAM_S1		   : STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
				SIGNAL RAM_S2		   : STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
				SIGNAL RAM_S3		   : STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
				SIGNAL RAM_S4		   : STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
BEGIN 
		
caja1 :ENTITY work.matriz_state
		PORT MAP(
				clk=> clk,
				rst=> rst,
				rst1  =>rst1,
	       	COL_O		=> COL_1,
				ROW_O	=> ROW_1,
				COLB_O		=> COLB_1,
				ROWB_O	=> ROWB_1,
				RAM         => RAM_S2);

caja7:ENTITY work.bin_to_sseg
	PORT MAP(
				clk=>clk,
				rst=>rst,
				rst1  =>rst1,
	         bin =>S2_S,
				sseg=>SC2
	
				);

caja6:ENTITY work.r_egister_4
	PORT MAP(
	
	         RAM_S2  =>RAM_S3,
				RAM_S0 => RAM_S0,
				RAM_S1 => RAM_S1,
				rst	=> rst,
				rst1  =>rst1,
				clk   =>    clk,
				valueOut=>RAM_S2);

				
caja5:ENTITY work.r_egister_3

	PORT MAP(
	
	         valueIn  =>RAM_S2,
				rst	=> rst,
				rst1  =>rst1,
				clk=> clk,
				valueOut=>RAM_S4);
				
		caja4:ENTITY work.p1
		PORT MAP(
					B_UP =>B_U1,
				   B_Down=>B_D1,  
			 	   clk=>clk,
					rst=>rst,
					rst1  =>rst1,
					RAM_S=>RAM_S0
		);
				caja3:ENTITY work.p2
		PORT MAP(
					 B_UP=>B_U2,
				   B_Down=>B_D2,
					clk=>clk,
					rst=>rst,
					rst1  =>rst1,
					RAM_S=>RAM_S1
		);
				caja2 :ENTITY work.ball
		PORT MAP(
		      clk=>clk,
				rst=>rst,
				rst1  =>rst1,
				RAM=>    RAM_S4,
			   SC_R=>S1_S,
				SC_L=>S2_S,
				RAM1	 =>RAM_S3
		);

		
		
		caja8 :ENTITY work.bin_to_sseg
	PORT MAP(
				clk=>clk,
				rst=>rst,
				rst1  =>rst1,
	         bin =>S1_S,
				sseg=>SC1
				);

 RESET: PROCESS(CLK)
	    BEGIN
        IF (rising_edge(clk)) THEN
            IF (S1_S>10 OR S2_S>10) THEN
				rst1<='1';
				ELSE
				rst1<=rst;
            END IF;
        END IF;
		END PROCESS;
END ARCHITECTURE funtional;