----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:47 10/01/2017 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
    Port ( rsd1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rsd2 : in  STD_LOGIC_VECTOR (4 downto 0);
           salida_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           contenido_r1 : out  STD_LOGIC_VECTOR (31 downto 0);
           contenido_r2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram_type := (others => x"00000000");

begin
   
	process(reset,rsd1,rsd2,rd,salida_alu)
	begin
	   
		if(reset = '1')then
			contenido_r1 <= (others=>'0');
			contenido_r2 <= (others=>'0');
			registers <= (others => x"00000000");
		else
			contenido_r1 <= registers(conv_integer(rsd1));
			contenido_r2 <= registers(conv_integer(rsd2));
			if (rd /= "00000") then 
			   registers (conv_integer(rd)) <= salida_alu;
			end if;
		end if;
	end process;

end Behavioral;

