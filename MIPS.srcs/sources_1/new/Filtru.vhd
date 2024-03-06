----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 11:36:30 AM
-- Design Name: 
-- Module Name: Filtru - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Filtru is
    Port ( btn,clk: in STD_LOGIC;
           enable: out STD_LOGIC);
end Filtru;

architecture arh1 of Filtru is
    signal cnt:std_logic_vector (15 downto 0):=(others => '0');
    signal en,Q0,Q1,Q2: std_logic:='0';
begin
    nr:process(clk)
        begin
            if(rising_edge(clk)) then
                cnt<= cnt+1;
            end if;
    end process;
    en<='1' when cnt=X"FFFF" else '0';
    bist0: process(clk)
        begin 
            if(rising_edge(clk)) then
                if(en='1') then 
                    Q0<=btn;
                end if;
            end if;
    end process bist0;

    bist1: process(clk)
        begin
            if(rising_edge(clk)) then
                Q1<=Q0;
             end if;
    end process bist1;
    
    bist2: process(clk)
        begin
            if(rising_edge(clk)) then
                Q2<=Q1;
             end if;
    end process bist2;
    
    enable<=Q1 AND (NOT Q2);
end arh1;