--
--
--XRSRDEV uint64_t xrsr_long(XRSR128 *rng)
--{
--	uint64_t res = rol64(rng->lo + rng->hi, 17) + rng->lo;
--	xrsr128_next(rng);
--	return res;
--}
--
--

LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY xrsr_long IS
    PORT (
        rng_lo_input : IN UNSIGNED(63 DOWNTO 0);
        rng_hi_input : IN UNSIGNED(63 DOWNTO 0);
        rng_lo_output : OUT UNSIGNED(63 DOWNTO 0);
        rng_hi_output : OUT UNSIGNED(63 DOWNTO 0);
        res_output : OUT STD_LOGIC
    );
END xrsr_long;
ARCHITECTURE arch OF xrsr_long IS
    SIGNAL temp : UNSIGNED(23 DOWNTO 0);
    SIGNAL temp2 : UNSIGNED(63 DOWNTO 0);
    SIGNAL temp_rng_hi : UNSIGNED(63 DOWNTO 0);
    
    BEGIN
    --PROCESS
    --VARIABLE t : UNSIGNED(63 DOWNTO 0) := rotate_left(rng_lo_input + rng_hi_input, 17) + rng_lo_input;
    --VARIABLE t2 : UNSIGNED(23 DOWNTO 0) := t(63 DOWNTO 40);
    --VARIABLE trh : UNSIGNED(63 DOWNTO 0) := rng_hi_input XOR rng_lo_input;
    --BEGIN
        temp2 <= rotate_left(rng_lo_input + rng_hi_input, 17) + rng_lo_input;
        temp <= temp2(63 DOWNTO 40);
        
        res_output  <= '1' when (temp > x"E66667") else '0';
    
        temp_rng_hi <= rng_hi_input XOR rng_lo_input;
        rng_lo_output <= rotate_left(rng_lo_input, 49) XOR temp_rng_hi XOR shift_left(temp_rng_hi, 21);
        rng_hi_output <= rotate_left(temp_rng_hi, 28);
END arch;