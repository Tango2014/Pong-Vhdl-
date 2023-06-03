LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.all;
----------------------------------------
ENTITY p1 IS
			PORT(		   B_up  : IN STD_LOGIC;
							clk			: IN STD_LOGIC;
							B_DOWN : IN STD_LOGIC; 
							rst			: IN		STD_LOGIC;
							rst1   		: IN STD_LOGIC;
							RAM_S	      : OUT	STD_LOGIC_VECTOR(127 DOWNTO 0));
		END ENTITY;
		-------------------------------------------------------
ARCHITECTURE funtional OF p1 IS
	TYPE state is (IC,W,Up,Down);
	SIGNAL pr_state, nx_state: state;
	SIGNAL RAM:STD_LOGIC_VECTOR(127 DOWNTO 0):=(OTHERS=>'0');
 SIGNAL k1 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k2 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k3 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k4 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k5 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k6 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k7 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k8 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k9 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k10 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k11 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL k12 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	 SIGNAL k13 :STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	 SIGNAL k14:STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	 SIGNAL k15:STD_LOGIC_VECTOR(7 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL  k0:STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL k0_i:STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL B1,B2,B11,B22: STD_LOGIC;
	SIGNAL Bup, bdown :STD_LOGIC_VECTOR(1 DOWNTO 0);
	BEGIN 
	PROCESS(rst,clk)
		BEGIN
			IF(rst='1' OR rst1='1') THEN
				pr_state	<=IC;
			ELSIF(rising_edge(clk)) THEN
				pr_state	<=	nx_state;
			END IF;
		END PROCESS;
		
		caja1:ENTITY work.edge_detect
				PORT MAP(
					clk =>    clk,  
					async_sig=>B_up,
					rise=>B1,
					fall=>B11
				);
		caja2:ENTITY work.edge_detect
				PORT MAP(
					clk =>    clk,  
					async_sig=>B_down,
					rise=>B2,
					fall=>B22
				);
		
		Bup <= B1&B11;
		Bdown <= B2 &B22;
		
	caja3:ENTITY work.r_egister_1
			PORT MAP(
						valueIn  =>k0,
						rst	=> rst,
						rst1  =>rst1,
						clk=> clk,
						valueOut=>k0_i
									);
		------------------------------
		PROCESS (pr_state,Bup,Bdown,k0_i,k0)
		BEGIN
					CASE pr_state IS
		
						WHEN IC=>
							k0<="00011100"; 
							nx_state<=W;
							
						WHEN W=>
							k0<=k0_i;
							IF (Bup= "10" AND Bdown="00") THEN
								nx_state<=Up;
							ELSIF(Bup= "00" AND Bdown="10")THEN
								nx_state<=Down;
							ELSE
								nx_state<=W;
							END IF;
					-----------------------------------
						WHEN Up=>
							IF (k0_i="00000111")THEN 
								k0<="00001110";
							
							ELSIF (k0_i="00001110")THEN
								k0<="00011100";
								
			            ELSIF (k0_i="00011100") THEN
								k0<="00111000";
								nx_state<=W;
							ELSIF (k0_i="00111000") THEN
								k0<="01110000";
								
						ELSIF (k0_i="01110000") THEN
								k0<="11100000";
--								
							
						ELSIF (k0_i="11100000") THEN
								k0<="11100000";
--								
						ELSE
								k0<=k0_i;
								
                 END IF;
					  nx_state<=W;
			----------------------------------------
							WHEN Down=>
							IF (k0_i="11100000")THEN
											k0<="01110000";
											
							ELSIF (k0_i="01110000")THEN
											k0<="00111000";
							
							ELSIF (k0_i="00111000")THEN
								k0<="00011100";
								
							ELSIF (k0_i="00011100") THEN
								k0<="00001110";
							
							ELSIF (k0_i="00001110") THEN
								k0<="00000111";
								
							ELSIF (k0_i="00000111") THEN
							k0<="00000111";
							ELSE
							k0<=k0_i;
							
							END IF;
							nx_state<=W;
			END CASE;
		  END PROCESS;
		  
		  salida_s: FOR j IN 0 TO 7
		  GENERATE	
		 RAM(j)<=k0_i(j);
		 RAM(j+8)<=k1(j);
		 RAM(j+16)<=k2(j);
		 RAM(j+24)<=k3(j);
		 RAM(j+32)<=k4(j);
		 RAM(j+40)<=k5(j);
		 RAM(j+48)<=k6(j);
		 RAM(j+56)<=k7(j);
		 RAM(j+64)<=k8(j);
		 RAM(j+72)<=k9(j);
		 RAM(j+80)<=k10(j);
		 RAM(j+88)<=k11(j);
		 RAM(j+96)<=k12(j);
		 RAM(j+104)<=k13(j);
		 RAM(j+112)<=k14(j);
		 RAM(j+120)<=k15(j);
		  END GENERATE;
		  SALIDA:
		  FOR j IN 0 TO 7
		  GENERATE
 RAM_S(j)<=RAM(j);
 RAM_S(j+8)<=RAM(j+8);
 RAM_S(j+16)<=RAM(j+16);
 RAM_S(j+24)<=RAM(j+24);
 RAM_S(j+32)<=RAM(j+32);
 RAM_S(j+40)<=RAM(j+40);
 RAM_S(j+48)<=RAM(j+48);
 RAM_S(j+56)<=RAM(j+56);
 RAM_S(j+64)<=RAM(j+64);
 RAM_S(j+72)<=RAM(j+72);
 RAM_S(j+80)<=RAM(j+80);
 RAM_S(j+88)<=RAM(j+88);
 RAM_S(j+96)<=RAM(j+96);
 RAM_S(j+104)<=RAM(j+104);
 RAM_S(j+112)<=RAM(j+112);
 RAM_S(j+120)<=RAM(j+120);
  END GENERATE;
		END ARCHITECTURE funtional;