library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_8_tb is
end FA_8_tb;

architecture test of FA_8_tb is
  
  component FA_8 is
    port(a: in std_logic_vector(7 downto 0);
         b: in std_logic_vector(7 downto 0);
         c_in: in std_logic;
         c_out: out std_logic;
         o: out std_logic_vector(7 downto 0));
  end component;

  signal a: std_logic_vector(7 downto 0);
  signal b: std_logic_vector(7 downto 0);
  signal c_in: std_logic;
  signal c_out: std_logic;
  signal o: std_logic_vector(7 downto 0);

begin
  uut: FA_8 port map(a => a, b => b, c_in => c_in, c_out => c_out, o => o);
  process
  begin

    a <= "00000000"; b <= "00000000"; c_in <= '0';
    wait for 10 ns;
    assert o="00000000" and c_out='0' report "Falla 0" severity ERROR;

    a <= "00000001"; b <= "00000001"; c_in <= '0';
    wait for 10 ns;
    assert o="00000010" and c_out='0' report "Falla 1" severity ERROR;

    a <= "11111111"; b <= "11111111"; c_in <= '0';
    wait for 10 ns;
    assert o="11111110" and c_out='1' report "Falla 2" severity ERROR;

  end process;
end test;
