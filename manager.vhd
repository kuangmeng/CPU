library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity manager is
    Port ( T2 : in  STD_LOGIC;
           IRi : in  STD_LOGIC_VECTOR(15 downto 0);
           datai : in  STD_LOGIC_VECTOR (7 downto 0);
           Rtempo : out  STD_LOGIC_VECTOR (7 downto 0));
end manager;

architecture Behavioral of manager is

begin
	
	process(T2, IRi, datai)
	begin
		if T2 = '1' then
			if IRi(15 downto 11) = "01110" then  --LDA
				Rtempo <= datai;
			elsif IRi(15 downto 11) = "10010" then   --IN
				Rtempo <= datai;
			end if;
		end if;
	end process;

end Behavioral;

