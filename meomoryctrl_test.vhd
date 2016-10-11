LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY meomoryctrl_test IS
END meomoryctrl_test;
 
ARCHITECTURE behavior OF meomoryctrl_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT meomoryctrl
    PORT(T0 : IN  std_logic;
         T2 : IN  std_logic;
         PCi : IN  std_logic_vector(15 downto 0);
         IRreadi : IN  std_logic;
         Addri : IN  std_logic_vector(15 downto 0);
         ALUOUTi : IN  std_logic_vector(7 downto 0);
         wr : IN  std_logic;
         rd : IN  std_logic;
         IRo : OUT  std_logic_vector(15 downto 0);
         datao : OUT  std_logic_vector(7 downto 0);
         ABUS : OUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         DBUS : INOUT  std_logic_vector(15 downto 0);
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T0 : std_logic := '0';
	signal T2 : std_logic := '0';
   signal PCi : std_logic_vector(15 downto 0) := (others => '0');
   signal IRreadi : std_logic := '0';
   signal Addri : std_logic_vector(15 downto 0) := (others => '0');
   signal ALUOUTi : std_logic_vector(7 downto 0) := (others => '0');
   signal wr : std_logic := '1';
   signal rd : std_logic := '1';

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);

 	--Outputs
   signal IRo : std_logic_vector(15 downto 0);
   signal datao : std_logic_vector(7 downto 0);
   signal ABUS : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: meomoryctrl PORT MAP (
          T0 => T0,
			 T2 => T2,
          PCi => PCi,
          IRreadi => IRreadi,
          Addri => Addri,
          ALUOUTi => ALUOUTi,
          wr => wr,
          rd => rd,
          IRo => IRo,
          datao => datao,
          ABUS => ABUS,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          DBUS => DBUS,
          nBHE => nBHE,
          nBLE => nBLE
        );

   -- Clock process definitions
   process
   begin
		wait for 20 ns;
			T2 <= '1';
		wait for 10 ns;
			T2 <= '0';
		wait for 30 ns;
			T2 <= '1';
		wait for 10 ns;
			T2 <= '0';
		wait for 30 ns;
			T2 <= '1';
		wait for 10 ns;
			T2 <= '0';
		wait for 30 ns;
			T2 <= '1';
		wait for 10 ns;
			T2 <= '0';
		wait for 30 ns;
			T2 <= '1';
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
			IRreadi <= '1';
			PCi <= "0000101000001111";
		
		wait for 10 ns;
			IRreadi <= '0';
      wait for 10 ns;
			Addri <= "0101000001011111";
			ALUOUTi <= "10111101";
			wr <= '0';
			rd <= '1';
		
		wait for 20 ns;
			IRreadi <= '1';
			PCi <= "0000101000010000";
		wait for 10 ns;
			IRreadi <= '0';
      wait for 10 ns;
			Addri <= "0101000001100000";
			--ALUOUTi <= "10111101";
			wr <= '1';
			rd <= '0';
			

      wait;
   end process;

END;
