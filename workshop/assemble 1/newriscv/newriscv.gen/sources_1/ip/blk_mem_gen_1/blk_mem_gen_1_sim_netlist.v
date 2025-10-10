// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Oct 10 20:06:03 2025
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
