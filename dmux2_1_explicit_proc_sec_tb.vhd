library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux2_1_explicit_proc_sec_tb is
end dmux2_1_explicit_proc_sec_tb;

architecture test_dmux2_1 of dmux2_1_explicit_proc_sec_tb is
  component dmux2_1 is
    port(a: in std_logic;
         sel: in std_logic;
         s: out std_logic_vector(1 downto 0));
  end component;

  signal a: std_logic;
  signal sel: std_logic;
  signal s: std_logic_vector(1 downto 0);

begin
  uut: entity work.dmux2_1(explicit_proc_sec) port map(a => a, sel => sel, s => s);
  process
  begin
    a <= '1';
    sel <= '0';
    wait for 10 ns;
    assert s="10" report "Falla con sel=0" severity ERROR;

    sel <= '1';
    wait for 10 ns;
    assert s="01" report "Falla con sel=1" severity ERROR;
  end process;
end architecture;
