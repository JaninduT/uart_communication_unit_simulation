----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2020 08:50:14 PM
-- Design Name: 
-- Module Name: uart_rx_tx - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_rx_tx is
    Port ( s_axi_aclk : IN STD_LOGIC;
           s_axi_aresetn : IN STD_LOGIC;
           interrupt_0 : OUT STD_LOGIC;
           s_axi_awaddr_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_awvalid_0 : IN STD_LOGIC;
           s_axi_awready_0 : OUT STD_LOGIC;
           s_axi_wdata_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_wstrb_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_wvalid_0 : IN STD_LOGIC;
           s_axi_wready_0 : OUT STD_LOGIC;
           s_axi_bresp_0 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_bvalid_0 : OUT STD_LOGIC;
           s_axi_bready_0 : IN STD_LOGIC;
           s_axi_araddr_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_arvalid_0 : IN STD_LOGIC;
           s_axi_arready_0 : OUT STD_LOGIC;
           s_axi_rdata_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_rresp_0 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_rvalid_0 : OUT STD_LOGIC;
           s_axi_rready_0 : IN STD_LOGIC;
           interrupt_1 : OUT STD_LOGIC;
           s_axi_awaddr_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_awvalid_1 : IN STD_LOGIC;
           s_axi_awready_1 : OUT STD_LOGIC;
           s_axi_wdata_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_wstrb_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_wvalid_1 : IN STD_LOGIC;
           s_axi_wready_1 : OUT STD_LOGIC;
           s_axi_bresp_1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_bvalid_1 : OUT STD_LOGIC;
           s_axi_bready_1 : IN STD_LOGIC;
           s_axi_araddr_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_arvalid_1 : IN STD_LOGIC;
           s_axi_arready_1 : OUT STD_LOGIC;
           s_axi_rdata_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_rresp_1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_rvalid_1 : OUT STD_LOGIC;
           s_axi_rready_1 : IN STD_LOGIC );
end uart_rx_tx;

architecture Behavioral of uart_rx_tx is

component axi_uartlite_0 is 
    Port ( s_axi_aclk : IN STD_LOGIC;
           s_axi_aresetn : IN STD_LOGIC;
           interrupt : OUT STD_LOGIC;
           s_axi_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_awvalid : IN STD_LOGIC;
           s_axi_awready : OUT STD_LOGIC;
           s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_wvalid : IN STD_LOGIC;
           s_axi_wready : OUT STD_LOGIC;
           s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_bvalid : OUT STD_LOGIC;
           s_axi_bready : IN STD_LOGIC;
           s_axi_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_arvalid : IN STD_LOGIC;
           s_axi_arready : OUT STD_LOGIC;
           s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_rvalid : OUT STD_LOGIC;
           s_axi_rready : IN STD_LOGIC;
           rx : IN STD_LOGIC;
           tx : OUT STD_LOGIC);
end component;

component axi_uartlite_1 is 
    Port ( s_axi_aclk : IN STD_LOGIC;
           s_axi_aresetn : IN STD_LOGIC;
           interrupt : OUT STD_LOGIC;
           s_axi_awaddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_awvalid : IN STD_LOGIC;
           s_axi_awready : OUT STD_LOGIC;
           s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_wvalid : IN STD_LOGIC;
           s_axi_wready : OUT STD_LOGIC;
           s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_bvalid : OUT STD_LOGIC;
           s_axi_bready : IN STD_LOGIC;
           s_axi_araddr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           s_axi_arvalid : IN STD_LOGIC;
           s_axi_arready : OUT STD_LOGIC;
           s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
           s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
           s_axi_rvalid : OUT STD_LOGIC;
           s_axi_rready : IN STD_LOGIC;
           rx : IN STD_LOGIC;
           tx : OUT STD_LOGIC);
end component;

signal rx : STD_LOGIC;
signal tx : STD_LOGIC;

begin

uart_0 : axi_uartlite_0
    port map (s_axi_aclk => s_axi_aclk,
              s_axi_aresetn => s_axi_aresetn,
              interrupt => interrupt_0,
              s_axi_awaddr => s_axi_awaddr_0,
              s_axi_awvalid => s_axi_awvalid_0,
              s_axi_awready => s_axi_awready_0,
              s_axi_wdata => s_axi_wdata_0,
              s_axi_wstrb => s_axi_wstrb_0,
              s_axi_wvalid => s_axi_wvalid_0,
              s_axi_wready => s_axi_wready_0,
              s_axi_bresp => s_axi_bresp_0,
              s_axi_bvalid => s_axi_bvalid_0,
              s_axi_bready => s_axi_bready_0,
              s_axi_araddr => s_axi_araddr_0,
              s_axi_arvalid => s_axi_arvalid_0,
              s_axi_arready => s_axi_arready_0,
              s_axi_rdata => s_axi_rdata_0,
              s_axi_rresp => s_axi_rresp_0,
              s_axi_rvalid => s_axi_rvalid_0,
              s_axi_rready => s_axi_rready_0,
              rx => rx,
              tx => tx);

uart_1 : axi_uartlite_1
    port map (s_axi_aclk => s_axi_aclk,
              s_axi_aresetn => s_axi_aresetn,
              interrupt => interrupt_1,
              s_axi_awaddr => s_axi_awaddr_1,
              s_axi_awvalid => s_axi_awvalid_1,
              s_axi_awready => s_axi_awready_1,
              s_axi_wdata => s_axi_wdata_1,
              s_axi_wstrb => s_axi_wstrb_1,
              s_axi_wvalid => s_axi_wvalid_1,
              s_axi_wready => s_axi_wready_1,
              s_axi_bresp => s_axi_bresp_1,
              s_axi_bvalid => s_axi_bvalid_1,
              s_axi_bready => s_axi_bready_1,
              s_axi_araddr => s_axi_araddr_1,
              s_axi_arvalid => s_axi_arvalid_1,
              s_axi_arready => s_axi_arready_1,
              s_axi_rdata => s_axi_rdata_1,
              s_axi_rresp => s_axi_rresp_1,
              s_axi_rvalid => s_axi_rvalid_1,
              s_axi_rready => s_axi_rready_1,
              rx => tx,
              tx => rx);

end Behavioral;
