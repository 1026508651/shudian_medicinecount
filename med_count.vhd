library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity med_count is
	port(
		CLK_0:in std_logic;
		CLR: in std_logic;
		beginButton1:in std_logic;
		max_each:in std_logic_vector(7 downto 0);
		MAX: in std_logic_vector(7 downto 0);
		total1: out std_logic_vector(3 downto 0);
		total2: out std_logic_vector(3 downto 0);
		total3: out std_logic_vector(3 downto 0);
		red:out std_logic;
		green:out std_logic;
		blick: out std_logic;
		bottle1: out std_logic_vector(3 downto 0);
		bottle2: out std_logic_vector(3 downto 0);
		each1: out std_logic_vector(3 downto 0);
		each2: out std_logic_vector(3 downto 0)
	);
end med_count;

architecture main of med_count is
component time_trans is
port(CLK_0:in std_logic;
	CLK_1:out std_logic
	);
end component;
component med_total is
	port(CLK_1:in std_logic;
	CLR:in std_logic;
	beginButton1:in std_logic;
	count_EN:in std_logic;
	total:out std_logic_vector(11 downto 0));
end component;
component control is
	port(CLK_1:in std_logic;
		bottle_judge:in std_logic;
		red:out std_logic;
		green:out std_logic;
		blick:out std_logic;
		count_EN:out std_logic
	);
end component;
component each_one is
	port(
		CLK_1:in std_logic;
		CLR:in std_logic;
		beginButton1:in std_logic;
		count_EN:in std_logic;
		max_each:in std_logic_vector(7 downto 0);
		each:out std_logic_vector(7 downto 0);
		Cout1:out std_logic
	);
end component;
component bottle_count is
	port(
		Cout1:in std_logic;
		MAX:in std_logic_vector(7 downto 0);
		bottle:out std_logic_vector(7 downto 0);
		bottle_judge:out std_logic
	);
end component;
signal CLK_1:std_logic;
signal count_EN:std_logic;
signal TOTAL:std_logic_vector(11 downto 0);
signal bottle_judge:std_logic;
signal EACH:std_logic_vector(7 downto 0);
signal Cout1:std_logic;
signal BOTTLE:std_logic_vector(7 downto 0);
begin
	A1:time_trans port map(CLK_0=>CLK_0,CLK_1=>CLK_1);
	A2:med_total port map(CLK_1=>CLK_1,CLR=>CLR,beginButton1=>beginButton1,count_EN=>count_EN,total=>TOTAL);
	total1<=TOTAL(3 downto 0);
	total2<=TOTAL(7 downto 4);
	total3<=TOTAL(11 downto 8);
	
	A3:control port map(CLK_1=>CLK_1,bottle_judge=>bottle_judge,red=>red,green=>green,blick=>blick,count_EN=>count_EN);
	A4:each_one port map(CLK_1=>CLK_1,CLR=>CLR,beginButton1=>beginButton1,count_EN=>count_EN,max_each=>max_each,each=>EACH,Cout1=>Cout1);
	each1<=EACH(3 downto 0);
	each2<=EACH(7 downto 4);
	A5:bottle_count port map(Cout1=>Cout1,MAX=>MAX,bottle=>BOTTLE,bottle_judge=>bottle_judge);
	bottle1<=BOTTLE(3 downto 0);
	bottle2<=BOTTLE(7 downto 4);
end main;

