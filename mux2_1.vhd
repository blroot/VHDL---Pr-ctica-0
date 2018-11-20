library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1 is
	port(a: in std_logic_vector(1 downto 0);
	     sel: in std_logic;
	     s: out std_logic);
end mux2_1;

-- arquitectura basada en procesos explícitos y sentencias secuenciales
architecture explicit_proc_sec of mux2_1 is
begin
    process(a, sel)
    begin
      if (sel='0') then
        s <= a(0);
      else
        s <= a(1);
      end if;
    end process;
end explicit_proc_sec;

-- arquitectura basada en sentencias concurrentes
architecture concurrent_sentences of mux2_1 is
begin
   s <= a(0) when sel='0' else a(1);
end concurrent_sentences;


-- arquitectura basada en instanciación de componentes (or2 y and2)
architecture components_instances of mux2_1 is

signal a0_not_sel: std_logic_vector(1 downto 0);
signal a1_sel: std_logic_vector(1 downto 0);
signal and_result: std_logic_vector(1 downto 0);

begin

  a0_not_sel(0) <= a(0);
  a0_not_sel(1) <= not(sel);

  a1_sel(0) <= a(1);
  a1_sel(1) <= sel;

  first_and : entity work.and2(basic)
    port map(i => a0_not_sel, s => and_result(0));
  second_and : entity work.and2(basic)
    port map(i => a1_sel, s => and_result(1));
  final_or : entity work.or2(basic)
    port map(i => and_result, s => s);
end components_instances;