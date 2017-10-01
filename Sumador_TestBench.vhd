--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:53 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/GEORGE/Documents/Procesador/Procesador/Sumador_TestBench.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador
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
 
ENTITY Sumador_TestBench IS
END Sumador_TestBench;
 
ARCHITECTURE behavior OF Sumador_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         A_in : IN  std_logic_vector(31 downto 0);
         B_in : IN  std_logic_vector(31 downto 0);
         Resultsuma_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_in : std_logic_vector(31 downto 0) := (others => '0');
   signal B_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Resultsuma_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          A_in => A_in,
          B_in => B_in,
          Resultsuma_out => Resultsuma_out
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

		A_in <= x"00000001";
		B_in <= x"00000002";
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A_in <= x"00000002";
		B_in <= x"00000002";
		wait for 10 ns;
		A_in <= x"00000008";
		B_in <= x"00000002";
		wait for 10 ns;
		A_in <= x"00000004";
		B_in <= x"00000002";

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
