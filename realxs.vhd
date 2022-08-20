LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
LIBRARY work;

ENTITY realxs IS
    PORT (
        clk_in1 : IN STD_LOGIC;
        valid1 : OUT STD_LOGIC;
        seedrange : OUT std_logic_vector(63 downto 0)
    );

END realxs;

architecture arch of realxs is

    type inp is array(0 to 54) of unsigned(63 downto 0);
    type val is array(0 to 54) of std_logic;

        component clk_wiz_0
            port
    (
                clk_out1          : out    std_logic;
                clk_in1           : in     std_logic
            );
        end component clk_wiz_0;

    component filter
        port(
            CLK : in std_logic;
            start_input : in unsigned(63 downto 0);
            is_valid : out std_logic
        );
    end component;

    signal start_inputs : inp := (x"0000000000000000", x"0000000000000001", x"0000000000000002", x"0000000000000003", x"0000000000000004", x"0000000000000005", x"0000000000000006", x"0000000000000007", x"0000000000000008", x"0000000000000009", x"000000000000000A", x"000000000000000B", x"000000000000000C", x"000000000000000D", x"000000000000000E", x"000000000000000F", x"0000000000000010", x"0000000000000011", x"0000000000000012", x"0000000000000013", x"0000000000000014", x"0000000000000015", x"0000000000000016", x"0000000000000017", x"0000000000000018", x"0000000000000019", x"000000000000001A", x"000000000000001B", x"000000000000001C", x"000000000000001D", x"000000000000001E", x"000000000000001F", x"0000000000000020", x"0000000000000021", x"0000000000000022", x"0000000000000023", x"0000000000000024", x"0000000000000025", x"0000000000000026", x"0000000000000027", x"0000000000000028", x"0000000000000029", x"000000000000002A", x"000000000000002B", x"000000000000002C", x"000000000000002D", x"000000000000002E", x"000000000000002F", x"0000000000000030", x"0000000000000031", x"0000000000000032", x"0000000000000033", x"0000000000000034", x"0000000000000035", x"0000000000000036");--, x"0000000000000037", x"0000000000000038", x"0000000000000039", x"000000000000003A", x"000000000000003B", x"000000000000003C", x"000000000000003D", x"000000000000003E", x"000000000000003F", x"0000000000000040", x"0000000000000041", x"0000000000000042", x"0000000000000043", x"0000000000000044", x"0000000000000045", x"0000000000000046", x"0000000000000047", x"0000000000000048", x"0000000000000049", x"000000000000004A");
    signal valids : val := ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    SIGNAL CLK : STD_LOGIC;


    SIGNAL valid : std_logic;
    --SIGNAL rng_high, rng_low, seed : UNSIGNED(63 DOWNTO 0);

    --signal start_input : UNSIGNED(63 DOWNTO 0) := x"0000002E67332121";
    --signal testvalid : std_logic;

BEGIN
        mclock : clk_wiz_0
            port map (
                clk_out1 => CLK,
                clk_in1 => clk_in1
            );

        gen_fil: for I in 0 to 54 generate--59
            gamer : entity work.filter port map(CLK, start_inputs(I), valids(I));
        end generate gen_fil;

    --gamer : entity work.filter port map(CLK => CLK, start_input => start_input, is_valid => testvalid);

    process(CLK) is
    begin
        if rising_edge(CLK) then
                        for I in 0 to 54 loop--59
                            start_inputs(I) <= start_inputs(I) + x"37"; -- 32
                        end loop;
            --start_input <= start_input + x"1";
        end if;

    end process;
    valid <= valids(0) or valids(1) or valids(2) or valids(3) or valids(4) or valids(5) or valids(6) or valids(7) or valids(8) or valids(9) or valids(10) or valids(11) or valids(12) or valids(13) or valids(14) or valids(15) or valids(16) or valids(17) or valids(18) or valids(19) or valids(20) or valids(21) or valids(22) or valids(23) or valids(24) or valids(25) or valids(26) or valids(27) or valids(28) or valids(29) or valids(30) or valids(31) or valids(32) or valids(33) or valids(34) or valids(35) or valids(36) or valids(37) or valids(38) or valids(39) or valids(40) or valids(41) or valids(42) or valids(43) or valids(44) or valids(45) or valids(46) or valids(47) or valids(48) or valids(49) or valids(50) or valids(51) or valids(52) or valids(53) or valids(54);-- or valids(55) or valids(56) or valids(57) or valids(58) or valids(59);-- or valids(60) or valids(61) or valids(62) or valids(63) or valids(64);-- or valids(65) or valids(66) or valids(67) or valids(68) or valids(69) or valids(70) or valids(71) or valids(72) or valids(73) or valids(74);
        process(valid) is
        begin
            if valid = '1' then
                seedrange <= std_logic_vector(start_inputs(0));
                valid1 <= valid;
            end if;
        end process;
    --valid1 <= testvalid;
end arch;