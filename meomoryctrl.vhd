library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity meomoryctrl is
    Port ( T2 : in STD_LOGIC;
			  PCi : in  STD_LOGIC_VECTOR (15 downto 0);
           IRreadi : in  STD_LOGIC;
           Addri : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUOUTi : in  STD_LOGIC_VECTOR (7 downto 0);
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC;
           IRo : out  STD_LOGIC_VECTOR (15 downto 0);
           datao : out  STD_LOGIC_VECTOR (7 downto 0);
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           nMREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC);
end meomoryctrl;

architecture Behavioral of meomoryctrl is

begin
	datao <= DBUS(7 downto 0);
	--IRo <= "1111111111111111";
	process(T2, PCi, IRreadi, Addri, ALUOUTi, wr, rd, DBUS)
	begin
		nMREQ <= '1';
		nRD <= '1';
		nWR <= '1';
		nBHE <= '1';
		nBLE <= '1';
		if(IRreadi = '1')then
			ABUS <= PCi;
			nMREQ <= '0';
			nRD <= '0';
			nWR <= '1';
			nBHE <= '0';
			nBLE <= '0';
			IRo <= DBUS ;
			DBUS <= (others => 'Z');
		elsif(T2 = '1')then
			ABUS <= Addri;
			nMREQ <= '0';
			nRD <= rd;
			nWR <= wr;
			nBHE <= '1';
			nBLE <= '0';
			if wr = '0' and rd = '1' then DBUS <= "00000000" & ALUOUTi;
			else DBUS <= (others => 'Z');
			end if;			
		end if;	
		
	end process;

end Behavioral;

