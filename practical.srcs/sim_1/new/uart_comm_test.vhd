----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2020 10:32:46 PM
-- Design Name: 
-- Module Name: uart_comm_test - Behavioral
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

entity uart_comm_test is
--  Port ( );
end uart_comm_test;

architecture Behavioral of uart_comm_test is

component uart_comm is
    Generic (mem_addr_size : integer := 4;
             pixel_data_size : integer := 8);

    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           start_op_in : in STD_LOGIC;
           finished_op_out : out STD_LOGIC;
           send_rec_select_in : in STD_LOGIC;
           ioi_addra_out : out STD_LOGIC_VECTOR (3 downto 0);
           ioi_dina_out : out STD_LOGIC_VECTOR (7 downto 0);
           ioi_douta_in : in STD_LOGIC_VECTOR (7 downto 0);
           ioi_wea_out : out STD_LOGIC_VECTOR (0 downto 0);
           uart_interrupt_in : in STD_LOGIC;
           uart_s_axi_awaddr_out : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           uart_s_axi_awvalid_out : out STD_LOGIC;
           uart_s_axi_awready_in : in STD_LOGIC;
           uart_s_axi_wdata_out : out STD_LOGIC_VECTOR(31 DOWNTO 0);
           uart_s_axi_wstrb_out : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           uart_s_axi_wvalid_out : out STD_LOGIC;
           uart_s_axi_wready_in : in STD_LOGIC;
           uart_s_axi_bresp_in : in STD_LOGIC_VECTOR(1 DOWNTO 0);
           uart_s_axi_bvalid_in : in STD_LOGIC;
           uart_s_axi_bready_out : out STD_LOGIC;
           uart_s_axi_araddr_out : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           uart_s_axi_arvalid_out : out STD_LOGIC;
           uart_s_axi_arready_in : in STD_LOGIC;
           uart_s_axi_rdata_in : in STD_LOGIC_VECTOR(31 DOWNTO 0);
           uart_s_axi_rresp_in : in STD_LOGIC_VECTOR(1 DOWNTO 0);
           uart_s_axi_rvalid_in : in STD_LOGIC;
           uart_s_axi_rready_out : out STD_LOGIC);
end component;

component uart_rx_tx is
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
end component;

component blk_mem_gen_0 is
    Port ( clka : IN STD_LOGIC;
           wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

signal s_axi_aclk :STD_LOGIC := '0';
signal s_axi_aresetn : STD_LOGIC;
signal interrupt_0 : STD_LOGIC;
signal s_axi_awaddr_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal s_axi_awvalid_0 : STD_LOGIC;
signal s_axi_awready_0 : STD_LOGIC;
signal s_axi_wdata_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal s_axi_wstrb_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal s_axi_wvalid_0 : STD_LOGIC;
signal s_axi_wready_0 : STD_LOGIC;
signal s_axi_bresp_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal s_axi_bvalid_0 : STD_LOGIC;
signal s_axi_bready_0 : STD_LOGIC;
signal s_axi_araddr_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal s_axi_arvalid_0 : STD_LOGIC;
signal s_axi_arready_0 : STD_LOGIC;
signal s_axi_rdata_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal s_axi_rresp_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal s_axi_rvalid_0 : STD_LOGIC;
signal s_axi_rready_0 : STD_LOGIC;
signal interrupt_1 : STD_LOGIC;
signal s_axi_awaddr_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal s_axi_awvalid_1 : STD_LOGIC;
signal s_axi_awready_1 : STD_LOGIC;
signal s_axi_wdata_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal s_axi_wstrb_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal s_axi_wvalid_1 : STD_LOGIC;
signal s_axi_wready_1 : STD_LOGIC;
signal s_axi_bresp_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal s_axi_bvalid_1 : STD_LOGIC;
signal s_axi_bready_1 : STD_LOGIC;
signal s_axi_araddr_1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal s_axi_arvalid_1 : STD_LOGIC;
signal s_axi_arready_1 : STD_LOGIC;
signal s_axi_rdata_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal s_axi_rresp_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal s_axi_rvalid_1 : STD_LOGIC;
signal s_axi_rready_1 : STD_LOGIC;
signal start_op : STD_LOGIC;
signal start_op_rec : STD_LOGIC;
signal finished_op : STD_LOGIC;
signal finished_op_rec : STD_LOGIC;
signal ioi_addra : STD_LOGIC_VECTOR (3 downto 0);
signal ioi_douta : STD_LOGIC_VECTOR (7 downto 0);
signal ioi_wea : STD_LOGIC_VECTOR (0 downto 0);
signal ioi_dina : STD_LOGIC_VECTOR (7 downto 0);
signal ioi_addra_rec : STD_LOGIC_VECTOR (3 downto 0);
signal ioi_wea_rec : STD_LOGIC_VECTOR (0 downto 0);
signal ioi_dina_rec : STD_LOGIC_VECTOR (7 downto 0);
signal ioi_douta_rec : STD_LOGIC_VECTOR (7 downto 0);
signal send_rec_select_rec : STD_LOGIC;
signal send_rec_select_send : STD_LOGIC;


begin

uut_1 : uart_rx_tx
    port map (s_axi_aclk => s_axi_aclk,
              s_axi_aresetn => s_axi_aresetn,
              interrupt_0 => interrupt_0,
              s_axi_awaddr_0 => s_axi_awaddr_0,
              s_axi_awvalid_0 => s_axi_awvalid_0,
              s_axi_awready_0 => s_axi_awready_0,
              s_axi_wdata_0 => s_axi_wdata_0,
              s_axi_wstrb_0 => s_axi_wstrb_0,
              s_axi_wvalid_0 => s_axi_wvalid_0,
              s_axi_wready_0 => s_axi_wready_0,
              s_axi_bresp_0 => s_axi_bresp_0,
              s_axi_bvalid_0 => s_axi_bvalid_0,
              s_axi_bready_0 => s_axi_bready_0,
              s_axi_araddr_0 => s_axi_araddr_0,
              s_axi_arvalid_0 => s_axi_arvalid_0,
              s_axi_arready_0 => s_axi_arready_0,
              s_axi_rdata_0 => s_axi_rdata_0,
              s_axi_rresp_0 => s_axi_rresp_0,
              s_axi_rvalid_0 => s_axi_rvalid_0,
              s_axi_rready_0 => s_axi_rready_0,
              interrupt_1 => interrupt_1,
              s_axi_awaddr_1 => s_axi_awaddr_1,
              s_axi_awvalid_1 => s_axi_awvalid_1,
              s_axi_awready_1 => s_axi_awready_1,
              s_axi_wdata_1 => s_axi_wdata_1,
              s_axi_wstrb_1 => s_axi_wstrb_1,
              s_axi_wvalid_1 => s_axi_wvalid_1,
              s_axi_wready_1 => s_axi_wready_1,
              s_axi_bresp_1 => s_axi_bresp_1,
              s_axi_bvalid_1 => s_axi_bvalid_1,
              s_axi_bready_1 => s_axi_bready_1,
              s_axi_araddr_1 => s_axi_araddr_1,
              s_axi_arvalid_1 => s_axi_arvalid_1,
              s_axi_arready_1 => s_axi_arready_1,
              s_axi_rdata_1 => s_axi_rdata_1,
              s_axi_rresp_1 => s_axi_rresp_1,
              s_axi_rvalid_1 => s_axi_rvalid_1,
              s_axi_rready_1 => s_axi_rready_1 );

uut_send : uart_comm
    port map (clk => s_axi_aclk,
              rst_n => s_axi_aresetn,
              start_op_in => start_op,
              finished_op_out => finished_op,
              send_rec_select_in => send_rec_select_send,
              ioi_addra_out => ioi_addra,
              ioi_douta_in => ioi_douta,
              ioi_dina_out => ioi_dina,
              ioi_wea_out => ioi_wea,
              uart_interrupt_in => interrupt_0,
              uart_s_axi_awaddr_out => s_axi_awaddr_0,
              uart_s_axi_awvalid_out => s_axi_awvalid_0,
              uart_s_axi_awready_in => s_axi_awready_0,
              uart_s_axi_wdata_out => s_axi_wdata_0,
              uart_s_axi_wstrb_out => s_axi_wstrb_0,
              uart_s_axi_wvalid_out => s_axi_wvalid_0,
              uart_s_axi_wready_in => s_axi_wready_0,
              uart_s_axi_bresp_in => s_axi_bresp_0,
              uart_s_axi_bvalid_in => s_axi_bvalid_0,
              uart_s_axi_bready_out => s_axi_bready_0,
              uart_s_axi_araddr_out => s_axi_araddr_0,
              uart_s_axi_arvalid_out => s_axi_arvalid_0,
              uart_s_axi_arready_in => s_axi_arready_0,
              uart_s_axi_rdata_in => s_axi_rdata_0,
              uart_s_axi_rresp_in => s_axi_rresp_0,
              uart_s_axi_rvalid_in => s_axi_rvalid_0,
              uart_s_axi_rready_out => s_axi_rready_0);
              
uut_rec : uart_comm
    port map (clk => s_axi_aclk,
              rst_n => s_axi_aresetn,
              start_op_in => start_op_rec,
              finished_op_out => finished_op_rec,
              send_rec_select_in => send_rec_select_rec,
              ioi_addra_out => ioi_addra_rec,
              ioi_dina_out => ioi_dina_rec,
              ioi_douta_in => ioi_douta_rec,
              ioi_wea_out => ioi_wea_rec,
              uart_interrupt_in => interrupt_1,
              uart_s_axi_awaddr_out => s_axi_awaddr_1,
              uart_s_axi_awvalid_out => s_axi_awvalid_1,
              uart_s_axi_awready_in => s_axi_awready_1,
              uart_s_axi_wdata_out => s_axi_wdata_1,
              uart_s_axi_wstrb_out => s_axi_wstrb_1,
              uart_s_axi_wvalid_out => s_axi_wvalid_1,
              uart_s_axi_wready_in => s_axi_wready_1,
              uart_s_axi_bresp_in => s_axi_bresp_1,
              uart_s_axi_bvalid_in => s_axi_bvalid_1,
              uart_s_axi_bready_out => s_axi_bready_1,
              uart_s_axi_araddr_out => s_axi_araddr_1,
              uart_s_axi_arvalid_out => s_axi_arvalid_1,
              uart_s_axi_arready_in => s_axi_arready_1,
              uart_s_axi_rdata_in => s_axi_rdata_1,
              uart_s_axi_rresp_in => s_axi_rresp_1,
              uart_s_axi_rvalid_in => s_axi_rvalid_1,
              uart_s_axi_rready_out => s_axi_rready_1);
                  

block_ram_1 : blk_mem_gen_0
    port map (clka => s_axi_aclk,
              wea => ioi_wea,
              addra => ioi_addra,
              dina => ioi_dina,
              douta => ioi_douta);

block_ram_2 : blk_mem_gen_0
    port map (clka => s_axi_aclk,
              wea => ioi_wea_rec,
              addra => ioi_addra_rec,
              dina => ioi_dina_rec,
              douta => ioi_douta_rec);

s_axi_aclk <= not s_axi_aclk after 5ns;

stimuli : process
    begin
        s_axi_aresetn <= '1';
        start_op <= '0';
        start_op_rec <= '0';
        send_rec_select_rec <= '0';
        send_rec_select_send <= '0';
        wait for 5 ns;
        s_axi_aresetn <= '0';
        wait for 20 ns;
        s_axi_aresetn <= '1';
        wait for 10ns;
        start_op_rec <= '1';
        send_rec_select_rec <= '1';
        wait for 10ns;
        start_op_rec <= '0';
        send_rec_select_rec <= '0';
        wait for 100ns;
        start_op <= '1';
        wait for 10ns;
        start_op <= '0';
        wait;
    end process;

--check_data : process ( s_axi_aclk, interrupt_1, s_axi_arready_1)
--    variable int_on : STD_LOGIC := '0';
--    variable arready : STD_LOGIC := '0';
--    variable rvalid : STD_LOGIC := '0';
--    variable out_value : line;
--    file rec_data : text is out "rec_data.txt";
--    begin
--        if (s_axi_aclk 'event and s_axi_aclk = '1') then
--            if (interrupt_1 = '1' and int_on = '0') then
--                int_on := '1';
--                s_axi_araddr_1 <= "0000";
--                s_axi_arvalid_1 <= '1';
--            elsif (int_on = '1') then
--                if (s_axi_arready_1 = '1' and arready = '0') then
--                    arready := '1';
--                elsif (arready = '1') then
--                    s_axi_arvalid_1 <= '0';
--                    arready := '0';
--                end if;
--                if (s_axi_rvalid_1 = '1' and rvalid = '0') then
--                    rvalid := '1';
--                    s_axi_rready_1 <= '1';
--                    write(out_value, to_integer(unsigned(s_axi_rdata_1)), left, 3);
--                    writeline(rec_data, out_value);
----                    assert (s_axi_rdata_1 = "00000000000000000000000010101010")
----                        report "Received data mismatch"
----                        severity NOTE;
--                elsif (rvalid = '1') then
--                    s_axi_rready_1 <= '0';
--                    rvalid := '0';
--                    int_on := '0';
--                end if;
--            end if;
--            if (finished_op = '1') then
--                file_close(rec_data);
--            end if;
--        end if;
--    end process;
end Behavioral;

