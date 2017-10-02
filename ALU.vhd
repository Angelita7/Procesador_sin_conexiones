----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:42 10/01/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( salida_UC : in  STD_LOGIC_VECTOR (5 downto 0);
           contenido_r1 : in  STD_LOGIC_VECTOR (31 downto 0);
           contenido_r2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_ALU : out  STD_LOGIC_VECTOR (32 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	process(salida_UC,contenido_r1)
  begin
	   case (salida_UC) is
		   when "000000" => -- ADD
				salida_ALU <= contenido_r1 + contenido_r2;
			when "000001" => -- AND
				salida_ALU <= contenido_r1 and contenido_r2;
			when "000010" => -- OR
				salida_ALU <= contenido_r1 or contenido_r2;
			when "000011" => -- XOR
				salida_ALU <= contenido_r1 xor contenido_r2;
			when "000100" => -- SUB
				salida_ALU <= contenido_r1 - contenido_r2;
			when "000101" => -- ANDN
				salida_ALU <= contenido_r1 nand contenido_r2;
			when "000110" => -- ORN
				salida_ALU <= contenido_r1 nor contenido_r2;
			when "000111" => -- XORN
				salida_ALU <= contenido_r1 xnor contenido_r2;
			when others => 
				salida_ALU <= (others=>'0');
		end case;
  end process;

end Behavioral;

