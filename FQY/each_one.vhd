library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity each_one is
	port(
		CLK_1:in std_logic;
		CLR:in std_logic;
		beginButton1:in std_logic;
		count_EN:in std_logic;
		max_each:in std_logic_vector(7 downto 0);
		each:out std_logic_vector(7 downto 0);
		Cout1:out std_logic
	);
end each_one;

architecture main of each_one is
signal temp_one,temp_ten:std_logic_vector(3 downto 0);
begin
	process(CLK_1,CLR,beginButton1,count_EN)
	begin
		if(count_EN='1')then
			if(CLR='0')then
				temp_one<="0000";
				temp_ten<="0000";
			elsif(CLK_1'event and CLK_1='1'and beginButton1='1' )then
				if(temp_ten&temp_one=(max_each))then
					Cout1<='1';
					temp_one<="0000";
					temp_ten<="0000";
				elsif(temp_ten&temp_one<(max_each))then
					if(temp_one="1001")then
						temp_ten<=temp_ten+1;
						temp_one<="0000";
						Cout1<='0';
					else
						temp_one<=temp_one+1;
						Cout1<='0';
					end if;
				end if;
			end if;
		end if;
	end process;
	each<=temp_ten&temp_one;
end main;