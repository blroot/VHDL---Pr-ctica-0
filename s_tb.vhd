library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity s_tb is
end entity s_tb;

architecture test_s of s_tb is
  component nombre_entidad is
	port(a: in std_logic_vector(2 downto 0);
	     s: out std_logic);
  end component;
  signal a: std_logic_vector(2 downto 0);
  signal s: std_logic;

  begin
    uut: nombre_entidad port map(a => a, s => s);
    process
    begin
	a(0) <= '0'; a(1) <= '0'; a(2) <= '0';
	wait for 10 ns;
	assert s='0' report "Falla" severity ERROR;

	a(0) <= '0'; a(1) <= '0'; a(2) <= '1';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;

	a(0) <= '0'; a(1) <= '1'; a(2) <= '0';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;

	a(0) <= '0'; a(1) <= '1'; a(2) <= '1';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;

	a(0) <= '1'; a(1) <= '0'; a(2) <= '0';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;

	a(0) <= '1'; a(1) <= '0'; a(2) <= '1';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;

	a(0) <= '1'; a(1) <= '1'; a(2) <= '0';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;

	a(0) <= '1'; a(1) <= '1'; a(2) <= '1';
	wait for 10 ns;
	assert s='1' report "Falla" severity ERROR;
    end process;

end architecture test_s;
