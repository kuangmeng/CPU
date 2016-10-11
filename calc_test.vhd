LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY calc_test IS
END calc_test;
 
ARCHITECTURE behavior OF calc_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT calc
    PORT(
         PCi : IN  std_logic_vector(15 downto 0);
         IRi : IN  std_logic_vector(15 downto 0);
         T1 : IN  std_logic;
         T3 : IN  std_logic;
         Rupdatei : IN  std_logic;
         Raddri : IN  std_logic_vector(2 downto 0);
         Rdatai : IN  std_logic_vector(7 downto 0);
         Addro : OUT  std_logic_vector(15 downto 0);
         ALUo : OUT  std_logic_vector(7 downto 0);
			wr : out std_logic;
			rd : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PCi : std_logic_vector(15 downto 0) := (others => '0');
   signal IRi : std_logic_vector(15 downto 0) := (others => '0');
   signal T1 : std_logic := '0';
   signal T3 : std_logic := '0';
   signal Rupdatei : std_logic := '0';
   signal Raddri : std_logic_vector(2 downto 0) := (others => '0');
   signal Rdatai : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Addro : std_logic_vector(15 downto 0);
   signal ALUo : std_logic_vector(7 downto 0);
	signal wr : std_logic;
   signal rd : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: calc PORT MAP (
          PCi => PCi,
          IRi => IRi,
          T1 => T1,
          T3 => T3,
          Rupdatei => Rupdatei,
          Raddri => Raddri,
          Rdatai => Rdatai,
          Addro => Addro,
          ALUo => ALUo,
			 wr => wr,
			 rd => rd
        );
   
	 process
   begin		
      T1 <= '0';
		T3 <= '0';
		
		wait for 20 ns;
		T1 <= '1';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
		
		wait for 10 ns;
		T1 <= '1';
		T3 <= '0';
		wait for 10 ns;
		T1 <= '0';
		wait for 10 ns;
		T3 <= '1';
      wait;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		PCi <= "0000000000000000"; 
		IRi <= "0100000111011011";     --MVI R1, 11011011
		
		wait for 20 ns;
		Rupdatei <= '1';
		Raddri <= "001";
		Rdatai <= "11011011";
		
		wait for 10 ns;
		Rupdatei <= '0';
		PCi <= "0000000000000001";
		IRi <= "0100001001010101";     --MVI R2, 01010101
		
		wait for 20 ns;
		Rupdatei <= '1';
		Raddri <= "010";
		Rdatai <= "01010101";
		
		wait for 10 ns;
		Rupdatei <= '0';
		PCi <= "0000000000000010";
		IRi <= "0101001100000001";     --MOV R3, R1
		
		wait for 20 ns;
		Rupdatei <= '1';
		Raddri <= "011";
		Rdatai <= "11011011";
		
		wait for 10 ns;
		Rupdatei <= '0';
		PCi <= "0000000000000010";
		IRi <= "0011001000000001";     --ADD R2, R1
		
		wait for 20 ns;
		Rupdatei <= '1';
		Raddri <= "010";
		Rdatai <= "00110000";
		
		wait for 10 ns;
		Rupdatei <= '0';
		PCi <= "0000000000000010";
		IRi <= "0110000100000111";     --STA R1, 07h
		
		wait for 20 ns;
		Rupdatei <= '0';
		
		wait for 10 ns;
		Rupdatei <= '0';
		PCi <= "0000000000000010";
		IRi <= "0111011000000111";     --LDA R6, 07h
		
		wait for 20 ns;
		Rupdatei <= '0';
		
		
      wait;
   end process;

END;
