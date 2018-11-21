library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_1 is
  port(a: in std_logic;
       b: in std_logic;
       c_in: in std_logic;
       c_out: out std_logic;
       o: out std_logic);
end FA_1;

architecture basic of FA_1 is
begin
  o <= c_in xor a xor b;
  c_out <= (a and b) or ((a xor b) and c_in);
end basic;
