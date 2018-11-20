library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux2_1 is
  port(a: in std_logic;
       sel: in std_logic;
       s: out std_logic_vector(1 downto 0));
end dmux2_1;

-- arquitectura basada en procesos explícitos y sentencias secuenciales
architecture explicit_proc_sec of dmux2_1 is
begin
  process(a, sel)
  begin
    if (sel='0') then
      s <= '0' & a;
    else
      s <= a & '0';
    end if;
  end process;
end explicit_proc_sec;
