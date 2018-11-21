library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_8 is
  port(a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       c_in: in std_logic;
       c_out: out std_logic;
       o: out std_logic_vector(7 downto 0));
end FA_8;

-- arquitectura basada en instanciación de FA_1
architecture FA_1_instances of FA_8 is

  signal c: std_logic_vector(8 downto 0);

begin
  
  c(0) <= c_in;

  inst_gen : for i in 0 to 7 generate
    FA_1: entity work.FA_1(basic)
      port map(a => a(i), b => b(i), c_in => c(i), c_out => c(i+1), o => o(i));
  end generate;

  c_out <= c(8);

end FA_1_instances;