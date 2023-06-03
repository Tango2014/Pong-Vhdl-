LIBRARY IEEE;
USE 	  IEEE.std_logic_1164.ALL;

ENTITY r_egister_1 IS
    PORT (  valueIn  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				rst		: IN STD_LOGIC; 
				rst1     : IN STD_LOGIC;
				clk	   : IN STD_LOGIC;
				valueOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY r_egister_1;

ARCHITECTURE funcional OF r_egister_1 IS
BEGIN

    identifier : PROCESS(clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF (rst = '1' OR rst1='1') THEN
                valueOut <="00000000";
            ELSE
                valueOut <= valueIn;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;