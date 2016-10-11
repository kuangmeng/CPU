LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY cpu_test IS
END cpu_test;
 
ARCHITECTURE behavior OF cpu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         ABUS : OUT  std_logic_vector(15 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         S0 : OUT  std_logic_vector(7 downto 0);
         S1 : OUT  std_logic_vector(7 downto 0);
			S3 : OUT  std_logic_vector(7 downto 0);
         S4 : OUT  std_logic_vector(7 downto 0);
         B0 : OUT  std_logic;
         B1 : OUT  std_logic;
         B2 : OUT  std_logic;
         B3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '1';
   signal CLK : std_logic := '0';

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal S0 : std_logic_vector(7 downto 0);
   signal S1 : std_logic_vector(7 downto 0);
	signal S3 : std_logic_vector(7 downto 0);
   signal S4 : std_logic_vector(7 downto 0);
   signal B0 : std_logic;
   signal B1 : std_logic;
   signal B2 : std_logic;
   signal B3 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu PORT MAP (
          RST => RST,
          CLK => CLK,
          ABUS => ABUS,
          DBUS => DBUS,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          S0 => S0,
          S1 => S1,
			 S3 => S3,
          S4 => S4,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5 ns;
		RST <= '0';
		DBUS <= x"4202";              --mvi   r2, 02h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"6220";              --sta   r2, 0020h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"73a0";              --lda   r3, [00a0h]
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"6321";              --sta   r3, 0021h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"5403";              --mov   r4, r3
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"6422";              --sta   r4, 0022h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"3203";              --add   r2, r3
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"6223";              --sta   r2, 0023h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"83e1";              --out   r3, 00e1h     
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"96e2";              --in    r6, [00e2h]
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"86f0";              --out   r6, 00f0h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"0003";              --jmp    0003h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
		wait for 30 ns;
		DBUS <= x"1102";              --jz    r1, 0002h
		wait for 10 ns;
		DBUS <= "ZZZZZZZZZZZZZZZZ";
		
      wait;
   end process;

END;
