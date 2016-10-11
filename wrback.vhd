library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity wrback is
    Port ( T3: in STD_LOGIC;
			  Addri : in  STD_LOGIC_VECTOR (15 downto 0);
           AlUOUTi : in  STD_LOGIC_VECTOR (7 downto 0);
           Rtempi : in  STD_LOGIC_VECTOR (7 downto 0);
           IRi : in  STD_LOGIC_VECTOR (15 downto 0);
           Rupdateo : out  STD_LOGIC;
           Raddro : out  STD_LOGIC_VECTOR (2 downto 0);
           Rdatao : out  STD_LOGIC_VECTOR (7 downto 0);
           PCupdateo : out  STD_LOGIC;
           PCnewo : out  STD_LOGIC_VECTOR (15 downto 0));
end wrback;

architecture Behavioral of wrback is

begin
	wrPC:process(T3, IRi, ALUOUTi)
	begin
		if T3 = '1' then
			PCnewo <= Addri;
			if IRi(15 downto 11) = "00000" then      --JMP
				PCupdateo <= '1';
			elsif IRi(15 downto 11) = "00010" then   --JZ
				if ALUOUTi = "00000000" then
					PCupdateo <= '1';
				else
					PCupdateo <= '0';
				end if;
			else
				PCupdateo <= '0';
			end if;
		end if;
	end process;
	
	wrR:process(T3, IRi, ALUOUTi, Rtempi)
	begin
	   if T3 = '1' then
			Rdatao <= ALUOUTi;
			Raddro <= IRi(10 downto 8);
			if IRi(15 downto 11) = "00100" then     --SUB
				Rupdateo <= '1';
			elsif IRi(15 downto 11) = "00110" then  --ADD
				Rupdateo <= '1';
			elsif IRi(15 downto 11) = "01000" then  --MVI
				Rupdateo <= '1';
			elsif IRi(15 downto 11) = "01010" then  --MOV
				Rupdateo <= '1';
			elsif IRi(15 downto 11) = "01110" then  --LDA
				Rupdateo <= '1';
				Rdatao <= Rtempi;
			elsif IRi(15 downto 11) = "10010" then  --IN
				Rupdateo <= '1';
				Rdatao <= Rtempi;
			else
				Rupdateo <= '0';
			end if;
		end if;
	end process;

end Behavioral;

