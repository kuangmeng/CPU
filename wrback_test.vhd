--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:28:14 07/11/2014
-- Design Name:   
-- Module Name:   F:/design_homework/cpu/wrback_test.vhd
-- Project Name:  cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wrback
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY wrback_test IS
END wrback_test;
 
ARCHITECTURE behavior OF wrback_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wrback
    PORT(
         T3 : IN  std_logic;
         Addri : IN  std_logic_vector(15 downto 0);
         AlUOUTi : IN  std_logic_vector(7 downto 0);
         Rtempi : IN  std_logic_vector(7 downto 0);
         IRi : IN  std_logic_vector(15 downto 0);
         Rupdateo : OUT  std_logic;
         Raddro : OUT  std_logic_vector(2 downto 0);
         Rdatao : OUT  std_logic_vector(7 downto 0);
         PCupdateo : OUT  std_logic;
         PCnewo : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal T3 : std_logic := '0';
   signal Addri : std_logic_vector(15 downto 0) := (others => '0');
   signal AlUOUTi : std_logic_vector(7 downto 0) := (others => '0');
   signal Rtempi : std_logic_vector(7 downto 0) := (others => '0');
   signal IRi : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Rupdateo : std_logic;
   signal Raddro : std_logic_vector(2 downto 0);
   signal Rdatao : std_logic_vector(7 downto 0);
   signal PCupdateo : std_logic;
   signal PCnewo : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wrback PORT MAP (
          T3 => T3,
          Addri => Addri,
          AlUOUTi => AlUOUTi,
          Rtempi => Rtempi,
          IRi => IRi,
          Rupdateo => Rupdateo,
          Raddro => Raddro,
          Rdatao => Rdatao,
          PCupdateo => PCupdateo,
          PCnewo => PCnewo
        );

  
   process
   begin
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
		wait for 30 ns;
		T3 <= '1';
		wait for 10 ns;
		T3 <= '0';
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 30 ns;
		IRi <= "0000000000001010";
		Addri <= "0000000000001010";
		ALUOUTi <= "00001100";
		
		wait for 40 ns;
		IRi <= "0001000000001010";
		Addri <= "0000000000001010";
		ALUOUTi <= "00000000";
		
		wait for 40 ns;
		IRi <= "0001000000001010";
		Addri <= "0000000000001010";
		ALUOUTi <= "00000001";
		
		wait for 40 ns;
		IRi <= "0010000100000010";
		ALUOUTi <= "00001000";
		
		wait for 40 ns;
		IRi <= "0111000100011010";
		ALUOUTi <= "00001100";
		Rtempi <= "11110000";
		

      wait;
   end process;

END;
