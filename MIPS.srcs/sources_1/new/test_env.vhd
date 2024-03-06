----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2023 04:39:45 PM
-- Design Name: 
-- Module Name: test_env - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0)
           );
end test_env;

architecture Behavioral of test_env is

component SSD is
  Port (d0,d1,d2,d3 : in std_logic_vector(3 downto 0);
          clk: in std_logic;
          cat: out std_logic_vector(6 downto 0);
          an: out std_logic_vector(3 downto 0 ));
end component;

component Filtru is
    Port ( btn,clk: in STD_LOGIC;
           enable: out STD_LOGIC);
end component;


component Bloc_de_registre is
    port (
    clk : in std_logic;
    ra1 : in std_logic_vector (3 downto 0);
    ra2 : in std_logic_vector (3 downto 0);
    wa : in std_logic_vector (3 downto 0);
    wd : in std_logic_vector (15 downto 0);
    wen : in std_logic;
    rd1 : out std_logic_vector (15 downto 0);
    rd2 : out std_logic_vector (15 downto 0)
    );
end component;


signal count:STD_LOGIC_VECTOR (1 downto 0):="00";
signal enable:STD_LOGIC;

signal digits:std_logic_vector (15 downto 0):="0000000000000000";

signal A:std_logic_vector(15 downto 0):="0000000000000000";
signal B:std_logic_vector(15 downto 0):="0000000000000000";
signal shifting:std_logic_vector(15 downto 0):="0000000000000000";


type ROM is array (0 to 255) of std_logic_vector(15 downto 0);
signal memorie_ROM:ROM:=(x"0007",x"0042",x"0005",others=>x"0000");
signal count_ROM:STD_LOGIC_VECTOR (7 downto 0):="00000000";
signal enable_ROM: std_logic;
signal data_ROM:std_logic_vector(15 downto 0);


signal enable_reg: std_logic;
signal reg_btn: std_logic;
signal reg_reset: std_logic;
signal reg_count: std_logic_vector(3 downto 0):="0000";

signal wd :  std_logic_vector (15 downto 0):=x"0000";
signal rd1 : std_logic_vector (15 downto 0):=x"0000";
signal rd2 : std_logic_vector (15 downto 0):=x"0000";


type RAM is array (0 to 255) of std_logic_vector(15 downto 0);
signal memorie_RAM:ROM:=(x"0003",x"0025",x"0018",others=>x"0000");
signal addr_RAM:STD_LOGIC_VECTOR (7 downto 0):="00000000";
signal enable_RAM: std_logic;
signal di_RAM:std_logic_vector(15 downto 0);
signal do_RAM:std_logic_vector(15 downto 0);
signal we_RAM: std_logic;

signal ram_count_btn: std_logic;
signal ram_count_btn_reset: std_logic;

begin
------------------------------ALU---------------------------     
--Afisor_7_segmente: SSD port map(digits(3 downto 0), digits(7 downto 4), digits(11 downto 8), digits(15 downto 12),clk,cat,an);

--Filtrare: Filtru port map(btn(0),clk,enable);
    
--process(enable)
--begin
--   if rising_edge(enable) then
--         count <= count + 1;
--        --led<=count;
--   end if;
--end process;

-- A <= X"000" & sw(3 downto 0);
-- B <= X"000" & sw(7 downto 4);


--led(7)<= '1' when digits = 0 else '0';

--led(15 downto 14) <= count;
--process(count)
--begin
--    case count is
--        when "00" => digits <= A + B;
--        when "01" => digits <= A - B;
--        when "10" => shifting <=  X"00" & sw(7 downto 0);
--                     digits <= shifting(13 downto 0) & "00"; 
--        when "11" => shifting <=  X"00" & sw(7 downto 0);
--                     digits <= "00" & shifting(15 downto 2);
--    end case;
--end process;



---------------------------------ROM-------------------------------

--Filtrare_ROM: Filtru port map(btn(1),clk,enable_ROM);
  
--process(enable_ROM)
--begin
--   if rising_edge(enable_ROM) then
--         count_ROM <= count_ROM + 1;
--   end if;
--end process;

--data_ROM<=memorie_ROM(CONV_INTEGER(count_ROM));
--Afisor_7_segmente_ROM: SSD port map(data_ROM(3 downto 0), data_ROM(7 downto 4), data_ROM(11 downto 8), data_ROM(15 downto 12),clk,cat,an);

----------------------------------------Bloc de registre---------------------------------------------------

--Afisor_7_segmente: SSD port map(wd(3 downto 0), wd(7 downto 4), wd(11 downto 8), wd(15 downto 12),clk,cat,an);

--Filtrare_Reg_Enable: Filtru port map(btn(1),clk,enable_reg);
--Filtrare_Reg: Filtru port map(btn(0),clk,reg_btn);
--Filtrare_Reg_Counter_Reset: Filtru port map(btn(2),clk,reg_reset);

--Bloc_Registre: Bloc_de_registre port map(clk, reg_count,reg_count,reg_count,wd,enable_reg,rd1,rd2);

--process(reg_btn,reg_reset)
--begin
--   if reg_reset='1' then
--         reg_count<="0000";  
--    elsif rising_edge(reg_btn) then
--         reg_count <= reg_count + 1;
--   end if;
--end process;

--led(3 downto 0)<=reg_count;

--process(enable_reg)
--begin
--    if rising_edge(enable_reg) then
--        wd<=rd1+rd2;
--   end if;
--end process;

---------------------------------------------RAM---------------------------------------------------

Afisor_7_segmente: SSD port map(do_RAM(3 downto 0), do_RAM(7 downto 4), do_RAM(11 downto 8), do_RAM(15 downto 12),clk,cat,an);

Filtrare_RAM_count: Filtru port map(btn(0),clk,ram_count_btn);
Filtrare_RAM_count_reset: Filtru port map(btn(1),clk,ram_count_btn_reset);

process(ram_count_btn)
begin
    if ram_count_btn_reset = '1' then
         addr_RAM <= "00000000";
    elsif rising_edge(ram_count_btn) then
         addr_RAM <= addr_RAM + 1;
   end if;
end process;

di_RAM <= "00" & sw(13 downto 0);

enable_RAM <= sw(15);
we_RAM <= sw(14);

led(7 downto 0) <= addr_RAM;

process(clk)
begin 
    if rising_edge(clk) then
        if enable_RAM = '1' then
            if we_RAM = '1' then
                memorie_RAM(CONV_INTEGER(addr_RAM))<= di_RAM;
                do_RAM <= di_RAM;
            else
                do_RAM <= memorie_RAM(CONV_INTEGER(addr_RAM));
            end if;
        end if;
    end if;
end process;


end Behavioral;
