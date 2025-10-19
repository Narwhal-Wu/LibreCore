// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Oct 20 00:48:31 2025
// Host        : LAPTOP-N8FCCN37 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/M/nk/verilog/openRV/myq/LibreCore/workshop/assemble
//               1/newriscv/newriscv.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v}
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27408)
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
