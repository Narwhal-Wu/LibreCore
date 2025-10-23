// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Oct 23 15:35:39 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/inbed/LibreCore/workshop/assemble
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
