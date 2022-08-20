--
--
--__global__ void filter(uint64_t start, uint64_t size)
--{
--	uint64_t index = (uint64_t) blockIdx.x * blockDim.x + threadIdx.x;
--	uint64_t stride = (uint64_t) blockDim.x * gridDim.x;
--	uint64_t i = index;
--	while (i < size) {
--		XRSR128 rng;
--		xrsr_seed(&rng, start + i);
--		skip(&rng);
--		for (int j = 0; j < 12; j++)
--			if (xrsr_long(&rng) < 0xE666670000000000ULL)
--				goto end;
--		results[atomicAdd((unsigned long long *) &count, 1)] = start + i;
--	end:
--		i += stride;
--	}
--}
--
--

LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;

ENTITY filter IS
    PORT (
        CLK : IN STD_LOGIC;
        start_input : IN UNSIGNED(63 DOWNTO 0);
        is_valid : OUT STD_LOGIC
    );
END filter;
ARCHITECTURE arch OF filter IS

    SIGNAL seed_output, seed_rng_hi_outputut, seed_rng_lo_outputut, seed_seed_out, rng_skip_high, rng_skip_low, long_high0, long_low0, long_high1, long_low1, long_high2, long_low2, long_high3, long_low3, long_high4, long_low4, long_high5, long_low5, long_high6, long_low6, long_high7, long_low7, long_high8, long_low8, long_high9, long_low9, long_high10, long_low10, long_high11, long_low11, long_high12, long_low12: UNSIGNED(63 DOWNTO 0);
    SIGNAL start_input_in, seed_output_in, seed_rng_hi_outputut_in, seed_rng_lo_outputut_in, seed_seed_out_in, rng_skip_high_in, rng_skip_low_in, long_high0_in, long_low0_in, long_high1_in, long_low1_in, long_high2_in, long_low2_in, long_high3_in, long_low3_in, long_high4_in, long_low4_in, long_high5_in, long_low5_in, long_high6_in, long_low6_in, long_high7_in, long_low7_in, long_high8_in, long_low8_in, long_high9_in, long_low9_in, long_high10_in, long_low10_in, long_high11_in, long_low11_in, long_high12_in, long_low12_in: UNSIGNED(63 DOWNTO 0);
    SIGNAL long_res1, long_res2, long_res3, long_res4, long_res5, long_res6, long_res7, long_res8, long_res9, long_res10, long_res11, long_res12  : STD_LOGIC := '0';
    SIGNAL en0, en1, en2, en3, en4, en5, en6, en7, en8, en9, en10, en11, en12 : std_logic := '0';
    SIGNAL last_ready : std_logic := '0';
    COMPONENT xrsr_seed PORT(CLK : IN STD_LOGIC; seed_input : IN UNSIGNED(63 DOWNTO 0); rng_hi_output, rng_lo_output : OUT UNSIGNED(63 DOWNTO 0)); END COMPONENT;
    COMPONENT skip PORT(rng_hi_input, rng_lo_input : IN UNSIGNED(63 DOWNTO 0); rng_hi_output, rng_lo_output : OUT UNSIGNED(63 DOWNTO 0)); END COMPONENT;
    COMPONENT xrsr_long PORT(CLK, en : IN std_logic; rng_hi_input, rng_lo_input : IN UNSIGNED(63 DOWNTO 0); rng_hi_output, rng_lo_output : OUT UNSIGNED(63 DOWNTO 0); res_output : OUT STD_LOGIC); END COMPONENT;
    COMPONENT xrsr_long_last PORT(ready : out std_logic; CLK, en : IN std_logic; rng_hi_input, rng_lo_input : IN UNSIGNED(63 DOWNTO 0); rng_hi_output, rng_lo_output : OUT UNSIGNED(63 DOWNTO 0); res_output : OUT STD_LOGIC); END COMPONENT;

BEGIN

    U1 : xrsr_seed PORT MAP(CLK => CLK, seed_input => start_input_in, rng_hi_output => seed_rng_hi_outputut, rng_lo_output => seed_rng_lo_outputut);

    U2 : skip PORT MAP(rng_hi_input => seed_rng_hi_outputut_in, rng_lo_input => seed_rng_lo_outputut_in, rng_hi_output => long_high0, rng_lo_output => long_low0);

    U3 : xrsr_long PORT MAP(CLK => CLK, en => '1', rng_hi_input => long_high0_in, rng_lo_input => long_low0_in, rng_hi_output => long_high1, rng_lo_output => long_low1, res_output => long_res1);
    U4 : xrsr_long PORT MAP(CLK => CLK, en => en1, rng_hi_input => long_high1_in, rng_lo_input => long_low1_in, rng_hi_output => long_high2, rng_lo_output => long_low2, res_output => long_res2);
    U5 : xrsr_long PORT MAP(CLK => CLK, en => en2, rng_hi_input => long_high2_in, rng_lo_input => long_low2_in, rng_hi_output => long_high3, rng_lo_output => long_low3, res_output => long_res3);
    U6 : xrsr_long PORT MAP(CLK => CLK, en => en3, rng_hi_input => long_high3_in, rng_lo_input => long_low3_in, rng_hi_output => long_high4, rng_lo_output => long_low4, res_output => long_res4);
    U7 : xrsr_long PORT MAP(CLK => CLK, en => en4, rng_hi_input => long_high4_in, rng_lo_input => long_low4_in, rng_hi_output => long_high5, rng_lo_output => long_low5, res_output => long_res5);
    U8 : xrsr_long PORT MAP(CLK => CLK, en => en5, rng_hi_input => long_high5_in, rng_lo_input => long_low5_in, rng_hi_output => long_high6, rng_lo_output => long_low6, res_output => long_res6);
    U9 : xrsr_long PORT MAP(CLK => CLK, en => en6, rng_hi_input => long_high6_in, rng_lo_input => long_low6_in, rng_hi_output => long_high7, rng_lo_output => long_low7, res_output => long_res7);
    U10 : xrsr_long PORT MAP(CLK => CLK, en => en7, rng_hi_input => long_high7_in, rng_lo_input => long_low7_in, rng_hi_output => long_high8, rng_lo_output => long_low8, res_output => long_res8);
    U11 : xrsr_long PORT MAP(CLK => CLK, en => en8, rng_hi_input => long_high8_in, rng_lo_input => long_low8_in, rng_hi_output => long_high9, rng_lo_output => long_low9, res_output => long_res9);
    U12 : xrsr_long PORT MAP(CLK => CLK, en => en9, rng_hi_input => long_high9_in, rng_lo_input => long_low9_in, rng_hi_output => long_high10, rng_lo_output => long_low10, res_output => long_res10);
    U13 : xrsr_long PORT MAP(CLK => CLK, en => en10, rng_hi_input => long_high10_in, rng_lo_input => long_low10_in, rng_hi_output => long_high11, rng_lo_output => long_low11, res_output => long_res11);
    U14 : xrsr_long_last PORT MAP(CLK => CLK, ready => last_ready, en => en11, rng_hi_input => long_high11_in, rng_lo_input => long_low11_in, rng_hi_output => long_high12, rng_lo_output => long_low12, res_output => long_res12);


    --is_valid  <= long_res1 and long_res2 and long_res3 and long_res4 and long_res5 and long_res6 and long_res7 and long_res8 and long_res9 and long_res10 and long_res11 and long_res12;

    process(all) is
    begin
        if rising_edge(CLK) then
            en1 <= long_res1;
            en2 <= long_res2;
            en3 <= long_res3;
            en4 <= long_res4;
            en5 <= long_res5;
            en6 <= long_res6;
            en7 <= long_res7;
            en8 <= long_res8;
            en9 <= long_res9;
            en10 <= long_res10;
            en11 <= long_res11;
            if(last_ready = '1') then
                is_valid <= long_res12;
            end if;




            start_input_in <= start_input;
            seed_rng_hi_outputut_in <= seed_rng_hi_outputut;
            seed_rng_lo_outputut_in <= seed_rng_lo_outputut;


            long_high0_in <= long_high0;
            long_low0_in <= long_low0;
            long_high1_in <= long_high1;
            long_low1_in <= long_low1;
            long_high2_in <= long_high2;
            long_low2_in <= long_low2;
            long_high3_in <= long_high3;
            long_low3_in <= long_low3;
            long_high4_in <= long_high4;
            long_low4_in <= long_low4;
            long_high5_in <= long_high5;
            long_low5_in <= long_low5;
            long_high6_in <= long_high6;
            long_low6_in <= long_low6;
            long_high7_in <= long_high7;
            long_low7_in <= long_low7;
            long_high8_in <= long_high8;
            long_low8_in <= long_low8;
            long_high9_in <= long_high9;
            long_low9_in <= long_low9;
            long_high10_in <= long_high10;
            long_low10_in <= long_low10;
            long_high11_in <= long_high11;
            long_low11_in <= long_low11;
        end if;
    end process;



END arch;