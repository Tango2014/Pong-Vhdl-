LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.ALL;
------------------------------------------
ENTITY ball IS
	PORT	(		clk		: IN 	STD_LOGIC;			
				rst     	: IN 	STD_LOGIC;
				rst1 	        : IN	STD_LOGIC;
				RAM		: IN	STD_LOGIC_VECTOR(127 DOWNTO 0);
				SC_R		: OUT   STD_LOGIC_VECTOR(3   DOWNTO 0);
				SC_L		: OUT 	STD_LOGIC_VECTOR(3   DOWNTO 0);
				RAM1		: OUT	STD_LOGIC_VECTOR(127 DOWNTO 0));	 
END ENTITY;
--------------------------------------------
ARCHITECTURE play OF ball IS

	TYPE state IS (IC,WAITING,MOVE,RACKETS,DIAGONAL,STRAIGHT,POINT);
	SIGNAL pr_state, nx_state  : state;
	SIGNAL RAM_S, RAM_O			:  STD_LOGIC_VECTOR(127 DOWNTO 0):=(others=>'0');
	SIGNAL ena				:  STD_LOGIC;
	SIGNAL ena_s				:  STD_LOGIC;
	SIGNAL max_count			:  UNSIGNED(22 DOWNTO 0):="11111111111111111111111";
	SIGNAL vel				:  UNSIGNED(22 DOWNTO 0):="11111111111111111111111";
	SIGNAL max_count_aux			:  UNSIGNED(22 DOWNTO 0):="11111111111111111111111";
	SIGNAL Up				:  STD_LOGIC;
	SIGNAL Direc				:  STD_LOGIC;
	SIGNAL Sense				:  STD_LOGIC;
	SIGNAL evaluation			:  STD_LOGIC;
	SIGNAL racket				:  STD_LOGIC;
	SIGNAL Up_nx				:  STD_LOGIC;
	SIGNAL Direc_nx				:  STD_LOGIC;
	SIGNAL Sense_nx				:  STD_LOGIC;
	SIGNAL evaluation_nx			:  STD_LOGIC;
	SIGNAL racket_nx			:  STD_LOGIC;
	SIGNAL SC_Rnx			:  STD_LOGIC;
	SIGNAL SC_Lnx			:  STD_LOGIC;
	SIGNAL SC_Rs				:  STD_LOGIC;
	SIGNAL SC_Ls				:  STD_LOGIC;
	SIGNAL SC_Raux			:  UNSIGNED(3 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL SC_Laux			:  UNSIGNED(3 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL SC_Raux1			:  UNSIGNED(3 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL SC_Laux1			:  UNSIGNED(3 DOWNTO 0):=(OTHERS =>'0');
	SIGNAL p_v				:  INTEGER;
	SIGNAL p_v1				:  INTEGER;
BEGIN

PROCESS(rst,clk,rst1) 
BEGIN
	IF(rst='1' OR rst1='1') THEN
		SC_Raux1  <= "0000";
		SC_Laux1  <= "0000";
		max_count_aux<="11111111111111111111111";
		pr_state     <=	IC;
		ELSIF(rising_edge(clk)) THEN
		pr_state  <=nx_state;
		SC_Rs  <=SC_Rnx;
		SC_Ls  <=SC_Lnx;
		Up_nx	  <=Up;
		Direc_nx  <=Direc;
		Sense_nx  <=Sense;	
		evaluation_nx<=evaluation;
		racket_nx<=racket;
		max_count_aux<=max_count;
		SC_Raux1  <= SC_Raux;
		SC_Laux1  <= SC_Laux;
		END IF;
END PROCESS;

MATRIZR:ENTITY work.r_egister_3
	PORT MAP(
	         valueIn  =>RAM_S,
		rst 	=> rst,
		rst1 	=>rst1,
		clk  	=> clk,
		valueOut=>RAM_O);

PV:ENTITY work.r_egister_2
	PORT MAP(
	         valueIn =>p_v,
		 rst	 => rst,
		 rst1    =>rst1,
		 clk	 => clk,
		 valueOut=>p_v1);

	PROCESS (pr_state,p_v,RAM_s,RAM,p_v1,ena,evaluation,racket,Sense,Direc,Up,evaluation_nx,
	racket_nx,Sense_nx,Direc_nx,Up_nx,SC_Lnx,SC_Ls,SC_Rnx,SC_Rs)
		BEGIN
			CASE pr_state IS
				WHEN IC=>
					Up<='1';
					Direc<='1';
					Sense<='1';
					evaluation<='1';
					racket<='0';
					SC_Rnx<='0';
					SC_Lnx<='0';
					p_v<=10;
					RAM_s<=(others=>'0');
					RAM_s(p_v1)<='1';
					nx_state<=WAITING;
					
				-------------------------------
				WHEN WAITING=>
				
					Direc<=Direc_nx;
					Sense<=Sense_nx;
					evaluation<=evaluation_nx;			
					SC_Rnx<='0';
					SC_Lnx<='0';
					RAM_s<=(others=>'0');
					RAM_s(p_v1)<='1';
					p_v<=p_v1;
						IF(ena='1') THEN
							racket<=racket_nx;
							Up<=Up_nx;
							nx_state<=MOVE;
						ELSIF(p_v1=15 OR p_v1=23 OR p_v1=31 OR p_v1=39 OR p_v1=47 OR p_v1=55 OR
					      	p_v1=63 OR p_v1=71 OR p_v1=79 OR p_v1=87 OR p_v1=95 OR p_v1=103 OR p_v1=111 OR (p_v1=119 AND                        evaluation='1'))    THEN 
								racket<=racket_nx;
								up<='0';
								nx_state<=WAITING;
						ELSIF(p_v1=16 OR p_v1=24 OR p_v1=32 OR p_v1=40 OR p_v1=48 OR 
					        	p_v1=56 OR p_v1=64 OR p_v1=72 OR p_v1=80 OR p_v1=88 OR p_v1=96 OR p_v1=104 OR p_v1=112 OR (                        p_v1=8 AND evaluation='1')) THEN 
								racket<=racket_nx;
								up<='1';
								nx_state<=WAITING;
						ELSIF((p_v1<16 OR p_v1>111)AND evaluation='0') THEN
								racket<='1';
								Up<=Up_nx;
								nx_state<=WAITING;
						ELSE
							racket<=racket_nx;
							Up<=Up_nx;
							nx_state<=WAITING;		
						END IF;
	WHEN MOVE=>
	
		racket<=racket_nx;
		Up<=Up_nx;
		Direc<=Direc_nx;
		Sense<=Sense_nx;
		evaluation<=evaluation_nx;			
		SC_Rnx<=SC_Rs;
		SC_Lnx<=SC_Ls;
		RAM_s<=(others=>'0');
		RAM_s(p_v1)<='1';
		p_v<=p_v1;
		IF(racket='1') THEN
				nx_state<=Rackets;
		ELSIF(sense='1') THEN
				nx_state<=Diagonal;
		ELSIF(sense='0') THEN
				nx_state<=straight;
		ELSE
		   nx_state<=WAITING;
		END IF;

	WHEN Rackets=>

		RAM_s<=(others=>'0');
		RAM_s(p_v1)<='1';
		p_v<=p_v1;
		SC_Rnx<=SC_Rs;
		SC_Lnx<=SC_Ls;
	IF(((RAM((p_v1+8)) AND RAM((p_v1+9))AND
	     RAM((p_v1+7)))='1') OR ((RAM((p_v1-8)) AND
	     RAM((p_v1-9))AND RAM((p_v1-7)))='1')) THEN
		  sense<='0';
		  racket<='0';
		  Up<=Up_nx;
		  Direc<=NOT Direc_nx;
		  evaluation<='1';
		  nx_state<=WAITING;
	ELSIF(((RAM((p_v1+8))='1' AND 
	        RAM((p_v1+7))='1' AND RAM((p_v1+9))='0')OR
	       (RAM((p_v1-8))='1'AND RAM((p_v1-9))='1' AND
	       (RAM((p_v1-7))='0')))) THEN
		     sense<='1';
		     racket<='0';
		     Up<='1';
		     Direc<=NOT Direc_nx;
		     evaluation<='1';
		     nx_state<=WAITING;
	ElSIF((((RAM((p_v1+8))='1' AND RAM((p_v1+7))='0') AND
	        (RAM((p_v1+9))='1'))OR ((RAM((p_v1-8))='1' AND
	         RAM((p_v1-7))='1') AND (RAM((p_v1-9))='0')))) THEN
		      sense<='1';
		      racket<='0';
		      Up<='0';
		      Direc<=NOT Direc_nx;
		      evaluation<='1';
		      nx_state<=WAITING;
	ELSE
	         racket<=racket_nx;
		      Up<=Up_nx;
	       	Direc<=Direc_nx;
		      Sense<=Sense_nx;
		      evaluation<=evaluation_nx;
		      nx_state<=POINT;
	END IF;

	WHEN POINT=>
			   Direc<=Direc_nx;
			   evaluation<=evaluation_nx;			
			   nx_state<=WAITING;
		IF(Direc='1')THEN
				RAM_s<=(others=>'0');
				RAM_s(68)<='1';
				p_v<=68;
				sense<='1';
				Up<='1';
				racket<='0';
				SC_Rnx<='1';
				SC_Lnx<='0';
	   ELSIF(Direc='0') THEN
				RAM_s<=(others=>'0');
				RAM_s(60)<='1';
				p_v<=60;
				sense<='1';
				racket<='0';
				Up<='1';
				SC_Rnx<='0';
				SC_Lnx<='1';
		ELSE	
				SC_Rnx<=SC_Rs;
				SC_Lnx<=SC_Ls;
				Sense<=Sense_nx;
				racket<=racket_nx;
				Up<=Up_nx;
				RAM_s<=(others=>'0');
				RAM_s(p_v1)<='1';
				p_v<=p_v1;
				END IF;	

		WHEN DIAGONAL=>
			   racket<=racket_nx;
			   Up<=Up_nx;
			   Direc<=Direc_nx;
		    	Sense<=Sense_nx;
		   	SC_Rnx<=SC_Rs;
		   	SC_Lnx<=SC_Ls;
		   	nx_state<=WAITING;
		IF(Direc='1' AND Up='1')THEN
				RAM_s<=(others=>'0');
				RAM_s(p_v1)<='1';
				p_v<=p_v1+9;
				evaluation<='0';
		ELSIF(Direc='1' AND Up='0')THEN
				RAM_s<=(others=>'0');
				RAM_s(p_v1)<='1';
				p_v<=p_v1+7;
				evaluation<='0';
			
		ELSIF(Direc='0' AND Up='1')THEN
				RAM_s<=(others=>'0');
				RAM_s(p_v1)<='1';
				p_v<=p_v1-7;
				evaluation<='0';
				
		ELSIF(Direc='0' AND Up='0')THEN
				RAM_s<=(others=>'0');
				p_v<=p_v1-9;
				RAM_s(p_v1)<='1';
				evaluation<='0';
		ELSE
				evaluation<=evaluation_nx;	
				RAM_s<=(others=>'0');
		      RAM_s(p_v1)<='1';
				p_v<=p_v1;
			END IF;
		WHEN STRAIGHT=>
		      racket<=racket_nx;
		      Up<=Up_nx;
		      Direc<=Direc_nx;
		      Sense<=Sense_nx;
		      SC_Rnx<=SC_Rs;
		      SC_Lnx<=SC_Ls;
		      nx_state<=WAITING;
		IF(Direc='1')THEN
				RAM_s<=(others=>'0');
				p_v<=p_v1+8;
				RAM_s(p_v1)<='1';
				evaluation<='0';	
		 ELSIF(Direc='0')THEN
				RAM_s<=(others=>'0');
				p_v<=p_v1-8;
				RAM_s(p_v1)<='1';
				evaluation<='0';
		 ELSE
				evaluation<=evaluation_nx;	
			   RAM_s<=(others=>'0');
		      RAM_s(p_v1)<='1';
				p_v<=p_v1;
			END IF;
		END CASE;
END PROCESS;

RAM1<=RAM_O;

      Contador2:ENTITY work.univ_bin_counter1
		  GENERIC MAP( N	=>23)
		  PORT MAP(   clk 	=>clk,
			      rst	=> rst,
			      rst1 	=>rst1,
			      ena	=> '1',
			      max_count	=> max_count,
			      max_tick	=>ena);	
	
	   Contador3:ENTITY work.univ_bin_counter1
		  GENERIC MAP( 	N	=>23)
		  PORT 	  MAP(	clk 	  =>clk,
			      	rst	  =>rst,
				rst1      =>rst1,
				ena	  => '1',
				max_count => vel,
				max_tick  =>ena_s);
max_count<= max_count_aux-10000 WHEN ena_s='1' ELSE max_count_aux;
SC_Laux<=SC_Laux1+1 WHEN SC_Ls='1' ELSE SC_Laux1;
SC_Raux<=SC_Raux1+1 WHEN SC_Rs='1' ELSE SC_Raux1;	
SC_L<=STD_LOGIC_VECTOR(SC_Laux);
SC_R<=STD_LOGIC_VECTOR(SC_Raux);		
END;