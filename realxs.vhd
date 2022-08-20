LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

LIBRARY work;

ENTITY realxs IS
    PORT (
    clk_in1 : IN STD_LOGIC;
        --rst :   IN  std_logic;
        --ready:  IN  std_logic;
        valid1, valid2, valid3, valid4, valid5, valid6, valid7, valid8, valid9, valid10, valid11 : OUT STD_LOGIC
--      valid12, valid13, valid14, valid15, valid16, valid17, valid18, valid19, valid20, valid21, valid22, valid23, valid24, valid25, valid26, valid27, valid28, valid29, valid30, valid31, valid32, valid33, valid34, valid35, valid36, valid37, valid38, valid39, valid40, valid41, valid42, valid43, valid44, valid45, valid46, valid47, valid48, valid49, valid50 : OUT STD_LOGIC

		  --start_input : IN UNSIGNED(63 DOWNTO 0)
		  --f : OUT std_logic
    );

END realxs;

architecture arch of realxs is
--component clk_wiz_0
--port
-- (-- Clock in ports
--  -- Clock out ports
--  CLK          : out    std_logic;
--  clk_in1           : in     std_logic
-- );
--end component;

--constant ClockFrequency : integer := 100e6; -- 100 MHz
--constant ClockPeriod    : time    := 1000 ms / ClockFrequency;
signal inc_active : boolean := true;
signal start_input1 : UNSIGNED(63 DOWNTO 0) := x"0000000000000000";
--signal start_input2 : UNSIGNED(63 DOWNTO 0) := x"0000000000000001";
--signal start_input3 : UNSIGNED(63 DOWNTO 0) := x"0000000000000002";
--signal start_input4 : UNSIGNED(63 DOWNTO 0) := x"0000000000000003";
--signal start_input5 : UNSIGNED(63 DOWNTO 0) := x"0000000000000004";
--signal start_input6 : UNSIGNED(63 DOWNTO 0) := x"0000000000000005";
--signal start_input7 : UNSIGNED(63 DOWNTO 0) := x"0000000000000006";
--signal start_input8 : UNSIGNED(63 DOWNTO 0) := x"0000000000000007";
--signal start_input9 : UNSIGNED(63 DOWNTO 0) := x"0000000000000008";
--signal start_input10 : UNSIGNED(63 DOWNTO 0) := x"0000000000000009";
--signal start_input11 : UNSIGNED(63 DOWNTO 0) := x"000000000000000A";
--signal start_input12 : UNSIGNED(63 DOWNTO 0) := x"000000000000000B";
--signal start_input13 : UNSIGNED(63 DOWNTO 0) := x"000000000000000C";
--signal start_input14 : UNSIGNED(63 DOWNTO 0) := x"000000000000000D";
--signal start_input15 : UNSIGNED(63 DOWNTO 0) := x"000000000000000E";
--signal start_input16 : UNSIGNED(63 DOWNTO 0) := x"000000000000000F";
--signal start_input17 : UNSIGNED(63 DOWNTO 0) := x"0000000000000010";
--signal start_input18 : UNSIGNED(63 DOWNTO 0) := x"0000000000000011";
--signal start_input19 : UNSIGNED(63 DOWNTO 0) := x"0000000000000012";
--signal start_input20 : UNSIGNED(63 DOWNTO 0) := x"0000000000000013";
--signal start_input21 : UNSIGNED(63 DOWNTO 0) := x"0000000000000014";
--signal start_input22 : UNSIGNED(63 DOWNTO 0) := x"0000000000000015";
--signal start_input23 : UNSIGNED(63 DOWNTO 0) := x"0000000000000016";
--signal start_input24 : UNSIGNED(63 DOWNTO 0) := x"0000000000000017";
--signal start_input25 : UNSIGNED(63 DOWNTO 0) := x"0000000000000018";
--signal start_input26 : UNSIGNED(63 DOWNTO 0) := x"0000000000000019";
--signal start_input27 : UNSIGNED(63 DOWNTO 0) := x"000000000000001A";
--signal start_input28 : UNSIGNED(63 DOWNTO 0) := x"000000000000001B";
--signal start_input29 : UNSIGNED(63 DOWNTO 0) := x"000000000000001C";
--signal start_input30 : UNSIGNED(63 DOWNTO 0) := x"000000000000001D";
--signal start_input31 : UNSIGNED(63 DOWNTO 0) := x"000000000000001E";
--signal start_input32 : UNSIGNED(63 DOWNTO 0) := x"000000000000001F";
--signal start_input33 : UNSIGNED(63 DOWNTO 0) := x"0000000000000020";
--signal start_input34 : UNSIGNED(63 DOWNTO 0) := x"0000000000000021";
--signal start_input35 : UNSIGNED(63 DOWNTO 0) := x"0000000000000022";
--signal start_input36 : UNSIGNED(63 DOWNTO 0) := x"0000000000000023";
--signal start_input37 : UNSIGNED(63 DOWNTO 0) := x"0000000000000024";
--signal start_input38 : UNSIGNED(63 DOWNTO 0) := x"0000000000000025";
--signal start_input39 : UNSIGNED(63 DOWNTO 0) := x"0000000000000026";
--signal start_input40 : UNSIGNED(63 DOWNTO 0) := x"0000000000000027";
--signal start_input41 : UNSIGNED(63 DOWNTO 0) := x"0000000000000028";
--signal start_input42 : UNSIGNED(63 DOWNTO 0) := x"0000000000000029";
--signal start_input43 : UNSIGNED(63 DOWNTO 0) := x"000000000000002A";
--signal start_input44 : UNSIGNED(63 DOWNTO 0) := x"000000000000002B";
--signal start_input45 : UNSIGNED(63 DOWNTO 0) := x"000000000000002C";
--signal start_input46 : UNSIGNED(63 DOWNTO 0) := x"000000000000002D";
--signal start_input47 : UNSIGNED(63 DOWNTO 0) := x"000000000000002E";
--signal start_input48 : UNSIGNED(63 DOWNTO 0) := x"000000000000002F";
--signal start_input49 : UNSIGNED(63 DOWNTO 0) := x"0000000000000030";
--signal start_input50 : UNSIGNED(63 DOWNTO 0) := x"0000000000000031";

--SIGNAL CLK : STD_LOGIC;

--SIGNAL valid : std_logic;
--SIGNAL rng_high, rng_low, seed, start_input : UNSIGNED(63 DOWNTO 0);
BEGIN
--gamingcocc : clk_wiz_0
--   port map ( 
--  -- Clock out ports  
--   CLK => CLK,
--   -- Clock in ports
--   clk_in1 => clk_in1
-- );
    UUT1 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input1, is_valid => valid1);
--    UUT2 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input2, is_valid => valid2);
--    UUT3 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input3, is_valid => valid3);
--    UUT4 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input4, is_valid => valid4);
--    UUT5 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input5, is_valid => valid5);
--    UUT6 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input6, is_valid => valid6);
--    UUT7 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input7, is_valid => valid7);
--    UUT8 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input8, is_valid => valid8);
--    UUT9 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input9, is_valid => valid9);
--    UUT10 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input10, is_valid => valid10);
--    UUT11 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input11, is_valid => valid11);
--    UUT12 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input12, is_valid => valid12);
--    UUT13 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input13, is_valid => valid13);
--    UUT14 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input14, is_valid => valid14);
--    UUT15 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input15, is_valid => valid15);
--    UUT16 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input16, is_valid => valid16);
--    UUT17 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input17, is_valid => valid17);
--    UUT18 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input18, is_valid => valid18);
--    UUT19 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input19, is_valid => valid19);
--    UUT20 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input20, is_valid => valid20);
--    UUT21 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input21, is_valid => valid21);
--    UUT22 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input22, is_valid => valid22);
--    UUT23 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input23, is_valid => valid23);
--    UUT24 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input24, is_valid => valid24);
--    UUT25 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input25, is_valid => valid25);
--    UUT26 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input26, is_valid => valid26);
--    UUT27 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input27, is_valid => valid27);
--    UUT28 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input28, is_valid => valid28);
--    UUT29 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input29, is_valid => valid29);
--    UUT30 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input30, is_valid => valid30);
--    UUT31 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input31, is_valid => valid31);
--    UUT32 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input32, is_valid => valid32);
--    UUT33 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input33, is_valid => valid33);
--    UUT34 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input34, is_valid => valid34);
--    UUT35 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input35, is_valid => valid35);
--    UUT36 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input36, is_valid => valid36);
--    UUT37 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input37, is_valid => valid37);
--    UUT38 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input38, is_valid => valid38);
--    UUT39 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input39, is_valid => valid39);
--    UUT40 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input40, is_valid => valid40);
--    UUT41 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input41, is_valid => valid41);
--    UUT42 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input42, is_valid => valid42);
--    UUT43 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input43, is_valid => valid43);
--    UUT44 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input44, is_valid => valid44);
--    UUT45 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input45, is_valid => valid45);
--    UUT46 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input46, is_valid => valid46);
--    UUT47 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input47, is_valid => valid47);
--    UUT48 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input48, is_valid => valid48);
--    UUT49 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input49, is_valid => valid49);
--    UUT50 : entity work.filter PORT MAP (CLK => clk_in1, start_input => start_input50, is_valid => valid50);


    --clk <= not clk after ClockPeriod / 2;
	start_input1 <= (start_input1 + x"0000000000000001") after 1.5ns;
--	start_input2 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input3 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input4 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input5 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input6 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input7 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input8 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input9 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input10 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input11 <= (start_input1 + x"000000000000000A") after 1.5ns;
--	start_input12 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input13 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input14 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input15 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input16 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input17 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input18 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input19 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input20 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input21 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input22 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input23 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input24 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input25 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input26 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input27 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input28 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input29 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input30 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input31 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input32 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input33 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input34 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input35 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input36 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input37 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input38 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input39 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input40 <= (start_input1 + x"0000000000000028") after 1.5ns;
--	start_input41 <= (start_input1 + x"000000000000002D") after 1.5ns;
--	start_input42 <= (start_input1 + x"000000000000002D") after 1.5ns;
--	start_input43 <= (start_input1 + x"000000000000002D") after 1.5ns;
--	start_input44 <= (start_input1 + x"000000000000002D") after 1.5ns;
--	start_input45 <= (start_input1 + x"000000000000002D") after 1.5ns;
--	start_input46 <= (start_input1 + x"0000000000000031") after 1.5ns;
--	start_input47 <= (start_input1 + x"0000000000000031") after 1.5ns;
--	start_input48 <= (start_input1 + x"0000000000000031") after 1.5ns;
--	start_input49 <= (start_input1 + x"0000000000000031") after 1.5ns;
--	start_input50 <= (start_input1 + x"0000000000000031") after 1.5ns;




end arch;