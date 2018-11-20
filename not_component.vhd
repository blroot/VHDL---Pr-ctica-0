library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_component is
  port(a: in std_logic;
       s: out std_logic);
end not_component;

architecture basic of not_component is
begin
  s <= not(a);
end basic;
