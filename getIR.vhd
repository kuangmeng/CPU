library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity getIR is
    Port ( RST: in STD_LOGIC;
			  clk: in std_logic;
			  T0: in STD_LOGIC;
			  T3: in STD_LOGIC;
			  IRi : in  STD_LOGIC_VECTOR (15 downto 0);
           PCupdatei : in  STD_LOGIC;
           PCnewi : in  STD_LOGIC_VECTOR (15 downto 0);
           PCo : out  STD_LOGIC_VECTOR (15 downto 0);
           IRreado : out  STD_LOGIC;
           IRo : out  STD_LOGIC_VECTOR (15 downto 0));
end getIR;

architecture Behavioral of getIR is
	signal PC, IR :   std_logic_vector(15 downto 0);
begin
	PCo <= PC;
	
	dealIRreado:process(T0, RST)
	begin
		if RST = '1' then
			IRreado <= '0';
		else
			IRreado <= T0;
		end if;
	end process;
	
	readIR: process(T0, clk)
	begin
		if (T0 = '1' and clk = '1') then
			IR <= IRi;
		end if;
	end process;
	IRo <= IR;
	dealPC: process(T3, RST, PCupdatei, PCnewi)
	begin
		if RST='1' then
			PC <= "0000000000000000";
		elsif PCupdatei = '1' then
			PC <= PCnewi;
		elsif (T3 = '0' and T3'event) then
			PC <= PC + 1;
		end if;
	end process;

end Behavioral;

