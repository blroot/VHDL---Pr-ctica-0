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

-- arquitectura basada en sentencias concurrentes
architecture concurrent_sentences of dmux2_1 is
begin
  s <= '0' & a when sel='0' else a & '0';
end concurrent_sentences;

-- arquitectura basada en instanciación de componentes (or2, and2, not)
architecture components_instances of dmux2_1 is

signal a_not_sel: std_logic_vector(1 downto 0);
signal a_sel: std_logic_vector(1 downto 0);

begin

  a_not_sel(1) <= a;
  a_sel <= a & sel;
 
  not1: entity work.not_component(basic)
     port map(a => sel, s => a_not_sel(0));

  s0 : entity work.and2(basic)
     port map(i => a_not_sel, s => s(0));
 
  s1 : entity work.and2(basic)
      port map(i => a_sel, s=> s(1));
 
end components_instances;
