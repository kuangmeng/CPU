library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity calc is
    Port ( --RST: in STD_LOGIC;
			  PCi : in  STD_LOGIC_VECTOR (15 downto 0);
           IRi : in  STD_LOGIC_VECTOR (15 downto 0);
           T1 : in  STD_LOGIC;
           T3 : in  STD_LOGIC;
			  Rupdatei: in STD_LOGIC;
			  Raddri: in STD_LOGIC_VECTOR (2 downto 0);
			  Rdatai: in STD_LOGIC_VECTOR (7 downto 0);
           Addro : out  STD_LOGIC_VECTOR (15 downto 0);
           ALUo : out  STD_LOGIC_VECTOR (7 downto 0);
			  wr : out std_logic;
			  rd : out std_logic);
end calc;

architecture Behavioral of calc is
	type reg_array is array(7 downto 0) of std_logic_vector(7 downto 0);
	signal regs : reg_array := (others => (others => '0'));

begin

	dealIR:process(T1, regs, IRi, PCi)
	begin
		if T1 = '1' then
			wr <= '1';
		   rd <= '1';
			Addro <= regs(7) & IRi(7 downto 0);
			if IRi(15 downto 11) = "00000" then   ----JMP
				Addro <= (regs(7)&IRi(7 downto 0)) + PCi;
			elsif IRi(15 downto 11) = "00010" then   ----JZ
				Addro <= (regs(7)&IRi(7 downto 0)) + PCi;
				ALUo <= regs(conv_integer(IRi(10 downto 8)));
			elsif IRi(15 downto 11) = "00100" then   ----SUB
				ALUo <= regs(conv_integer(IRi(10 downto 8))) - regs(conv_integer(IRi(2 downto 0)));
			elsif IRi(15 downto 11) = "00110" then   ----ADD
				ALUo <= regs(conv_integer(IRi(10 downto 8))) + regs(conv_integer(IRi(2 downto 0)));
			elsif IRi(15 downto 11) = "01000" then   ----MVI
				ALUo <= IRi(7 downto 0);	
			elsif IRi(15 downto 11) = "01010" then   ----MOV
				ALUo <= regs(conv_integer(IRi(2 downto 0)));
			elsif IRi(15 downto 11) = "01100" then   ----STA
				ALUo <= regs(conv_integer(IRi(10 downto 8)));
				wr <= '0';
				rd <= '1';
			elsif IRi(15 downto 11) = "01110" then  --LDA
				wr <= '1';
				rd <= '0';
			elsif IRi(15 downto 11) = "10000" then   --OUT
				ALUo <= regs(conv_integer(IRi(10 downto 8)));
				wr <= '0';
				rd <= '1';
			elsif IRi(15 downto 11) = "10010" then   --IN
				wr <= '1';
				rd <= '0';
			end if;		
		end if;
	end process;
	
	writeback:process (T3, Rupdatei, Raddri, Rdatai)
	begin
	if (Rupdatei = '1' and T3 = '1') then
		regs(conv_integer(Raddri)) <= Rdatai;
		
	else NULL;
	end if;
	end process;

end Behavioral;

