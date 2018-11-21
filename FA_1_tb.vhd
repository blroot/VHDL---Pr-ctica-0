library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_1_tb is
end FA_1_tb;

architecture test of FA_1_tb is
  
  component FA_1 is
    port(a: in std_logic;
         b: in std_logic;
         c_in: in std_logic;
         c_out: out std_logic;
         o: out std_logic);
  end component;

  signal a: std_logic;
  signal b: std_logic;
  signal c_in: std_logic;
  signal c_out: std_logic;
  signal o: std_logic;

begin
  uut: FA_1 port map(a => a, b => b, c_in => c_in, c_out => c_out, o => o);
  process
  begin

    a <= '0'; b <= '0'; c_in <= '0';
    wait for 10 ns;
    assert o='0' and c_out='0' report "Falla 0" severity ERROR;

    a <= '0'; b <= '1'; c_in <= '0';
    wait for 10 ns;
    assert o='1' and c_out='0' report "Falla 1" severity ERROR;

    a <= '0'; b <= '0'; c_in <= '1';
    wait for 10 ns;
    assert o='1' and c_out='0' report "Falla 2" severity ERROR;

    a <= '0'; b <= '1'; c_in <= '1';
    wait for 10 ns;
    assert o='0' and c_out='1' report "Falla 3" severity ERROR;

    a <= '1'; b <= '0'; c_in <= '1';
    wait for 10 ns;
    assert o='0' and c_out='1' report "Falla 4" severity ERROR;

    a <= '1'; b <= '1'; c_in <= '0';
    wait for 10 ns;
    assert o='0' and c_out='1' report "Falla 5" severity ERROR;

    a <= '1'; b <= '1'; c_in <= '1';
    wait for 10 ns;
    assert o='1' and c_out='1' report "Falla 6" severity ERROR;

  end process;
end test;
