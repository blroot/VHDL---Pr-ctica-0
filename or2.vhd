library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2 is
  port(i: in std_logic_vector(1 downto 0);
       s: out std_logic);
end or2;

architecture basic of or2 is
begin
  s <= (i(0) or i(1));
end basic;