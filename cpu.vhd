-----------------------------------------cpu-----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           nMREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC;
			  S0, S1, S3, S4 : OUT STD_LOGIC_VECTOR(7 downto 0);
			  B0, B1, B2, B3 : OUT STD_LOGIC);
end cpu;

architecture Behavioral of cpu is

	component clock is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           T0 : out  STD_LOGIC;
           T1 : out  STD_LOGIC;
           T2 : out  STD_LOGIC;
           T3 : out  STD_LOGIC);
   end component;
	
	component getIR is
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
	end component;
	
	component calc is
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
    end component;
	 
	 component manager is
    Port ( T2 : in  STD_LOGIC;
           IRi : in  STD_LOGIC_VECTOR(15 downto 0);
           datai : in  STD_LOGIC_VECTOR (7 downto 0);
           Rtempo : out  STD_LOGIC_VECTOR (7 downto 0)
           );
	 end component;
	 
	 component wrback is
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
	 end component;
	 
	 component meomoryctrl is
    Port ( T2: STD_LOGIC;
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
	end component;
	
	signal  T0, T1, T2, T3, PCupdate, Rupdate, IRread, wr, rd: std_logic;
	signal  Raddr: std_logic_vector(2 downto 0);
	signal  IR1, IR2, PC, PCnew, Addr: std_logic_vector(15 downto 0);
	signal  ALUOUT, Rtemp, data, Rdata : std_logic_vector(7 downto 0);
begin
	S1 <= IR2(15 downto 8);
	S0 <= IR2(7 downto 0);
	S3 <= DBUS(7 downto 0);
	S4 <= DBUS(15 downto 8);
	B0 <= T0;
	B1 <= T1;
	B2 <= T2;
	B3 <= T3;
	u1: clock port map(RST, CLK, T0, T1, T2, T3);
	u2: getIR port map(RST, clk, T0, T3, IR1, PCupdate, PCnew, PC, IRread, IR2);
	u3: calc  port map(PC, IR2, T1, T3, Rupdate, Raddr, Rdata, Addr, ALUOUT, wr, rd);
	u4: manager port map(T2, IR2, data, Rtemp);
	u5: wrback port map(T3, Addr, AlUOUT, Rtemp, IR2, Rupdate, Raddr, Rdata, PCupdate, PCnew);
	u6: meomoryctrl port map(T2, PC, IRread, Addr, ALUOUT, wr, rd, IR1, data, 
										ABUS, nMREQ, nRD, nWR, DBUS, nBHE, nBLE);
end Behavioral;

