library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is
  port(i: in std_logic_vector(1 downto 0);
       s: out std_logic);
end and2;

architecture basic of and2 is
begin
  s <= (i(0) and i(1));
end basic;
