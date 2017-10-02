--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:48:21 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Documents/Procesador/Procesador/ALU_testBench.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_testBench IS
END ALU_testBench;
 
ARCHITECTURE behavior OF ALU_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         salida_UC : IN  std_logic_vector(5 downto 0);
         contenido_r1 : IN  std_logic_vector(31 downto 0);
         contenido_r2 : IN  std_logic_vector(31 downto 0);
         salida_ALU : OUT  std_logic_vector(32 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal salida_UC : std_logic_vector(5 downto 0) := (others => '0');
   signal contenido_r1 : std_logic_vector(31 downto 0) := (others => '0');
   signal contenido_r2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida_ALU : std_logic_vector(32 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          salida_UC => salida_UC,
          contenido_r1 => contenido_r1,
          contenido_r2 => contenido_r2,
          salida_ALU => salida_ALU
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--<clock> <= '0';
	--wait for <clock>_period/2;
	--<clock> <= '1';
	--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      contenido_r1 <= X"00000002";
		contenido_r2 <= X"00000003";
	   salida_UC <= "000000";
		wait for 100 ns;
		
		contenido_r1 <= X"00000002";
		contenido_r2 <= X"00000003";
	   salida_UC <= "000001";
		wait for 100 ns;
      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
