LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY getIR_test IS
END getIR_test;
 
ARCHITECTURE behavior OF getIR_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT getIR
    PORT(
         RST : IN  std_logic;
         T0 : IN  std_logic;
         T3 : IN  std_logic;
         IRi : IN  std_logic_vector(15 downto 0);
         PCupdatei : IN  std_logic;
         PCnewi : IN  std_logic_vector(15 downto 0);
         PCo : OUT  std_logic_vector(15 downto 0);
         IRreado : OUT  std_logic;
         IRo : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal T0 : std_logic := '0';
   signal T3 : std_logic := '0';
   signal IRi : std_logic_vector(15 downto 0) := (others => '0');
   signal PCupdatei : std_logic := '0';
   signal PCnewi : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal PCo : std_logic_vector(15 downto 0);
   signal IRreado : std_logic;
   signal IRo : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: getIR PORT MAP (
          RST => RST,
          T0 => T0,
          T3 => T3,
          IRi => IRi,
          PCupdatei => PCupdatei,
          PCnewi => PCnewi,
          PCo => PCo,
          IRreado => IRreado,
          IRo => IRo
        );

   process
   begin		
      T0 <= '0';
		T3 <= '0';
		
		wait for 20 ns;
		T0 <= '1';
		wait for 10 ns;
		T0 <= '0';
		wait for 20 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T0 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T0 <= '0';
		wait for 20 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T0 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T0 <= '0';
		wait for 20 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T0 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T0 <= '0';
		wait for 20 ns;
		T3 <= '1';
      wait;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
	
      wait for 10 ns;
		RST <= '1';
      wait for 10 ns;
		IRi <= "0001100010000001";
		
		wait for 30 ns;
		PCupdatei <= '0';
		
		wait for 10 ns;
		IRi <= "1111111111111111";
		
		wait for 30 ns;
		PCupdatei <= '1';
		PCnewi <= "0000000110101011";
		
		wait for 10 ns;
		IRi <= "1110000011111111";
		
		wait for 30 ns;
		PCupdatei <= '0';
      wait;
   end process;

END;
