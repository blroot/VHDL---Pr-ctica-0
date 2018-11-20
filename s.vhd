library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nombre_entidad is
	port(a: in std_logic_vector(2 downto 0);
	     s: out std_logic);
end nombre_entidad;

architecture nombre_arquitectura of nombre_entidad is
--signal i: std_logic_vector(3 downto 0);
begin
  s <= '1' when (a(0)='1' or a(1)='1' or a(2)='1') else '0';
end nombre_arquitectura;
