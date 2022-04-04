library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity bottle_count is
	port(
		Cout1:in std_logic;
		MAX:in std_logic_vector(7 downto 0);
		bottle:out std_logic_vector(7 downto 0);
		bottle_judge:out std_logic
	);
end bottle_count;

architecture main of bottle_count is
	signal temp:std_logic_vector(7 downto 0);
	begin
	process(Cout1)
	begin
		if(Cout1'event and Cout1='1')then
			if(temp(3 downto 0)="1001")then
				temp<=temp+6;
			else
				temp<=temp+1;
			end if;
		end if;
	end process;
	bottle<=temp;
	bottle_judge<='1' when temp>MAX else
				  '0';
end main;