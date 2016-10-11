library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           T0 : out  STD_LOGIC;
           T1 : out  STD_LOGIC;
           T2 : out  STD_LOGIC;
           T3 : out  STD_LOGIC);
end clock;

architecture Behavioral of clock is
	type state is(state0, state1, state2, state3, state4);
	signal pr_state, nx_state:   state;
	signal t:   std_logic_vector(3 downto 0);
begin
	shixu:process(RST, CLK)
	begin
		if(RST = '1')then
			pr_state <= state0;
		elsif(CLK'event and CLK = '1')then
			pr_state <= nx_state;
		end if;
	end process;
	
	zuhe:process(pr_state)
	begin
		case pr_state is
			when state0 => t <= "0000";
								nx_state <= state1;
			when state1 => t <= "1000";
								nx_state <= state2;
			when state2 => t <= "0100";
								nx_state <= state3;
			when state3 => t <= "0010";
								nx_state <= state4;
			when state4 => t <= "0001";
								nx_state <= state1;
		end case;
	end process;

	T0 <= t(3);
	T1 <= t(2);
	T2 <= t(1);
	T3 <= t(0);
end Behavioral;

