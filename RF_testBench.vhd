--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:55:36 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Documents/Procesador/Procesador/RF_testBench.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY RF_testBench IS
END RF_testBench;
 
ARCHITECTURE behavior OF RF_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         rsd1 : IN  std_logic_vector(4 downto 0);
         rsd2 : IN  std_logic_vector(4 downto 0);
         salida_alu : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         rd : IN  std_logic_vector(4 downto 0);
         contenido_r1 : OUT  std_logic_vector(31 downto 0);
         contenido_r2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rsd1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rsd2 : std_logic_vector(4 downto 0) := (others => '0');
   signal salida_alu : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal rd : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal contenido_r1 : std_logic_vector(31 downto 0);
   signal contenido_r2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          rsd1 => rsd1,
          rsd2 => rsd2,
          salida_alu => salida_alu,
          reset => reset,
          rd => rd,
          contenido_r1 => contenido_r1,
          contenido_r2 => contenido_r2
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

			reset <= '1';
			
      -- hold reset state for 100 ns.
      wait for 100 ns;

		rsd1 <="00001";
      rsd2 <="00010";
		rd <="00001";
		salida_alu <= X"00000000";
		wait for 100 ns;
		
		rsd1 <="00001";
      rsd2 <="00010";
		rd <="00001";
		salida_alu <= X"00000004";
		wait for 100 ns;

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
