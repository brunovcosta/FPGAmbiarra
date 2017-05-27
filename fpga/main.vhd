----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:00 05/27/2017 
-- Design Name: 
-- Module Name:    main - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
	Port(
		SWITCH : in std_logic_vector(3 downto 0);
		BOTAO : in std_logic_vector(3 downto 0);
		LED : out std_logic_vector(3 downto 0);
		HDR : out std_logic_vector(3 downto 0)
	);
end main;

architecture Main of main is 
begin

LED <= BOTAO xor SWITCH;
HDR <= BOTAO xor SWITCH;

end Main;

