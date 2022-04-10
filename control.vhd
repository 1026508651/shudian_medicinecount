library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity control is
	port(
		CLK_1:in std_logic;
		bottle_judge:in std_logic;
		red:out std_logic;
		green:out std_logic;
		blick:out std_logic;
		count_EN:out std_logic
	);
end control;

architecture art of control is
begin
	process(bottle_judge,CLK_1)
	begin
		if(bottle_judge='0')then
			count_EN<='0';
			red<='1';
			blick<=CLK_1;
			green<='0';
		else
			count_EN<='1';
			red<='0';
			blick<='0';
			green<='1';
		end if;
	end process;		
end art;
