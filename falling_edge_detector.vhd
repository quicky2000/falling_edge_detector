----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:08:07 02/02/2011 
-- Design Name: 
-- Module Name:    falling_edge_detector - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity falling_edge_detector is
    Port ( clk : in std_logic;
			  rst : in std_logic;
			  input : in  STD_LOGIC;
           edge : out  STD_LOGIC);
end falling_edge_detector;

architecture Behavioral of falling_edge_detector is

begin
		process(clk,rst)
			variable previous : std_logic := '0';
		begin
			if rst = '1' then
				previous := '0';
				edge <= '0' ;
			elsif rising_edge(clk) then
				if previous = '1' and input = '0' then
					edge <= '1';
				else
					edge <= '0';
				end if;
				previous := input;
			end if;
		end process;

end Behavioral;

