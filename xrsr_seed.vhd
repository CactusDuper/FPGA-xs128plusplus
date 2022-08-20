--
--
--XRSRDEV void xrsr_seed(XRSR128 *rng, uint64_t seed)
--{
--	seed ^= XRSR_SILVER_RATIO;
--	rng->lo = mix64(seed);
--	rng->hi = mix64(seed + XRSR_GOLDEN_RATIO);
--}
--
--
--
LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


ENTITY xrsr_seed IS
    PORT (
    CLK : IN STD_LOGIC;
        seed_input : IN UNSIGNED(63 DOWNTO 0);
        rng_lo_output : OUT UNSIGNED(63 DOWNTO 0);
        rng_hi_output : OUT UNSIGNED(63 DOWNTO 0)
    );
END xrsr_seed;
ARCHITECTURE arch OF xrsr_seed IS
	SIGNAL temp_idk : UNSIGNED(63 DOWNTO 0);
    COMPONENT mix64 PORT(CLK : IN STD_LOGIC; u64_input : IN UNSIGNED(63 DOWNTO 0); u64_output : OUT UNSIGNED(63 DOWNTO 0)); END COMPONENT;
    BEGIN
    
    --temp_seed <= seed_input XOR x"6a09e667f3bcc909";
    temp_idk <= seed_input + x"9e3779b97f4a7c15";
    U1 : mix64 PORT MAP(CLK => CLK, u64_input => seed_input, u64_output => rng_lo_output);
    U2 : mix64 PORT MAP(CLK => CLK, u64_input => temp_idk, u64_output => rng_hi_output);
END arch;