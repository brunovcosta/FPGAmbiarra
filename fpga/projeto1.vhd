----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:08 05/25/2017 
-- Design Name: 
-- Module Name:    threeInputThreeOutput - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter is
	Port ( CLOCK : in STD_LOGIC;
		DIRECTION : in STD_LOGIC;
		COUNT_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end counter;


architecture Behavioral of counter is
	signal count_int : std_logic_vector(3 downto 0) := "0000";
begin
process (CLOCK)
begin
	if CLOCK='1' and CLOCK'event then
			count_int <= count_int + 1;
			count_int <= count_int - 1;
	end if;
end process;
COUNT_OUT <= count_int;
end Behavioral;
