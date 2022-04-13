library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity med_total is
	port(CLK_1:in std_logic;
	CLR:in std_logic;
	beginButton1:in std_logic;
	count_EN:in std_logic;
	total:out std_logic_vector(11 downto 0));
end entity;

architecture art of med_total is
	component count_10 is
	port(
		CLK:in std_logic;
		count_En:in std_logic;
		CLR:in std_logic;
		qout:out std_logic_vector(3 downto 0);
		CO:out std_logic
	);
	end component count_10; 

	signal count_ones:std_logic_vector(3 downto 0);
	signal count_tens:std_logic_vector(3 downto 0);
	signal count_hundreds:std_logic_vector(3 downto 0);
	signal CO_ones:std_logic;
	signal CO_tens:std_logic;
	signal CO_hundreds:std_logic;
	signal start:std_logic;
	signal CLK_in:std_logic;
begin
	process(beginButton1)
	begin
		if(beginButton1'event and beginButton1='1')then
			if(start='0')then
				start<='1';
			else
				start<='0';
			end if;
		end if;
	end process;
	CLK_in<=start and CLK_1;
	A1:count_10 port map(CLK=>CLK_in,count_En=>count_EN,CLR=>CLR,qout=>count_ones,CO=>CO_ones);
	A2:count_10 port map(CLK=>CO_ones,count_En=>count_EN,CLR=>CLR,qout=>count_tens,CO=>CO_tens);
	A3:count_10 port map(CLK=>CO_tens,count_En=>count_EN,CLR=>CLR,qout=>count_hundreds,CO=>CO_hundreds);
	total(3 downto 0)<=count_ones;
	total(7 downto 4)<=count_tens;
	total(11 downto 8)<=count_hundreds;
end art;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

