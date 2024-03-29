library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Memoir_tb is
end  entity;

Architecture testbench of Memoir_tb is 
  signal Clk: std_logic;
	signal DataIn: std_logic_vector(31 downto 0);  	--bus donn�e en ecriture
	signal DataOut: std_logic_vector(31 downto 0); 	--bus donn�e en lecture
	signal Addr: std_logic_vector(5 downto 0);		--bus d'adresses en lecture et �criture 
	signal WrEN: std_logic;				--Write enable

begin
  
  Clock: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
  end process;
  
simulate:process
begin
  DataIn <= Std_logic_vector(To_signed(500,32));    
  Addr <= "000000";     --DataOut=Ram(0)
  WrEn <= '0'; 
  wait for 5 ns;  
  WrEn <= '1';          --Ram(0)=DataIn
  wait for 5 ns;
  WrEn <= '0';
  Addr <= "011000";     --DataOut=Ram(24)
  wait for 5 ns;
  WrEn <= '1';          --Ram(24)=DataIn
  wait for 5 ns;
  WrEn <= '0';
  wait for 5 ns;
  Addr <= "001000";     
  WrEn <= '1';          --Ram(8)=DataIn
  wait for 5 ns;
  wait;

end process;

UUT:Entity work.Memoir port map(Clk=>Clk ,DataIn=>DataIn ,DataOut=>DataOut ,Addr=>Addr ,WrEn=>WrEN);
end architecture;