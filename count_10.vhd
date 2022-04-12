library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity count_10 is
	port(
		CLK:in std_logic;
		count_En:in std_logic;
		CLR:in std_logic;
		qout:out std_logic_vector(3 downto 0);
		CO:out std_logic
);
end entity;

architecture art of count_10 is
	signal temp:std_logic_vector(3 downto 0);
begin
	process(CLK,count_En)
	begin
	if(count_En='0')then
		if(CLR='1')then
				temp<="0000";
		elsif(CLK'event and CLK='1')then
			
			if(temp="1001")then
				temp<="0000";
				CO<='1';
			else
				temp<=temp+'1';
				CO<='0';
			end if;
		end if;
	end if;
	end process;
	qout<=temp;
end art;












