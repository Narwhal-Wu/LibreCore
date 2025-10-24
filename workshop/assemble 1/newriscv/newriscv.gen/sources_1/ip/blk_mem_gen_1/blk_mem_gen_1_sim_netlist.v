// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Oct 20 02:15:59 2025
// Host        : lsh running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_1 -prefix
//               blk_mem_gen_1_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27120)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
