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
        en : IN std_logic;
        CLK : in std_logic;
        --real_out : out unsigned(23 downto 0)
        res_output : OUT STD_LOGIC
    );
END xrsr_long;
ARCHITECTURE arch OF xrsr_long IS
    SIGNAL temp : UNSIGNED(23 DOWNTO 0);
    SIGNAL temp2 : UNSIGNED(63 DOWNTO 0);
    SIGNAL temp_rng_hi : UNSIGNED(63 DOWNTO 0);
    SIGNAL temp_res : std_logic := '0';

BEGIN
    process(all) is
    begin
        if rising_edge(CLK) then

            if(en = '1') then
                temp2 <= rotate_left(rng_lo_input + rng_hi_input, 17) + rng_lo_input;
                temp <= temp2(63 DOWNTO 40);
                --temp_res  <= '1' when (temp > x"E66667") else '0';
                --if(temp_res = '1') then
                if(temp > x"E66667") then
                    temp_res <= '1';
                    temp_rng_hi <= rng_hi_input XOR rng_lo_input;
                    rng_lo_output <= rotate_left(rng_lo_input, 49) XOR temp_rng_hi XOR shift_left(temp_rng_hi, 21);
                    rng_hi_output <= rotate_left(temp_rng_hi, 28);
                end if;
            end if;
            res_output <= temp_res;
        end if;
    end process;
END arch;




LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY xrsr_long_last IS
    PORT (
        rng_lo_input : IN UNSIGNED(63 DOWNTO 0);
        rng_hi_input : IN UNSIGNED(63 DOWNTO 0);
        rng_lo_output : OUT UNSIGNED(63 DOWNTO 0);
        rng_hi_output : OUT UNSIGNED(63 DOWNTO 0);
        en : IN std_logic;
        ready : out std_logic;
        CLK : in std_logic;
        --real_out : out unsigned(23 downto 0)
        res_output : OUT STD_LOGIC
    );
END xrsr_long_last;
ARCHITECTURE arch OF xrsr_long_last IS
    SIGNAL temp : UNSIGNED(23 DOWNTO 0);
    SIGNAL temp2 : UNSIGNED(63 DOWNTO 0);
    SIGNAL temp_rng_hi : UNSIGNED(63 DOWNTO 0);
    SIGNAL temp_res : std_logic := '0';

BEGIN
    process(all) is
    begin
        if rising_edge(CLK) then
            if(en = '1') then
                temp2 <= rotate_left(rng_lo_input + rng_hi_input, 17) + rng_lo_input;
                temp <= temp2(63 DOWNTO 40);
                --temp_res  <= '1' when (temp > x"E66667") else '0';
                --if(temp_res = '1') then
                if(temp > x"E66667") then
                    temp_res <= '1';
                    temp_rng_hi <= rng_hi_input XOR rng_lo_input;
                    rng_lo_output <= rotate_left(rng_lo_input, 49) XOR temp_rng_hi XOR shift_left(temp_rng_hi, 21);
                    rng_hi_output <= rotate_left(temp_rng_hi, 28);
                end if;
            end if;
            res_output <= temp_res;
            ready <= '1';
        end if;
    end process;
END arch;