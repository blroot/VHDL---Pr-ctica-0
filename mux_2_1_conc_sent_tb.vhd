library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1_conc_sent_tb is
end mux2_1_conc_sent_tb;

architecture test_mux2_1 of mux2_1_conc_sent_tb is

  component mux2_1 is
    port(a: in std_logic_vector(1 downto 0);
	 sel: in std_logic;
	 s: out std_logic);
  end component;

  signal a: std_logic_vector(1 downto 0);
  signal sel: std_logic;
  signal s: std_logic;

  begin 
    uut: entity work.mux2_1(concurrent_sentences) port map(a => a, sel => sel, s => s);
    process
    begin
      a <= "10";
      sel <= '0';
      wait for 10 ns;
      assert s='0' report "Falla con sel=0" severity ERROR; 

      sel <= '1';
      wait for 10 ns;
      assert s='1' report "Falla con sel=1" severity ERROR; 
    end process;

end test_mux2_1;
