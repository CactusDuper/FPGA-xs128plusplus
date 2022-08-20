--
--
--XRSRDEV static uint64_t mix64(uint64_t u64)
--{
--  u64 = (u64 ^ u64 >> 30) * XRSR_MIX1;
--  u64 = (u64 ^ u64 >> 27) * XRSR_MIX2;
--  return u64 ^ u64 >> 31;
--}
--
--
--
LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

LIBRARY mult_gen_v12_0_17;
USE mult_gen_v12_0_17.mult_gen_v12_0_17;


ENTITY mix64 IS
    PORT (
    CLK : IN STD_LOGIC;
        u64_input : IN UNSIGNED(63 DOWNTO 0);
        u64_output : OUT UNSIGNED(63 DOWNTO 0)
    );
END mix64;
ARCHITECTURE arch OF mix64 IS
COMPONENT mult_gen_0
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END COMPONENT;
COMPONENT mult_gen_1
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END COMPONENT;
	SIGNAL mixtemp0, mixtemp1, mixtemp2, mixtemp3 : UNSIGNED(63 DOWNTO 0);
	SIGNAL notgaming1, notgaming2, notgaming3, notgaming4 : STD_LOGIC_VECTOR(63 DOWNTO 0);
    BEGIN
    
    mixtemp0(33 DOWNTO 0) <= u64_input(33 DOWNTO 0) xor u64_input(63 DOWNTO 30);
    mixtemp0(63 DOWNTO 34) <= u64_input(63 DOWNTO 34);
    
    notgaming1 <= std_logic_vector(mixtemp0);
    
  mult1 : mult_gen_0
  PORT MAP (
    CLK => CLK,
    A => notgaming1,
    P => notgaming2
  );
  
    --mixtemp1 <= mixtemp0 * x"bf58476d1ce4e5b9";
    
    mixtemp1 <= unsigned(notgaming2);
    
	mixtemp2(36 DOWNTO 0) <= (mixtemp1(36 DOWNTO 0) xor mixtemp1(63 DOWNTO 27));
	mixtemp2(63 DOWNTO 37) <= mixtemp1(63 DOWNTO 37);
	
	
	notgaming3 <= std_logic_vector(mixtemp2);
	
mult2 : mult_gen_1
  PORT MAP (
    CLK => CLK,
    A => notgaming3,
    P => notgaming4
  );
    --mixtemp3 <= mixtemp2 * x"94d049bb133111eb";
    
    mixtemp3 <= unsigned(notgaming4);
    
    u64_output(32 DOWNTO 0) <= mixtemp3(32 DOWNTO 0) xor mixtemp3(63 DOWNTO 31);
    u64_output(63 DOWNTO 33) <= mixtemp3(63 DOWNTO 33);
END arch;