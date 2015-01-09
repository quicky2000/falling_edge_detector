--
--    This file is part of falling edge_detector
--    Copyright (C) 2011  Julien Thevenon ( julien_thevenon at yahoo.fr )
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>
--
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

