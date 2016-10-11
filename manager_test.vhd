--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:18:17 07/11/2014
-- Design Name:   
-- Module Name:   F:/design_homework/cpu/manager_test.vhd
-- Project Name:  cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: manager
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
 
ENTITY manager_test IS
END manager_test;
 
ARCHITECTURE behavior OF manager_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT manager
    PORT(
         T2 : IN  std_logic;
         IRi : IN  std_logic_vector(15 downto 0);
         datai : IN  std_logic_vector(7 downto 0);
         Rtempo : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal T2 : std_logic := '0';
   signal IRi : std_logic_vector(15 downto 0) := (others => '0');
   signal datai : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Rtempo : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: manager PORT MAP (
          T2 => T2,
          IRi => IRi,
          datai => datai,
          Rtempo => Rtempo
        );
	
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
		
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
     wait for 20 ns;
	  IRi <= "0110000101010101";
	  
	  wait for 40 ns;
	  IRi <= "0111001000001111";
	  wait for 5 ns;
	  datai <= "10101010";
	  
	  wait for 35 ns;
	  IRi <= "1001001111110000";
	  wait for 5 ns;
	  datai <= "11111111";
	  
	  wait for 35 ns;
	  IRi <= "0010001111110000";
      

      wait;
   end process;

END;
