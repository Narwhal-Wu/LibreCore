// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct  7 16:06:47 2025
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
TzvX4QNbORK41MLqfjjrEs6pQhCoG5T06X4sdKKVd52SlMvCqk5PSZtLg9EY5EECk3ApuZ21Op48
5qlKNSNDprDkuZjsBFS+Ta2FoX3k7eaSQFiDowIPfINq8BS0PmcjO/0d30mXcMWA/ARNSGUK64Xt
PdAJ2m47ihs1iuYj0WSyuR3jfZOw2d6KUJN1uS8ZN/9lBxNTsBeQdVO9mJQPPG0xEk5T2rGyC2J6
X0BvoGptfF2PBS88wf8YP5Kr56j5Xp/KMjtFDxMtAx5apRA9h8yhs90597jL5iCKiS1MEwubqfkL
gyUiCUqfVpuYACpTaeQoN9BJOJU9n3lcUHEg3Zc6dn0rHRqXqp01V716DL+BQzHCa8U1QncUaos1
ZsL6TjWm7iHfXdDczBuWiuplsJRF/0qEi0qQW9857fS60xIbXqkT/wwPvF/ZOFTp2oB2D1D8e2vf
f84/RI1mtbRDpwYsKpzKzyXY51kAEqP+9SozyMd+ne0BTVQ+475QAzjss+mkT4x4PMfZaxSuFdSX
Lr3TnBac91rf8+AYAdr8WgwYuiFPL2ZfxAMTyKZfBtyDo71QUQXByVTK74Gx5sqg929Sb9mZE+k8
HvGlfRstHhhndlwffDkLI9pJj2LaUQQL6FtHolkBliKVuhwf0S9sE6Cldm/US5QiKcd8bVbHYwx3
0XtJu66rFBdbEk/AAkJz07zxRB8KpI2uNr3EHz5ZW9/ewZnnKwZk20gauUfheqjqxPfXe+KDM0Ca
XZvr4UR/IdsSdhgHE7e+DKx8U6GsjAGqlotvPUgvBnMuODU++8x2bQXtAkNYQ2NUUETDMJazH8JO
0IRRfYML6HeV8HSXlU/2Va5BUJfuDkUHZR92VlwZzkYLuG3x27E6PtBSeeHw3iTlHybg0ZQuyjSM
OyzpfRHwHp5cTDeTJyybK6lV1KtEshRzDG4qpK6S9GhsFfmfp4/Y1+HtNlOFsmmidD1SmyPQNd9d
AwTtjn3ONWVrnwgGJ028YkMiO9Xv8O4PrHAd06tvbbgKQIXI/2LOKJWqt2+uFPI86r6a4LRq+LG+
BXn9hBKSonIa3j8GR/8o36bIUFcsdXBTfvg2CP9AXGbRJYpJ/CKaqdCokqMBKhTaEB3SnuydQkVa
RyPX76TuV70uccECpBLTLCT6kGLMAcGNKVK8rSeC3VFalmBBqZUGt8rbsAGq90Pq/HTuK7GbdSyX
Lp1QuLKeG/TU8XECScGkS8ewh2d0BYkW3NDGny8dToYQEWNE/45tj8MN0ykEpBcIa3xpn88jKUw/
ZhgjMtYSZ0gbzGiwpdnSzzfiIKlV1aolxBPbVB9mqh30ykKT3C0nAV/r9bi/RExeoDeQ2+lluuSG
uReAAMRZsuzmdoEfxaVAE+s1jXPpgwZ1KkxYdrQ+h/e8NsA+R2PULUv/Ok8h+sUdeMOzvkNX3S9L
nxE4IuwXBp7UfyWVmas1MpZxPgXswB0DXt240owNuB7LIUXBALdPAoFI51rcpVaGBAMBTsFPyFzu
lVYlhiwpuMC6rGqrQpz8iASICUgGPQFxsU118CMtqxwq+m/868FVN6zcnBaGB2nGyb/3TiNdtqjv
ABV0dFLx7oEwmdEZVF9fXq/N8A2V4hJJT0ssi0PXxHgWMY6IZqMXTwMfpIktuMQq9Uc6RKZ2UDbl
uZYEyc7HrdQfezuItmsUgGAT5jNzyoc39+iNZHP8YJZDeQUlY5z/zonzNzFhgDiKgU9BW0XzS0Ld
6Uu4lPHzP0TJ3jMqfqRe+AokVRDQJF9lKkn+kl0+79d/dVeE8Dxw6ROAGg2jBWWwBqPpMN1pHa6O
lpxvzxWdKZv2ZHs8vkMA6WZqxOgEuamgUFTJreLVghMSjZ/v5dBb1ltnhngiuiWPEjKMWV+iJnQu
mbB4NtcEzG03cSVXhTLrvY1/V2tMl9oMUFszWhnEO8LHb6ftd9216jlKamCGOOp295kmLP1RQcNC
GtIVWvxvn4ljjUMVhLDQZYoRzGwccxghjASpVixI9wN7m5Kmlotrt2rR+aTLqwtM+ZzHew2sWWH5
H2mRyhx7QwmldAFhcYbNOfmIdP4gsGx7sptizEaHDyquab7b+dU9nz5GzVUWYbBBMAGH4xtPh2/Q
EctclqvraPIBBPOlFHDUrPIfOwPmUtcTm0k51Y47MIEg1hH4QiOEEJjLc5D5K1ykj5KKX7IOlJ88
Lbntns7UBUKzDj1Ygpe7/g4iFUVdSC5dT2LXgj55anr0SGKRKa0MqNIsX1sFrP6iIyNcEYC1VDgY
dhRInfXFc3V8BH6su6k7cs4WdFnWUQsYffP5ydQi6YhZGvXO+xb6SeKouUJsFuL6PvJLoPvXDjZt
/dL2vnaFOcaCdGAd2tJWnByAq396qHx8e6Q8nJ9XnVx4x+fXJaNCKSd9tTiCQBCsK7Gyb+Axq4BX
QPezCNVGP55IOF7e1guR1YLSbGJbE35e3GMKRYnqmrCkvKFj+wYWunqs1H3A+PUMG8RC3O7y6qYg
u9fhiOkGJlklP/W43mFyV9ti/vndH6/rdsISQwSrhZpPm2rrmMZFLUmSV6+wzByC7PgLviDk9/UF
di6EpB5UUp1aAxNhNmnerWTWLyDxGd5okWtGz5Gsg1yvfksGN2T8fqESmT982zGWxH0ZLTeXFK7b
5dSFbfBBhR088tSoMWbTZ/IQpy+e3mhFQh2ystvAPZL8lvwkQA1usdi2ns9MnCRIL83ZaBVuZP22
yuiQjBVFWLp1zBi2Rxe10eetjwhKwZa8T5WimfkU4eHBhCr3qoML31ee+jLb/PfQ0mlIO/MdCmSr
QhiXeBULe/+B3ymsDHk8tPWCZKOcyapR0oyA84CBpB0ICUQiISBj3zAsEiXAu6hwm+2AkgUqtip1
p/xA+MEiYZDTQuIMRvqTNMdOrE/hT+KIL5+tvw/Qc9fWV2oIZjF8CYXlsVN8wQusQzDpfJynCeQ8
YQ9X5nzjsiS9hQCp/P/3uLva9oVoHPwTZHx2CBwOsNfYvWCO4FCNOtW//Tz0nu6vIob+/HCme91S
dZg3Vq8yf7rFak5++NximLgeq5xB745nKDUJXIKSfxl4IRm7EOyFPhaTgnUE/H94lsZ+7fSFwM9O
WeujU4TGV2Ie1SkscV/JPUjdfI0/KUF11lLzGMXkkqJ5OVspTwfqkrnUisjlgy6SWq96Qe0JfBHo
ggQd3gsdoghIXtTc0E3+Du+ZLLKF9rC26WdTctTnDD3oypMSV3p//L8WarpS6tQ7Di2l+8oBzaW8
9UNuzvb5dC95NHI4p0+vTFlb9P2WCYiHglTy9HE9Rc8gMLNX/cJ7ipvRqywx9izBGnqv/S3vqE/0
Fg28Cnnxg/qxg6yQRzRxATesYwwN+rQJIAntXfcbmnRMRwL5JlNeuoTNIbMrUKpYo92JJlnCRcky
EfzA1Xfl4dKaDlQbGwxDJVyMUrlUqyx7ZBY2D/MJQ59I3XU182C0CRqNumls3C+K+FfInAMzBs11
TUrBDyiJPn1zOauFEBtotD8bDdFECJEJlM54C+kIaWuJ46M4ltBFC7EoIRcHVpYdOeBMvhrIza8w
I7LquiwSANRagy8kex7W97g//l6TJjGv1Atn7JZoBTA65xdRpyB2AeEtvP+BJhUxOYRzpcY7y3nh
SokGV+Q4pvyksvfsVgI9LayxiuzU1/UTlQyDk9DqIvD+cbZdAfbGAGv+idSQrPncaLIlzpc50hke
1XpVFt1u1gnDbhGzvfxO1tIDFBQYvUoQEo13LwebZgt4HtaALtyRAur37gw7Nest5lxrh58XR/3K
CP/eRUWWqMONtUbiel9zQKvdXFcwZKhWMUu0JYrqMCFW6Kms4TgvdeuDAXg9jOX1sZlFy/I809tR
RgwR2jlepjAqkc3D8OgizZ/5rQ/j7GI/Y+lTS9inmz/Gg1lVNmmxEK7AWcaXGxy5Z8SMzbJ5PBft
0ruIODrvkSVqNgaeVv0Jv0owS0VoEFH9NmO49Hq7iEige6MPBQgNJlnTvY3YoxSdjFOVn8rY/iVx
41qDkHqviYxtkAW7OAQsaQMqJham5zE3Nn0aTDLC0GyF8PWJAx4Gmu7L9NRJZBAIg3rIq4j1+Fnn
chJskDHEddSdidAre5NtDvWGWYTGoD8fcTYYAHeqYvPAtNLMmu5ZqXx4GKKr1Diw9tDiwkdI9PEq
hOo3HasrMY3c6b1KJWPsP9N2ZEeHJCpJ1+NBLPwC6kG6foxP2Yfa0+8hNCa1jYlWiFu7KB1HyRh0
zmjW0U+sjEOXngZM/tF51Kh77GFq0UY1wHNyO2vQb95S4HlWCTzD3EI9CdgzONE0oHkvFmGTt3KD
r9FemBWvpUJQhcdED18PtaRwcPTUXNb7ukS8kJg87B+GMuov8BA4Sm2bvbEDedOiVkxmHcnw+0Ia
mQU/vvcRf0AX+H05/m7FBzzd4gXwvimFCn1rmv+AmApVyTmSNQzK74o2Fp2CICBlolYHKzzvP73P
opSYSL1UPKe0dGU5mwNZz1f410T87qYg2+ZQ0EsPIhpESvlcuL2aPH5nhMab8SKiJfOez3un6B3A
dYrZJFNxztn5lOPHBfs1vpbsvAeOoQ4Xbp614c6gNKiaW5Yk2Qpgn+N5+/MVbS+GAnTNZrp1sbfF
bWMu2F4pvEcDvgwxgRj//dLrU8mC+TNrvPdSU8PZ8suIpcWkOqRLkSz7DhMseilXJ+bKb+HpYK2w
FwkVQ+/BDciuWwBWcyCaO0Tscp9JXZkZG5nUnhVtruZHRUUpsv3yEJDUcbv2CL18dYSAHMTuFnb9
04rxSEdL+Ppl5Xd8pg4iDFlS4MAJmNVpNeVkW1ZVoe0Utft4jSDX+r8Smr9JWGYvA1ir8vQqEZ1x
OTPAFaW53au7RIqXX07ZnUqIEzKWSXP4DHHVBp7/VApERw1XD0l9W3M9xg/s13Ah6kFp+NYdUr8M
adazXVeMBe1eeqAwiqObg9IzXrILcd5e8Rrc/toERlEDy5RcHAsw8UnabQK0b7oLDjpKqJNneTDl
t4ZAjt+MlN24ouzeJVpOUCQAuc2mzaqdaKNxn8ZPU70ENfl9GFUuJg/QWIzm8dvzMFpleSF+ExI8
jDmSf3osg46Az5jpIpIkd23zs0pPlCTKWlHmYnlB86BLrp41LK38p6LaW45slU1Pukvgm2c8CBcS
3vtmwatT7IQsMvCC52e8cbuvj7+Zqml6pJfT14rNefAgrisj/NkfLaulKreZETzlIllfRohZArMw
6OEXAHQtrqeHUifiCElAIHT79wjTy4BSnQ9yPYDUHfO7nSb3DE4IAKwi9H35iMdwmiHr/1CwEWHT
FsAE9pIUvX50S4z7vGoaOsBi/G+uxDHdgoVYpwgZOxlxGqgl1iOnXu0l1ZzxfxXbYiFW4qC7hdVz
aN8a46qlKE1qNSHE964Eq8lGkbTz+EIjyPBoaYHSQzogXRJNre/V+jdBI0L3kPGHgsyaJbGxyTDN
hzLZDKwvdNxJCHwzFs684xfPAa5tnqSDr2j3aHGe/5np1z0CKEceWqHhaErJ2u94LEL36NDxNhv4
DDZlkbF18PAbYrZNehePPzNekTxGKTGewJdgUbpzRoBLchJ+jKMw6t6J284VnFClMzIhVqcJgm7J
XEW7ZpbC199+FEBZxYSUBRhwfWgkeabyTjXjtFkOfS/ulUIa2IYaAQ3KlZXgR+X6OrjjWNYPxJFO
lVlx1jktCeEnPIQjHNOLtTZ8CxMfvnvJHaQvq9Z7IEsZdpbr7q8Lc3dNQnmfl5umBMu8Ly2aMVNG
h4m5iReL4fX4dtzDhMGdRRBN23qa3PpavDjqO7zt50i0usCTABtjowBJdvE5HULNNWMYTkEURkx+
YA1moQTKJEZ7UeJoMSJelVfrgn03qSfz2Kwu0HbAOd2ra2R5IIrDwaSZghjE9MlsF9xhFJOKo8Sj
Ix+rZSV9WwactdqQIMIZd6+w/XAw7tOQLRqwJn0K+AwjTqzNjvFCWozbeVH9pLXwbSqYb29lGAvi
vWJJY2iAHwaLPPNNcLVaBd9Gje3Pnw5yUtLYovj0VJKkLqGnAf6hzmSHfyCj6eEVHE0ZpYPYqYRw
OeqxTzjqxtUzF6c/wBjuxuSRJSB+tzFoHXsvq+H2PXiMLuriO9baI8x8bfCO49GMU/P6Ae5KWtJK
bCmhenMBnkGdffUpQkCqzJ1gk7KjhXCMT0W+/0EREn7JwE6QOiMJTNTCzOylhuNDfdvYBeKQOQx+
5jTZHxcmFIY2l8aYy5IBdQXCMKJq2Tu1Hmj29zpCtvYj+u33bnwWMsYkWR5XoGC7ic9GV353CD6o
yNjnXDkskp1z0fHnvA1aMwpbmlNQvbnxNbKZrMpp9QZpcTMR7P97Hi5O/2H4BTgReSV7kxFXm7tI
1e9cuuU5qmuxA6sP8hc6i2af8M5+3kYZ2lDc7gRq4g2vEYSvdnv6MTnemp6S98OPcBhxOkhS5kak
D3O+M2D2QTCSnz6yVBi62geQ7rjkJ1NgcqxQ61zoHPh5Hph8XfskrH6cZ+EzSQsfxFj3613YCFWH
RpOVK/axJYPVxWxaOys9LFEXi0KxqjiU88m254MOl7dqhttsvJQzA0baNrKmRQYulGUT6z7JUrhL
VOan7oTcPQhTsXwQQ3UB051ITL4t2rINxusTVueMqlwIO7k9T5CI1xQrBq9BD22kqbPYXEsAZexJ
nvTnysDcIsWSslpvZVyWfOSShVzJPWH+Wu1ReE9obNdhMCf4R37W8Po1QjhwNdhyJgYxF5ywZV/G
0zEQEGVqCjTknW41y0qB6YZryHOTMrcYnZAc8uatKFHHdZKR2A6XF5oISVxaF8LiI7cB+34MmuF0
zIZun/YG1SPuq4hzrl3ZjLghhBw0fdNU4cvAnCxzA0joeA5A8cnWLVffdK6M4ylyx565xquo+O8a
E9U834PEwarXE9nH4AqEDGktbfYCB4JCIZ+fbGikTEw0mu7dPTQaCIGNJ2aQIss7cDYNRWbgabPz
SqBHR3XDA0MJVloWyJiGNrW4PV/m8AktDoiqwv25Z1kJaBWW42g0eZa1oyUg693VE0X6rKF9VccO
OX9nCm0g4QLx9YN3FlNGkJBox7PSFX1QZ64xkDY1Y6Kw9YKwztzsy8uzt8VzmYRsLqaBDRMvHd4X
uZ9C6QnJi/p4M7yoy4gBJZu9j5bLOrwRSXKKDYt/D3KGUqOsc7z+NnDOfn6zoO73vqDV1N6V7pWY
k/HCMsC7PWRTgWdzeqf/YL5ZaKc02XAGfcSveiG/BLzpVJwxHxcRReJ+w1qF96i4b4wJByaG3xM8
bzlmtt0f6mpNvxJHgV8o69O4WQPlCcwOcmtUoRmluxvYQpYkHO2LDlfl7ZVHUvtoB3F8NNg5IgvT
QsWwh2xkS42QB+YjVeuN6FXXSOsmUcEBVBYBg10+1KpH6bOjHFgCy5ThWfHs2TQY/n9R3ocyleEI
d8Qp6jKB4AiFul3cdpz7mcgLRh9XvpGO6DRNP4orPvCbYZaXanntSLWX9Aa4DEp8pOEnY0+2TY9f
lsd7EbAGwExsoSDiPvr7rcaFK5BY5uGy4QVpo1ir61DAlX415jobpfS8TNzW9gv10/e01AoGUCOM
MVUpP8SesaKHiLPoDe+2Q9d7jjKjsfS1/0QXnkCXje5qC0dQEZVK2GeebUOZHa7LQF0ju010CC80
NHXKafLq7zbkEaBUKgOzdp+NPzHQH0TDhmctoo5wwgeo3yxMHJUBBSYb94GvJ2xvfY7Yl44xHTgl
BKTt7WpCuZEr5Cat6QVtAXV3dnM67PocvJKazWXP9aOltnPHzbq/xyJUI9XckjpRP+Qx3IbzLOEi
nbFdVV/rpsDuF59iQFTcFVOoIKWkoxnykRuOSM2Y0I280NMVOdJbvEbqgjWLpYEi4cSmMN473ND7
n/syc5KBjJ4ghrghDkiwNKERxi331e6bxRTwdlVFRcDm7eA3kMb4yUMWd2SrOZCEgCnTCYpFTK0N
v2dWd48mnWhWX5CwZIQ6Ad+PghlyC2KSlNgwcx8m2uK6h+Ttpkf5WORHeExj8Biy8ATK8SELPJy7
rbBQG8XonrCpIi0wVHBjq3xBnM3cGCwW0yySL+uKpsmQPJ6lbdCT6zyubK/L9UDFg99PR6WyyKJw
va9IncNKZMp4OkX5jOukt8zzBALMgkPIXd+zlPAbvrqfsR++3Kdky+jNt/iCc50fHHydwbvvYUlO
F3NtnsYSzH64kS+B3ihr5AP60Caf4Sk0Le32K2lt5Qp6R8JhT8kknAaHwCYr61iBo5oO89a+uCJB
bO2ymkpg5v42gtxABSkg66jBDCPQ+g9PFv2vsXWMeFE/p5eGcPWIpwJC7bvjLRFc7ewDo15exMml
eau9L69MdHk/HpRRmge3Mut4f5Q1s1tylU+U2DxsIN1jrL4aDJko0QckJ21zebi6S7dklOLHU6gh
KU4STa5HLkPL5k6dWf7kt8n0mQFWJ5tlNzJ3ynUjY7nTNYBqLnPutFwRe99MLEUYq8vKqrSDqgCp
/MROjObS/pmeanxm6lBHo1RS2eAVsxcV+7OPx3e3/fvdDT/PwAJITwRTFv+3uSvW4br/dogB5mFn
Cv2/3n+FCbtxxUJo50XV6+cJlOn8mNZJHK6skyC3/K20VsEJe9Ov4lqNyYqbRnJ0//s+zhfqvKOH
WGcwVmloG4I4+pTE2ovtDTsSbAyIRla4zD92KbWSvwulWwNdkJ1nW1SROBmKy+fkbNH/M5D5CT2w
01oUXo5b7NnBtoiGUloJFNaAvmkRj1kqO6j2xYvqzRBAnzSt56Ab682wPxssy5BVQN+Qdeqhh+Zh
V4JvjxeXC8QexNfrQeJnuZfM/jK/bgcNLOFaR5tJWjjkauKqEhmK2JwnNFPtRCkj1j1+ndKJvqok
FWRWm454yEfJWsPy+MD1stHadFBJ6CuZEporSM8i4DKs46Z+bI2fieQUzCKFKBR8KNAYs4OUet4L
EmV4YecV1RGNU9I/WK1C3pu34JQUpl0jiAgcm0OapKL5bHfwRRhBRsXsWDwf0nrkO2M1p6j3YsZo
HwZ0zEEETGoSpsW3d9eT6zNjSYvdgoOLyIExTFRwamn8oDCPtvbvn2BV3tYhqRZSGNKp+WpSeA+f
O47J2cvmvBJhhg36I+uEwhyz9/TUu9qoAyRNMX6cHUponIBD9Cea8L/zRJ23OkuaNFVI73p5KCuL
CJue/o6SHnDdCCaJl+I5OlYS5oWEhZJXDnB0CoAaupFx1fydBsiler84pdvCWR04ToLJilbXOLTb
PwXjjfxqL6Bxpcy/gAIKSgPwnAOsDp+PpcKvXnotPfFRP1vp73jlJTe0WHDoHjROoc+rVXdNvE94
0047u9ZnhUmoqFr8ro900QS4Oz7WkbJn1wArYhGBp/1OCJKEoqYNly7FXtlKOGSRhO1uBkGt4rsK
v3L+gr5aDtU1Tzqm4ckEl9BWxn0c0LiDka7Nbs/WwbPLsjZkczj0JZ0wYFRQNQO7RAA2imlL/t26
78kyDQL+N24yxNUr+4VVP0i17OJ1X+JZEDfltbkm4BR3NY2qd5Io/k1LgG9K9bBhN8t4Aiyig5tc
N5zpHEFtc8Wu2k3NQWIJV0V1L+ByJvmdxhtCv8iDqp8PiQMLw4eLUn7AmKOLc4SWHtjrYwhPgXbk
rOdcYwAW5pcUaMRNudAMzU8xkYqij7zihAWu1kweJLP4pOdptgIGCA8sGcJoJocXwdDMdEsko3uV
azM8OiOMvhcYCwKRzx33uBq0C3hwkSOffnpKryMQSMkVnzIj3RY7vkBW4L7Sw+/5q25TDd6KlbLv
vTiUFHjhjLqQHxCTYVzuJR1ubmy78C3+DbRuINH9gc5fJBxlehve9dpLg0R1BDKxmCjM15smQFJE
mbtdp1sYkJkDiwRLnjLVtXRUvgJmIXCWVjWzLQbGu4+hw7jfzqer1cMsCaZG3MF2fsIZRQws2h/l
LELpmDufNU/LOtR/ji3r1iIOrbACrxggYnL4A3umBTUEnm2QDBntQ0M0D8OH/RnjvwFSOzsog7TC
dE3GRFjWqzAEohAkoEZ8+aeHCV3UtDk3O2fqCagum+hDzEiyBearxyGsumduX/efQ78ZMVwfctru
AlfIhx0TpGgiP3eZvcm65ffU6hVUZqtdnmtJkW6wWEh2ui671ASM2Y5U9RJ5zKmznlTs/PTs1KAq
pSv48RcQhVS746mIGqD7FoVTuOCdCfnHtHlgbtYd8ECbubNWvEMczDesrLnE6X71rF5NrfIHPN43
fpG05nx1BhFDdRNoGdgYi3aah8SYYKHoCjusJ9gtHILvNNeqYc9vRIP12K34qrJN6e8Qjo1VOzgR
A2Gu2/lS9BXQfFs4qhTvL5YLgwDZun5ZbU+YP5vAKSItOOYVqL0dwMzBkiYQbpol6oEpP8AC66IE
gkBXUumYgPGzY3PmcJSUMhmTqCEpIhzccipqAMjmafPRVbGTDbLqfWxhLNj8T5Q4Ogan6xUC8fH/
oZM+e06GsGWkUzQ+dM9O2X5XU8it8U91ijcQJh+f5oSAKT8IILuqf1Z0+ick45MnnkiUmx+oh05Z
L/+Wj2LtnrGikHhF0rak0B4WbUW9IlK3dvK0zRDtmPwLw/EBECws4qL/Xj4i+Re6BXqskMCcz7wF
8mk0DhUEwTy0IDRkSvYbbFrhlGtklBR1acgqGCYOp89St6rFcRcKHZqgeMSQOIYNp3vGGbcAvBi/
8IcHW8nYhAJKXr0dSMBKEGVIzAGJQJoYX5VMjU4vcg2JLZL9rrJ8rEdjdbTTOVrDYX3f2GaqGgaa
zUnBt1raJIZ3L754sQqUz8DvZXlh6bCf1ZaWhcymRHDB5ShEDuDo9CulWYgA+wnjuk90mM82soJB
OII+DGmHpHKq+BbQq/VwbUlNN/09NcXh6qxpEuZlD0WU7GSSdOj5cP8UJxLkI16fwJYtVx+sHhQd
2tgnvMXmlzPbXYdTGRaSLLBqajscqu7lx5EJtGbbIDHla190D3P0SJbl4qJRKG89y+KFNthJE9+X
xb9PCjUtXLCtSmBTUCxPibIhc3dW+kWBr4Y4nwp86jD7QJ6i/zlSg8gbeR07nTNnBSVEe8i8lSoh
PiqAsRkl+1hI5/qVFcbFQvoeP84ThvmaqodVuJptQNzYBVYCJxtW5CLJMTfdlF7xFre4XlykkJXE
SHm4pCWZyVeXcqXT+rDDLHZG6e1oVSwLMhqU4FB8PwAnwCqJAdA1XdZOFhpo+AvjXLvbTnU3K9Jx
hLz02BA54AjRiW3TcWw6FcIZJ5ep1oPQkdSPJrkgBZqKBJrw6iE8Zb+fmpleaG3/15kdtrzEacPR
k8/zkVxjMImU6NcAdDeoKfoL7pZ/JDd6RpB4Ii9/voYo+GLIEeTMVidui43aalm4IYwn0Nji5LBU
SHe8j6LztUmwIkaD0bdv6IG4xArZiWBxd0ihzCaMPjg2Zca5THq5MpKwkGo1l5mXf1udOS3vXU22
eh3ijWfxFpAo7/dBqYon22kI8Ul2i3qIcaoMWGZQ3Hn5AEnsF7AQVLkm23w//tlSicwcW/bvC3gJ
I3MLvbq0jWSEVfRhdMVZZyvB/SJ0tQ/f3yMO9mGYmUALoP+KbVeGiEqJLe63G5iI1PBZ1maQVYPb
6XUyAjbvbbqBRC9BtgqxjIK/ydBLZWSZqDmZbUp8siApw+nPsiACZl4Enup8GAxVZQ6zzA1VZH3s
obc6YAtCa4sl8Guzv9L6Mk+rlwpHqHjf7kZ2pblPSpikBFsBUmcmMLeze1Ki0YcJdSXAGx1iYzwN
YkWFRpfxdnmwd2ysIXxPXBfxh3tgIFaDS875ELZmhWNxjbN5zntDnfrUyjsTOf2n0qD5Q88+0iMT
X4+Kd4IRXtKLJoS154p+UQpqEuQjloShYpO4ey1B40hojo8GecnYhv8nUwHIM+3fEMoNKowNhAyc
XNlNgRl4vJ9rVjwZNYGW3KCUW/FLy4aRXApyrP2fFSIKV8uPq8nDIdFa4GJeVFW3bEqINQ2jCRcg
lomA6IBbJDezPZnUqQ/MI0n3vPYHGZPrqXDoR/z/4y20Z79S13wymAYWXt3uu3/jWH6ZchLvpUYi
CQ6recxss9Gi8r6fLb15wl9DAM/blnymUcJm5/DQv6mCpOK+tGryDr0fIHQvOnsriNrBoPVpbjmU
K6rDhtzQBT57CWiR+Kn1u81yWPQUqzWsuKVgYWn4qFwFLHpiktfOBzisHRWH/tNOochPaPMd5CTW
Sm6pvh4W9RizCT3lVaP31sKPpSX6dQTl0TUJOXeLNpsw4Cq/YSwXf8EyEnITI1M09zAGu6zJYg9B
lpm3p7DP+z+p5YGSu73saCmskf6kZ2sPwwfTKWbr0inAX2GohZ3ChW4a6/7vTeBauWK5y/RVRMD/
4LCZG82D7EAcZmJ8L9fvfgHD210BImReiVkCaUIiGHk8UpLgE947jDtj/dvgwodB5L5Z+tWQv0cj
uYbBOhV3o/VP8bq0tJhdqDqUUcoGjYzo3Jt+3n5OcF8x21ZPJc757+hPbOSs5Oxyg4hPvA4D0EW1
RV4trwyMQjbjsNbCpSTZPgrQYJvzlcD8JJak9d03PtqSQS0povmpKm7L0rpmYWIEWYE/O8B8WY/P
1F/+ezxnboPrygmo/acuwVLftGIL3zlwtQMTCAaqG7eVA9geMxMgNa2WFnftqcb6CGmWMj4OMCJi
YM1xNDXVpfbVbKyZ8lyRTXRzBdwWynxhmYq3H+txVAQlM/Q0s1YwT86bH/myTGiX4+V73A5g+Vv1
/ik7Ub845Xj69UaO0fg6rMfBZJcqgFON2Q5UltaEUI3yZnCXbbzG7Zsy28WTiwybh9Tx2P+Ff17b
t1THs1/niut3E7uy/r5k1+BacZbnccfIMdYr+bv6J3Hqggep4cAYZYJA/7KImpsoJ5iYA5m3VDsT
lp5t+FbNOzu5omrHOCbbSzjMRhBe7vRwtVhuoPOjhdI0eC98Gz62Aq98nhxPirrbb0JSpw0a/Gmk
inXZ8zqCA/zbir9ihN+VOBDkiAlglKsl1IXih1CsY+sQTNWvh4TmLd+kF3mBxrhn5rHvyd8qIcdv
+cHJoCbwFovGsAOBmx8IOobBCz0cTufaDAVF2dMweoFsioz24kzsqTEZAuKLQvZxczEsRH4D73+u
UNkBTDPEaYb1zZUmDCZs9GxIcW1riTMqJxrams5p+xfIqPpBbbCryTqSXX3XpmGuFWIl3305XaQA
FX3vttknjKW/5+2jTAltKEY3Pw1QKnksPSfaZ3A7AwRyqflwF78mSROdVpSLDrweKMVXGAD7HAVo
x1UidVGqMgcjUS60mHJIURCS4LwDYSkknFw+PK0vKLv04lNhpneGvrkvJEB6omBpSJGpTDbWVEI5
WzBS3CP5F35f/QTyMbHlmwofAWp+cXVcgQStLKck3mTnZa7hptqb2Ux6g979C1+iKsTRqodyNqtz
/vxEXrdf46Io30XJUuMIDTxfNqOS3XP1vvcdFd9XhYl6wlzntr0W1oF33aTKpvmC+5xobzdYFo9n
ga6ZS6jZ7HahmkOAG8KBF45Giszq/wTI/+v5hmUxDjHUjfTQqY3+DQZBYOo57WEKRAyJlknsEk9e
qZ6OHwXAuBu0isMd9N7yzK/D8CBJwBBZI8rb8PzO4ZcGrBKbCWF2gHz+z5Xxy95MzWcGXWNhBZu2
SyEs2BR2J9XWoDEvBfFcj20p7so5zowZTj2dtDjFZZur+1IsZopoSq5aDSaQQJwR0fnlYUS8H17N
I9H3jcwZj48/jrZYxcY+6jriejqXfF9QX1w3LoEmTEWjmuQ8Vvc/fj9Q07VITOynuZYGoon2ufKd
ixC5If5o8zODtuyz1HYQ9AqazH9luHGLNeB0/2qoesMWmlu2xk+DZAMyNaFSozoW1K2hmDNvyu96
UVkloSPb1Nu9TYsX10H6LblNmF3x7hglfSxaRjqdE9SDKKdhpEsaZNgl+TcsFDMT6wcRQUOV65Yl
7oSahB4D9Ju6j/q/tg15EfdPuX9S6IlNLxrLsOkpbI1jwfJlW5oHw0zbfQ8TY4LRfsQwQXOpTa4P
EksXiktSe6oaPnC8cmuB9WL6K4zVQHVR+B4iJaUFv+Fw6uJFrrq6IZvYogoku/Qb/IDwFAGg/w2z
h3IJeCyqAm0hUwrFmB9ncTeXfCxJNwwTHyZf32EfMVnLXcszw02Ezc61lndHxX1xCDgS+tutSnKF
6UC5ifQTcA7ahw09wGxqchyXJauDld8aePWXHBXzBeABEG86Mwd6092PDgWQ6wTJZ2BUmuhVEjH5
58+1ZLXuGufXm3UFRio4AcfpVgQ+jDGTmN9iXu7s4wuDeyv68dJKKkrp+RV4Ss1J1hVZzDJsPwM4
DQ1oUJBSXu3LavasDQ+3CEDnxgCMSlNBnYDlQstI91ZNlzps00wWtNW63zXgy0d+pONvYmNxT4O9
hoOqiEwCrSonlxCV5OixywVk8mwS276lfBg5zjU094xoydICOZEPw/i6V296Rc7TmN4EzGcXOAN4
GrKV4NH/qiaueMembTvCfjOOjcGu9NxB2us2eZMfcumxbU5iaZJFDuV+FAW3L/3Vomdxd7o50mH9
SPAyR+2b1ywQ+1QGBRg1E9nMZghr24MXfH7RsfRd4ciORF0PSkCWSM5YzFudZ9qHMkoWLYHLZW9U
GEWe4w84+Z7nU8fYB8LR+SwP8VFuxvLpEI3WYSEZLMal6hYoseEGNrxz49QSbHQx6xD5N6kJW80h
iE1tTuYyZEQDefuLLvF+S4YWczqU6lx4+527fmDqkUk+6BTuoxCiUS7dRBpnH4+eGqFa5Kz3Ea4y
BW45XGJMt+P6HwSei1tWsMScV9Bzb48T91zdeGfovHOqDyJbV8uOFEJy7BgMl5YLbSPpG0Ed4txw
K3k7j506mM8Mq0Rcq8+ILpoAX0Buc2FiUbStZyQaRSUX+s+0r486zc+kuAbSFTRYpR9YZMtLt/BW
PBkQR1WT0SXcXBNjhvDx9nsUwB/JzXvoLx18PkflZRZblwAlfTrI+ZC+CbOMTzQVFBnh1C6HEpRf
AwgLvUxlAwh8URhp6SbS5fW/XhWVEOJGeN22wp7TiTpP9sKcHXY64Cz9Dol0NhZx2BZYvEXjj2zf
xsWKG6PPAqwWHahsQIq/XPlRCdPQQ+0HJxjxbWyr5T9e3mytsEZpRqM/HKh5nnQ2zmSlK86LxBIh
9XBxxk/V9lgCZ3jmrcRX2dAXuSf05IisjYS3Q6OHzlk65+jc840XfJIwlq3fT3tQRLwNc0eIwc2B
NVnx0zBt+1dRTSe8F7Byko4FdrloQX44KZnf4BTCMgbrOMQQcw1vQU29bGyVZHc+EyjgR37PKQvS
v7dslvGktcY8jZzeEdg0/fGY0EbO3fm5RXB0K7Um14lYmFQVK3UctJVwYa/4OWHTzscxWRUnaSah
8mLB8vKMxHktAFlYD3y22mEWIoRsxaieom5r/8UWEbkeIp3tSBt1MoJ24dFxPSFxSHb++qW7XhQH
Q5ugvX5nneGCfVKfs9eIb4g09iwdnmVutL3r6AEJTKPu5v22RX1z+d4Ijt2E6AC0XN4oJnI8erDf
OCh7R8LrLJ9mwuLYa3EaG+DSarsDLvE1dvrjxWNMS+1Rb4y3AHM3wsHQh5Z2tIu69OjWo6L0VuWw
316HjlS8ySj0HUB6vq0i9UNnR70NuX7hQ8fySR9hc4sWmrHXSel5RZus9i59dsz2p6cj9zb4jj4s
m+GReoQxBJVt6arr3dRI/NmVH3o2pzZL0LW6QXk99EjzEegjGqUsLULfUsqi/gdHBXIoeOO17M5h
R/2/eKUzXdGlL0rX5psYsMaLDXf8Z59oMGVB/XKd1aGy6gPAuZvGnhgTtu4qDYu1H6YD7aUHB4uu
4K5fOQBZJw3l41YElpzKnCJHjlqhXU4gwydWgknQ4qfGOgG2hsF6Zx464W74PF1vIKcI5Q0sRym/
pC11JrHWbrByRLOdbeIPc2A/gTGmqsdo7PUJ9i1TH9H6HQylLrJAiUUbsShQGbSdQhya4Rw4caVz
lLwAozxxy/NTA1Jv+LzNIfcIP1Ic5sst/r/kJi3KCtYGfdd/pOsRPfvHDzeXMink8Tyrs9g8HJIi
boAcmFulHKLDOLWj1BU1WLu3jPMwT3hk+6ur9FmEvTtEcQzBYTaxePl0yPNf+G0JhJ5ybfWpVYKq
39MkGc0yBrDDvV5AOeLGKPSnnejLA1q29+OzSSF5JCJ4BQxOejSgH6UP1UcnypSXw+97FY1uyOap
2zVAIC/3yvPtUXJliu5QbyAKrADqW258k2MZzmdjSwOijdmc9+62VHo9isGN8AXPpI/Z5kVXmydr
PwyjiQzfUV0PoJwwWwTGONrZmWEAgxBMgTAp/aa/cnaK/wEbHKa/BA1zR/AQC1Rv/cXugrrmLNe9
USN5sJW3sYtfvIQImfcm1VQxcz8iCDrAqw8o/zKuIR34/JDvFw0N3gfA7X1vqnPIMBqrxLOEBHC3
BsOL7j+pPiG5IIqoRuzZck0P2o79UreXfeG/i4G+JR+d8s6Dv43fDkDRDZiTZdA7lNXgqSgKIIy1
yGotE8b5sUxkfAoHp5w+2prLmcwsYLyML3yR3zWtTmqJVPOmCFQJDssm9sBnaP/F/y725AF9IkJo
aMJH5SoMRMEf9h6XhyYPGkldIiqzKORAr6+rkPrXBnN5BLzv8ASy4r907EJXJyaSW7Jt4YiXw9ny
Z3V/GfTONpKXmKzs6ZYjBT7enKiLXwV0QcO71FzRb4EBfMnAfupSNADQ19GSUdEC5LiMUEniO+if
ap4vPwoRdXnARslv6mK6FM4PYLxbyJk6nDF9wTBI+M7QJ5IQDVkCYCsCvXFKfuVqzE1lSD8tjAuD
WOR0TqoydDHuQrIdCTQMeVqyeH+Acn7eINKkpEkbw0BApjvAxKI175EiqSflCgajDI9ISJ/T4Uo3
kp3Quycs8izapLG4KRVaeFdGIMiFAi/6F4Z+PPVZO0RgFJSWgL5clRaEF6pF1ZNmHk2mXptocrdH
x2djEn+ufM2bnvVERY1qSC7ZNd5chkpEh7OMzD2YGm5R3bnDVHGf8IXL2DRVswnuscpV3ZaEGcsv
RISn78HO9tDntELLZLbFLkDru4ya4KEMppNJV3FtV7LJfiJGJxjefZJV7jKRK2x4M+9YQ8FDt+vY
MxoWqD7tY9ThZGTwDo39/tBAx589NVZ9aNxAT0O/iWfAnwnqX6NTQSDW75vM1m+Y7kplM6DjuGVS
TWI9PN5m7G6w6Eb+mF1KnOVXiUe9mkZjBcSo0dB0TXBfZiDdTWA42PDRShkEbsmthElbVOkLKUGP
a7QmHUboaMilUzqIuCcrbp8CWkwIzLLKcBY1q8QoQB+XYbEvbBISmQbCWkKyvCHlVffSgbMw1TB5
Nyo8vdjlOm3qWAIXJfcWB2mJrWmYkto3r4PJgjli+Tl09Q5qPs7bRef1mEV1BoSO5v7BdNVvaNEu
EpvtYrOvlBOCdTUvS9UK9iaLq+DQ9WpseT8ab90+qUmjDRYYyq4+ETK5zRzJMieMGWPSsbuILePL
SmHewQnQMBgDeDpTE/VPm/+SRKzJnoqcLauOMFvIynxLpecR2ovRenF0yYNgwlfZ6hGd9/Bfhov2
cRi6MocCfNhfwJt22P9ijTXDaMgoWLE06Sr9NhDWw9LA8yLsA3wjZ/irNB08A9bl4ZYZoKyyYlCs
z7uePaF+EQrfuRx6zcD0Dm+1qOCwyPc6DVcKgxpQA78TSkM3rACMoxq86PiZGcqkY2bUmmNzcgAN
tUB8nRHJbPozcTlHnHbFnSr4ZXftt+u6GSpNCYFQ+qhf9f9twUXbS4rJXmhhNxqPNKioT74ABqaC
3/Pc34HjJFwfC3FSmwda2Bjj6Cvf+aQZIPYEYEChqZZV3wYplnW0h5mIULYBM3o5RzqRntCJ/q+B
AAMtr1/nNKUsyeQA1cYWmyt6Blf5GtAvJyqJibVp3Xt8EWHIhQKxUu20Rd622a5XTBMxE4NaBubD
5ER3Vmg+sJFLhjkEBJxUS5ZTs0Qltfcw0tL1TtsXGk/miBtvGCwbTzCm2sdP4PgdRWSbke6W/BLW
hU6b3ie4T+cHsS/7+2lzyDl8bcw5UVyyI5NNIsqM9cSlwGQZIryHD/vI1hECj7g9D8g2kfQxHqz+
uJ3peGuNumb21MT0bYSaNX1KfNjLyp6SOEecCkkrswvYJ0Eq7Cl1G1leWWqFp0JaV7vFbHAmdeBm
JqSwh+t1k873/uvAYaKsCujqYatEMSl47IGaKVoQyaFBKnSheJN80kKdipNjQ+iFSyZVmVYhCWDW
i5Dslso8iDYVf1wOqom8w8qSDW9XZanZgShtO+Yp6OWFR8VkuUCQkq8GKbhB6jrJkkVLvtSFtLLr
bJgvtQYuMNU0mRKdkmBY9+0R5S7TxukucQKVqbMsu+PcgQUSd3TDehCOIMe//X0qRQ33m3ferqG3
JM2p8RSumoclHFgs4qhKRiE3x+bI1xFSkDRFdfSvFBz+08r2DJ4yso2qX2QDJSiEo1QefbwtoHCV
IE4/VsQGoX4J3H6sib3WO4hGhR3XdrJ2kZALADN3wz3e94NjX/RvzRkqkJ8JLxZ9Nh5AYrP//Vfb
t6TN1c1mHv6apIGEYfoqg25aBOKSthJMcLU5qyDI/NIMlWoWL9k/aBB29cPpmFV4FoWG6YTeEF6m
p3qN9LtY7ACFtKs42DmaSY3E/dt2GRuCUumWjrF//X96Y3sRphOdrW60vzvhLW8rS0XFAiRLRmV7
U9hXy83ggjOiH/uc0AkL3u1lTGLiidHIj6fnOH6tcSZaSt5Czvz5Tw7UwYxg+wzy5bDsi5KsmK1u
G1hm8JyktF/Hn1yq7hphhwmvHufrc0/54a3qa8zuugijy8C67nRWIskfBQOvlKJhO0aEd5s3YoD1
NhmHWv4KYpK2hLc0ZsGpPFpaVnXigrffSHceHYUHVRbtixR7beki8+r6Hl+SmWMaTUhDyWjXus31
xRPjTUHPGI8XnX7tSKtwTm/bUPIv2GPpzvMP82Movs2qBsBBG0P97wO3pA0Y4hLDs/OHT57XEArV
5I4u8dTAZ38cyU4Z49JJ8ZJeCAncdH+uLQj2Qt742nzxm/TdxLVG8Xti/Eizw73nxwq1+zmaKkj+
HwDeeDDLzIdymvKWxG1HIYLDXojnx8O1u98bz+g9qI9jSLr0cObz+hPCSFbOYk8a9hjy576TDlK9
GKV81QZj4x6Yz4isD3xApRa0vTjsKMK9TkqLDHJfNxdR9MYuhU4/qk52G3zBIZdx4EnXkc0n3h8C
QSzGHV8AJt1dVg3HWFTeqBje6igbKtjm77S4ptORvVXCWsEFIgbu1QFcPlVXa7A7v725ZFyh67Bv
O1j2ZxZD0s0LIRcC+wZjoztiRJ1vd3W8PjAoxgjRVs4sg9cSeILRKfg5ebiBVTwxshihmlgqZ8uN
bU3j2hjEXTWvpQJTN5/S7axATExZiJQj1r0WXCQrJKGn9Fs2yWoHqXEdkE/OQYwb5YmjmxRSOqc1
l4L47J+rHNQ9+qUqvCF88Fn0HNKkiPiffLHQ5srGAWx9Zsk/W45smGuX5hbJvkfrkndlYU2fB9PT
qCf9sOJggU9EOU0YKEceZ6AUBPiBnWeOuUEhz+H1luGmA6S+3Pf0G27bLGkLdq1iX96/9fChUw8H
6m0dVYPQYhUrsv8iw/wr616qB8WukpMIQb6yblBvqEiJJfrR1+6Wct7Eb9g5uSgiBZ1qaOqvVmoH
OP7gtUNMSsPUTMEn8OkpL/7u9IMXZSkBqFRZGWP4BDrwFSe9Usykkepl3IR1Zgw9Iv2RhVtpVGgI
viSHo/h24Z0LuatZppqch9B+h4mkdSPHIQuf7IQsa8/QLh+MfVUKAyl4GU9q1T0GlH2RtygRGP8M
LGeonLkpQLBRIP2g8OHtS6ZMQsM2wBl7yPsfGBtsPAQzWyF7XsyY4t7Byy7BwVKqDM4/R52gItdZ
+308q0hvEy5SJuqZYTsiEg0UiFJEXbMZNRZQOIh76J8i2zUe1OuDlrY/1zH1xC3ngS+uxxds9Tpy
udCtk7P+FA75gV1PRL6K267hWiSq007EElNnTg/ElCkU5SSDqJ30teFckgjx4oDhN2aTehbQSQ9f
MN+Emh20xhE1smbaXyaM7DV/wPwwws/lxg5okPH+Z/4HaPlFUmeY3QiIvnTA0VGil4OiXBP4g2QY
y2+FwXfY7hnxi4cShthx3KtQMLvXujWvJH5ARDH/MLLs5heFsy55fx+b4jSMhZC9C5NosXcY4dl0
r0YIPabGTDtxsHcgMVy5vtyHIjQ+5gPazIgbuLcK9RjrTMq451KwxTXZfX+Eb2QATc+Bt1EAHKCV
GAv2r+wE6eN8vg/8NRYmJD95TLp+n/yEl+i6IjzuhYyfmK/g+veM3CVQSIIANGDKaX/W8bktuKvn
eA6RhD7jSJiKuXg54Q8OQxSXnRc7vA2yklAQkpy6cvPy9cgDajrpJaNs89ppufvS8/cxKNh4I5QG
3wMq1cD73KYTEMUj31QCCBuqd70w5xfdepUZMnQCTn0AeZGllQ3pLj9ZRVqRK+VXOXvbrf8FLx1/
ocH8bsqZ8rlYfrEyr7S2L2GI4tPHLmHIxgSpDe9kxG7ToIhdoIkvl55kpv+2tt2lVIJJAeqPWPqJ
mw7jZvT/ARKffuuE0zX3CTtqU4nszkZwh8SFd/FBYS8k4hTbSc2+R5C0o2fRG9wNq2iDzi0nnuFP
iMHdrAu5NsIhD8KQ2oLYWBt2wRoM6DIqc91u9wH6XpvOOeJ8lJ+u6fqVKQhJ9PBgl53zJLRnUds6
ummNPk8LSG0VvXsYL3pQZug0fAMO9FN7CylWeZW5Go+rMpJ0ulCG3arfgxWqQ5ihOhccH7aw2smp
ipqlOA8+C2qjVvwWBUy8/NTgAcnxJZX+6YjNPl89P1c1AUvT8a48CEJ9U/ODHYk8Y9eTS97wC+yJ
Y4WPlZtrMqSd9AIvdYlhKZK4qnMsCtC3wWREyArDtCyaMTusBWSPnim15T7/RMIqAtdSNtSznGH0
7FPMId/c3ZX6jxSjNUk244uzV2A77weLza5U9h6YMqmod8ptnr5+sScSqC9ADnRf7/dSflrbCx/s
xDwM4aKt95imauVujZHMQiP15wXVz5eCG7Vat0L9UoVf38XgQ/UYri3Z74BaMygbCbJIFOYUTk8U
6AlVkRLMDH0Rw0alL1esYN1KqnrTMZc8pZk+Mitk2FjU1KrHaVsSp3KbVLmYiYEpjRlvppAjBKKk
bwc9fUkyM6IWJJRoq0rxqeMyjPNWASTHa16Rq5y+/E+D9a/Ta4BwIIwjd+hkbv3XKjuL+i4YNQLY
m3Yr0DUjGNzT3MXbVo8oTeL9EzBUoKYvpy8JFdkRO04RoFrMQWX+gNM7AlTC/JMsD2xd9paRAfHz
jN4PRPkDui4d6x69/R5TCPSM5qloxwXonh6GD3/2ZgOrd6u7HVDEJ9eC2gcCnlmUM88ea5eARID7
8V73DdGGt3YpaNEJFYuP912PhIn3iNXBNybRPMuT3hEC3Nr3VafK+jwRPdMN4cp4hYXYVlMQMF/s
o0JZ1HQkYaV+EYYAyzLt3aF5z0WHp9kCTIh5bnaV5Wqs8LeDFQUYPiWIc2h1GdZOoQPR2NxSDrDe
gSU/Ct8GYQKmspMagmcVsjk6NRuhAVqd+bHxIU2axcx6N09l2/t9jQs6c6o1SxMrzeFiK+2WskOO
QbeN21xLxfvGrAy786gzwQvRXfykV7NojaxzyQRhL+F19AHjomf69eSmw51AttI8nT5HzQ3n/3Go
otITzn0CzBorI5s6xy6iL+5PlHWTFtRzd2kTcVw+NmBqtN1H8gRZcxrWNSgXuKv2Cudi4oiIyljv
2opV2wNsyXNGpuDzWZT1pAH1oUFVxDRO+JQnCO5UjuGqsVFs2tPOEg5NpTCoB2gveo/lzzxZn7yH
/JbX6W3p5YHm8j5BxjC4HMJuyQgZxfK54LK3pJ5Cs4eiDJjIBYx0YpXeueSxMpi3BVen62CO6nuD
hWOn4/cem46X/kDxOvy2+BrS3tJia+Q6BrxFD7q2E0LIMUIK9Ho4GrU1w/7VKivddSXOIz1r0rQ+
/P0Uqn0dJf29IpIowCamj59HOBP4ox37t8uckO7RZ54jHZj71JB8xFWWB7KfcfmY9rkRMBGZ9Knz
ACa7QvnFS/LHQNjilIdH8oL5boW6S4oW8j+E7aqZa6Y9OjNVwX1t4Tpw5Pg3BL8qasGjgyUfpxic
DwAzsuLdItoCJjFOW9G7M2PI017rJAluUTzrVwCqKjbco6Z7OrvbYzE59wt0tVIfZk2OEaPUBdbO
zbhfzaW7T0bWFMf7ksIBS5CC/sMe///OzvabULdAXbfe5Z9hAVgaa8seK47I3RZTlD8OPIm7pX6a
IJ0aAn+11W8vxA4ZD8zRnyBgY/p9potmVKTH0NlP1AZh2p7XbEOUOPMxjvkBRstLKgSuaTWJdJM5
oRCeRLleHMioBK5LtKTQcnm6r15Bn+6VqPizozXhKiGaK+x1AMFamoeRHttPDBGukr3EUMp4kZKk
ztz/6v/7B8nHXd5rOzIUaD3XD75nHWuUn2yX5KVEVGadm/HbvzzWsrUnkvuuk7xOW7H3Gx4N45DD
b3ORRuQcPfsu6vXjOQrLecJ/b65wlg7SqzU8E3oF+U8fwaQcbOdau97xevZH/+Z8cSjHNNEFxOKe
2ng42y8DeoRQf6JCy2ouH/9SnG4KR1q8hP1s4VMd+8PAO6crDYI/kGqAz+eS7IpCeqKRFajCqoiD
201Vj5Y/DZT0HjA0+lmNRglhVg53yRowhlcxSWnA9uMbVl2rg9nwydDY8FZBhn4vNLeLYnwzRuKk
LEvDxGu+QAbwJc/JqbtGrMHDYup8cYFWFvd/nVEBNh8WtOY6wt63f+OkOtlpAtNlvv022aJn5Xd0
x14qicpQALIhbluLU94IIY8LlP1D/by4k9jR/KLR2U0naFYjgiBQ+3crLVcOzdh5aTC+D8n10tuq
aw0b8HVfmxZGejIZm7b5ZxlqIDMuj9UO6/p6Q0G3tQZEALVJGqS5JSsuIOkOe/XOBwnVJGErUMpO
cXy+0TpHELRWAipSK397PBt7rIIwGGcBxFKNkgGdYV+JuPbXjthlR7grMFG5E7n0baEGgtxPvdj5
X2yVZrJ5Y8h+n5K5Jc5wAUkvGk79EySN3ciPyjHj5YPGyEYG76V8VtFpzA7oXSrxQpVa0LRf0YZh
OS8S375wLbNikRd/86mBqWH7MtPQQvtjBNfZ+Pv4QqondqLInxfFK2XM5h2CABPa45FNk7ZJSnJq
jG0jaCmlgUOEjL+LRw19o4531Hn/zT0QdF63ggjlqc6btfGj8rtYd22aXbTMwz8D/sYONs+I+XWG
YZxR1kxFrYzXqvEXFpPnz8mX09oYISmeW20EILJgv148/u9K0lVJVnHTSyboeqSSbdXWt9N0oOfl
ckwBty6hfj3bCHLedx5TuMGO+bEoO8nfwowMpCbsonxMJK4n9eQYtmnoCm/evncuURX1oNh7FXDS
3/zkv182ouLulq4C008xnDBRS5M+FyLPQmGkcf5yZsJ90tvpuBb6u1g9QkdIUceHFzXl2C3GujXc
ZZiPNXL2gYt5Y+ticUtNoNN8t9FyzcCHWTwtebqBD891kfn1KZBWwHY/jAHyhB/tEqqUcXmtGKxH
uTxpxP+PZ8Um6vpJsqhQWtF7PK6ayRuaT4mukOBtLncbhbX/E+/MPr9CDgXnCmBR57OiNl9g7Bfq
5AyVCFgClNmbQe3Jp2s5s2i+f/ph2Fc7QKhAWd9cWRMp/QYcog+ZXT1G1D9aAhuzJu9/t0ciPxwz
CzTed0Lef8abYgDRxlUHMqiEpE5kfkjXnhZyDoaWPrX8BPwMbRJBPB+Bd1NUP2efrieaY1Uj4bzA
d0qcZPE6czQfM066LUbu4fYl3ybLC4PaFs0hBomhpkSlrbL0vCFx5Bs3i/TdV72epoEz3+ilCZSZ
aRn31SKi6pNmNyoGCzOdt2Yrc2ViM9LFfI/PL0uHVcLFkSdsqOh4PfY69pgobKUQzxrJHA0aXFPx
XeKM2Jb3tDYTydNT0xyshycTRNQeGo5LVnn7UYf8BwsnclkEPAEYUPVQkBzWSc/0hTgIjR96AYL/
7PSWqud/B7aMwWgxfl5Xm1Xq2IfNCQi/6sXr1ouGB8EpPZL32+v1WeyK3ZRg8McLZ8G+PJUwGuKO
PJl4YfCJGh5J7B0Z8q9rBDMJ4RqCIaOy8JavBdM2VBgyoocIl6l+tY46m/hFdm+h6TvYF5yNZj7d
LoJ7pebZvdNeSLmc5wee30GhHc9F6qUjz0w+gC2nF3cQ5YnILiR/YON5rFUMFuYPqJ2FSBIYm6aq
YeIezazixjxk3o+PstkgapGpxmsLfZ44p18Ip1tuTQPwQBxBn61IaSNaou5rd8OPW8OLZ5+3Su5L
Z2eQMGDz7U8GRtWOFn9dmFG7rWzN0r5UYTCQNIyekvLv7I4gs/OdtICIcQAxc9MNf0mEmJkn3O5Z
ZWVHjq4s0d9PKNS1ZAhY0BXCv2QcZqwxX6l+ajw3eXipPe6Eocu6lvxdt5CltyobassVq6nPgoLD
mcSIjKz/EADP3rgUFATMjZ8PoLPNYeBH7/BXXXS2lOQuO0Kis6wNZcg0boAtqTQmt65XCzw+zorN
Ei/w6iyV5sZvImJcA11/3yJ7aHvXm+E9GRLKcRmsLsXLwegQEX1xwOSh/wBwr/ky+e5WDvV78Ugl
ALLeOoUvZJ1FN60kE1QaH39d62ntc6YSwrCw+W88d1s2UCAYiEm8JJp0T8A0x1Wn2OjCiNALwlUY
S14r+mh6IqDSq80lxh9+x0FMurZPfeJOX09hM4mtEfbICqEn3UumCrgSEqmsZqGr6nYHg+BcF4cK
S0ZV+LXmJhGe89JmvSdazkxZj7zNLY/viShS4wxmExNozOEBRSOHsgFawsB5d9eTmHuNh2JM/WV9
ymODauq0gT4OP/P9VahVnf6L/G1uWIK9DK7S74C0MXh6Q2CxRgMXzQnfYNAeitYawbrwxRjZbAKn
nCTklf3X2oY9n2dI90tIBnHw19iGc1oTg9+Kkb76DLjmQwYOj7+pZO4e89YEtGakqfCPcJvhVwIw
40KNi49uqOLCIagvYgw4YAy6+n+0hfnLaJD4lfXUl4p6VK/Sb3O7sif85BaAlUqJlFOuMrTSovtm
PZU/mLRAZurYJqvVuT0d/z3vEcvClfr+sLzil7Rdp82Wn3gSWJAGrJwW/QWxeP5Pj7SjvH1kPgL8
9awoTae6Jfv3zqbezGZIna43XcpkHU1qh+sOuGf3RS0TP0dLA5nk4TVAmvB5CXTYEVB3EX3X6UaI
lGawpjl16KH5EqRKv9aInS+N8yHVTZGtvZXyrqU9qN+Wt0tWr5YmVnYKBdnwqdOE/EDJw5mUlUbC
tDxz4Um39vuWawfsbG6dwRfpXllG7Ze/poBM75JSQyQppUjGSGyiJxzOA3FOCm8Nls0Bars2z9pG
1PiYqoCNNxQHljL1pzZwdC2fUvuWDAFmlA9A16JxO2eCUgbbjeXk3SAqMN2WPhv+NxTDnkhKyWkr
7ErbFWNKhgt3xJB0ju1snvHSZs5MMca+kG2ujdcxQt4aNBtjutlseIccyqUEgjcHURyjN3zghTKC
QRNYxFi8xhEL7b+b9WhXAORi6/xrIrh73H0EdeWbsfWeDNHDffUjV1fRHZ7oxuWTycUyqo3lxt5M
kPsLq+ngbzUFUewO3uLb/z4dUB1m9aQeEXnLSJBEgjIPLBlh8JAz/3W2c6LZ1zM1a+oNL0HgYrBv
1LsMaf/q04Fg6ETs2u41NZNI6pCjxvK6amL39Gp68Zckwit8O0hVXjZa/vyEREfKiS4U+eSXueAh
3UUEGwASza00kLhrWGvNDwugAcK9XcfLG14EqawYfxKo3kyMLidD4MpF2cKvaK+/yVFfQSP/qCmI
dTfZNO6nSN2mdz6PR1Z3dhTMMc3O+5OVCP4GqrPD8HdwaG9jD+loDgeV19jzs+1HBXsmW751hH8w
Au8JPhHdrftJhHpwQo9iUforwoEYs98WoLBCTO6+gE5eVrPK6b9GHO0IYDUyZxV+qds5rt+iAETG
ZjvPcWn0iXIjNiuZTTHhNREFwdAHyQrTgcc7KDOxuHkYjzaqCZx3lX49fK/Zi8GoMKx293jrM4iN
+G4x9jOFKLAk3+72549obPPcfVx4iIbyeXjHqs8yX3tmeIY6UzRLle6YRqlCyCC13nbQ5P2tu4r0
dlI0+xucNP/NUW375F8SWSc+IcexYoBkTptChejUtnm98J5x+nNySelIpEZTf+qwNCO/rW00IZ6u
NqinqWdjEt3fDLK9wnFcaHizvHRgyxInZibuqiyVv3wc3O+7llVavxc4cHt58iQSf/T8m5+L4NkE
cWSt+x2SDNTdMBTJs8+t9mUb37dyuFqO9uthD4ACmoWwMbyn96vZzswxO5etFfTZnKApe93UiYBo
RyY7rWqaLf8ewQfEDCLXxmTu/oINEB/t+w+IjfCsRpzQos889/Yq1UVffzujsUlQWp4/pZsDvGKt
RwkzYjHofQXEeHHkeksQEJSH241kXdGyvWjTwP3Dccmm4Uce3IZhGestP3JladWVSe4j7UH+/2Eq
8w2xk6xWGPHQrcX/pWgGlVAgTGbY5xiwe09eHNWXkpSmHnT4d5X2mfhZY1TWmayJJs0iGXwtqHrL
B6JTu9hR5dFLmLVghGLAxXpw1+rEApLFQ0d5xlyuTsaT9Kjm5q694rraZoQu+Y0VRCu7kPU5zk9W
UHVYl6cFoORetNsjjWBWVh2UzIvcQHO1XupEnj3nl+MYWd2TJYu9QNiFxb+wdnwUGqmiNEI6fdnu
Y/Zxo7iVZzGWCUqpxLaZ1Ne9S51rokj00rflbqaIB6Mnd2CA8FpmBcKYKbWm59FUtuETmRbA8rpm
7qiE9Scr/Z04gx1FhYSkj4Hc+ZMoxJQmMCrCQSmr9w3AYM9VnWiHZk+bmjfsEqvmUVFOxCyVlNM8
DMf5yJoAES2GqTVDaTiFFg35lR3JVpv+xYfUZ2Qdwo2dCX5ew4OiVFsDu/n0BH8lz03rDsRyFHSQ
M+eaw6T83pJSdJcFor1mSfdzJWFfwD886GpMWtHb6rh6gHlcawvC9Z4fMOODuoxGbvNBSRZttIbV
ynkevxQDhznbzBgwUh18p2ShADv2k9Kh4LaMCPWk9FvGGEEiBzhrIMDVhKRf1ffWE6y8VI8Oj8+v
9wKmfFJ4h4dPKvB7qvdeAUSQneb2Qr1OR+0eeMeNAUvqHx+sYnYq5e6kM9hOFpPTVq2AgEWQC5Yp
14fo7S0a686lvjZhE+0dK7zh9yO+wVWFRsaPHRH9+D5SRGm8WQSYBeCCtTaCHB/HrYcwj4OIEcy7
dhSaS5Fk3t41SNhY/bquJ0VFy+zvhtj1ig0XMcwoeSO0iFSo1JjXXOqrISnhVWPioUjE1YduD2Xm
fhjxZVMPpJVItOShMANrEnyGRT6IPOWrTPD5oeZFPn4I9meErPp0v36XfZ9vAIgTpIexApBEN94E
raYj0ucby/vrjrbz/dC21bPhvxG41gHDnA4a9ZiJlDNSF94YdP0yEZmxanM9CLMXIf7MPlGOG8VX
7oRfj4QzLAxPiqPbJM51k0kYP+RK66p9XRzrXUXF9yiVdXGO0QN1Y0tqRo4mn/iGA0/lvLr79GSq
S+GYVj1qDEYYyhTjBjz2kB7GTofyzWjhCpcsgYEsZKFlmyWMvjnz+4mbznp//QFXgnEV31iPx+26
HfpCBnEkpuaEgiM1qOzdzotHZEhVNMkLbL10AWvVpRIT8HZu/xZAL1GKXt+tkE37gr2C7tADbUvs
pFNhT0VB6PLWwdnRHy5k0leM+U9giog/Or0A3nJ15KLgSWI8+6veq6HqhKI6x55PT2oAcfNJeggU
M86AnciM4jXkFK5CBLUrEiVYJ2ewDO6eXmDPYOS+rFSWkCvtLZ12UP0GEkGt7T9/6WB8DGAtLRzR
qs0GDpUOPMqhf9GzGNE8oXGUHv5vpQJ8R2CY3LY5uNq8JVEIT4z9oMUzlW1fjowTBjbyY7Pa/km/
EEw8B5P7bCOZQtWtAsWH3DkK76adZgm5e3DJoC92Fp16XhXLgSXOj6f2wUvb1+9qlgHXVt+r3c2I
o3RG1Q7dl6sdgcPK6gSiK9ATha7LnhDMAKF7jgy9nJuU30++HOX1bXCXVH8LGj5d80o+/5xH/DUa
/OKXZQaL3to5dfNjkGlG+2bakLLVofJ085Vd9EPBvlJ5mnvTS6BaqHyTkKVn3A98mtUNEIadlRS7
UH15eAclPPsMpasdX8tP5FcmbeVzqzhy1/r6gtiRoibS/Rxu+WZf0rdYRu1nJbn7JiHx3tblRR9h
Z3nFXRN+QEgQG+KAF6bY3rZayk6nuMjSasN0F86+kBpgPQzLluqnRl3BzT8TQsohsZLzmrY+wKLH
GQszkiF1C7flXb/0EcRVSB4GbNoa6TLvc0KKYj150vFlhlj7z6aXvo7XUkxJfLbT4DZ5Ri0NzQLA
pwCh3lxSbDkN2TXOXkB8L1lz5inDMa9lnaF6/2CluLnnZV8bLwx2F6p3QpmCDxUynfJY22s0y4nu
ftezwN/tak9C/+Hwc/MPWf7FCQgodeh3WZpOxWsRJBjK8olJ+R+6c1tuoTmwsG+9rSKGJyxnUTmK
h/ZrNxwtoa8REzSaDX50dBnmXsJxwQQeJhJV6StIC6vFLw2G3iJGpLbGFVnkfE0a2b4k3IkpKrBv
wnaLYaPWrLnYt2FniiOXK0DZ+47j8QH89zHsy95Da9mCoYsASHamGqNF/Vb/rCVFeCJpczQtmTEx
C8uqhT6QRPqsJKxFMh0ECXsc0SvpLXKKpw6GNcxrU38OKNIvsYucmyLLQ6LWc7cVXzpfzFxObCwR
t5bppk2h99oWGwlbos7dyXQbeJi5nRCPfjUrhtzC+mkxzlzpiqVd2VmOOxj21eTNJj4lGd0sa7Ts
UE2hNedpaAXJpyUQTTAPkajvFTY9PJvKTXI4D03oE+ZERtQG64a6l3CYFGjGTKdgDdkpYBQKtV8D
Ne3kvKR//k6957aLZlr6L/HRGHKO5clXSWuQcD2jqmjXuy9v9tlX5lApUiw/n9Jpzqm/7A8Gkf7e
hLhIG8kmn2JPZUiiBn0PH6+/XBdAAFNY/M3X+nhHpYPPL3MxoYAAny+JykqNkd7VUXxo+feUS+u1
j4/Nv6jSj+Ne5JzCDgXm84XiT/mOSyAkKUg3uN4Da7P5nlgUW9KGFO0RoXOtKMBQ6ldpv0HQgErT
DRWCulfk/c6gOZ5TFDZrwcLRPEInaBxiHMiyq0QvDokovSC/+IJLZvC04HzQdY6xcAxbo6nB7urV
KTMqLwkPm5XI/ynuA9J7FDwtUcf+r/h/NnwFrWfBydfGDWBzmS4zeK2tG9eRbxoW054gs/f7XxvJ
Zr60WKX2Xj2rqbzhRVLUYuKsRjuBtdukZQChuJg0l1qdOUHlr8YiEq8AkZx+2t/t9PTG8AoT7zW0
gblSvf5ua73lDQwtzDYJfcxsWADpaZM7+GxTmI/3+MGUXCGXaLdkvOiZiQt5wj0PmIULVSHBvSWe
KBrOMFA/TAhlyflCeeHTXcA0L4fUAbVaXoh0XQCCkfQchyyRWAawG4EfyQp7/JdORJajH04Qf8iW
i7SkAVT594TuSDW4tfOE0MnswE6bAEBwr8Br084YiqmiHpIsKQ9HJt83ZA0TnNjkRvNBwwnOBD6D
Hw9y+ohUeXkCT4FIEhizcrT4XfdwmjuQM/WIrLiz1fvz5WxX0rhBD67qQMT7UtkqDntgDxbM20iQ
2toJ5HXs53gAzS02RgFOhPacvfhnEflllEuT/SCcLiJs8qu/ULcOJKsfdVXjysMZUnNEQRAyQSZ/
AKvsj6xy5dhtMOF4jlEKBQULQMFwsislaH0cRpJBXqdShSkuZHXDUjvcS4T3/2jrMRdg9z/mbrtr
QXjXsucn0GHY6UrSLk6QwaQZsJ/EggzWTVWAEGggyL6U8fNEkmK3d6aIyq5WJ8gKwTzaiSb/INOr
Hce7yOyGUHyOF3DOsdKs9I250ApFQNstCfzRQZi8a5JlP5+nhwHGWUeY68aqR7c1gPgamfjS1XI9
n4/06gAxRvrc/Gpk7JxxdyGT56A7zTM5iEWpEdZg9HhI1f/u1lwPXKeYryuISKUoBJ74ujV4ulJF
FVG2z8kFzdhFPY3BkgHwqA0Mc4JWegihDkLVYJJUBgIvDFca1VljD72sOB8L4gSzKpcXQopm4NCE
Hh5OGtmaUYDcHhhsmg6BTJF650yAHEfFI5KmhzmUsECv7HHPuJ4wK48Jodo6m7ekJvwmNW2q7cZ4
71TDW61BUrZb5QR+J+0K8fCoFoil3pEWimpHSwo1Yv6Yy9KiMGry1Z7KLCMcH31KHoT3rvwa1ao1
2o1ae2N6uaJUw2uAN7pcwwaflfpUkFv6c+fguMt4iiD47k7NWm/GwTSXAsko7Bn+crSt5pXKZ86f
4uNLntkdNgexPFkjXEMvzbOmvXenMY/fWkzHARPXAAVuNz+8O+yiOEmY6Z9afQ4zRynOpELct560
cfO/Jtc4YOxq5XV3VmZDFS3YjL8kxl3X90sciNXbkRExtzdLte5vZ8BoajEwzeuKiKIwfWl7t1Hf
m7cwZuiM1ZZYH7EyvH+BPKsFK5SMEcv8U4+7hMN7ckMm2NF7w7j6DLixHUaHGziQyP751j9HZ6kr
11kwa92YPthr4uKctkMpx3A3L2vuIIy0euieYgZYH1eDA7gmhyWKcEWlNl2jVvW0G8c1YjZfDMP8
TwgLtyNC7ietKgueFOwggEUoGFGGSvn7FDN44e1L6sbv7oX0kk5cp6rCc+jPjW7L/bZnvvABWZpb
TW6Mu+sYearD0DzAQUX6ZHvrCsl3xfYYDgtMWX2NR7cFFL3j8jIVsHTHMlAPuJ6NX6/HnKjWVUuE
94XmMyfaoA4XdUT0zG6cs1Oesj44/XeL6XdNfKkfod9r/yS1SSw1ULD2GE/wX7mUAriZYuFK4cZ+
G6FhHuHa21lisBmM22vr8rNCBgagbexTzBm7K5eNi23nQcobx3hjcUEkg5V6OYOwlxwh9T8nz7Ty
9KJpslDXqxjHvOv1YxOIu7qAq5LZ9/X/DceeyLYleEhEUOOllAEONXLd7aL/7ka9dyrL7/Dqi+EC
wPJ/OLNY3dcPTadZm7XqvrLKX6a9vCSI4k6tg5R71EniYzLMEjybm16mKTxyRyWV1mMMzowGm0iH
1Ev/N6YvNiWDdxdjnURLSDtUrMCD27tFYC1uWTpc8S0RDlJmzLulqvjEIIdNXdlztiR8Zsj5dspt
Ty2W25i5nD0NRlh++8pH4Kf9X8hAjXfXq8jHdaBo6iaLOQlslVLRA545X43D3qd+C17Rf7/b3CDY
vYX6s7ebKnJFOt5P01gnu4/nHf3eBC7YbZMIeb1xo4IqcCyQWU1CKzufpjh0J9Q+rRuBiPurI5QJ
/LOfi9Vaw9x7zcimXPgJteiP7YV8Ip+yCwY+iz3I5wD577g2PzcqWFiaNd3GyFRDbsvr8mSsu6KM
YuZyE3ddgHT59WwshLcwibFkSioraXOtwUnZhy/6l2LG+M6u1MhoY8pdOPk6L8f/ZeQmShR6w8ja
zPvTMM9GazoQwZAmPHG9eePXWbAr5XrloJE9gFryeLwQgMEw37MrDZepGsvcDl4Wk6h0ZpcmCOCb
LQq4nToYuUgUVgkQGRtVygH7cvWuaVO5MLB8ar/ymWTDR5Ga1XlC1IV5bX4zZzu0WTvpWPxNUQ6G
l+amEYcG/7jek/bUijdbqb5wDQfTrzKVO3d/SS55OZlhMVhfu/alWQ9VNVfLMpXH+pJTdyMTbZFz
WC+4GJMH9fSA8GS5DGR6btXrPDFBa+Lqam9E6Xh3Kb1Y9sZ+xeRO4458JPWlLmbNexTq0MTiOjpX
91cvXcP0wHURIg0AVsYMwTlaPGI3DZJwDPpwjBwSkDPQwR4rMeuLXKjk4YtXxy/t7MTLso6ohntC
an75C0lwIWHC1Kh4ghC82ymfKhCh/Ss3hvtL5MRvTaLT7MOFKNY+Y9O3QWTcfJRnoYUpe5qIH1dF
RcSu6z8eYSTrhfASjXp2GqkA9ancQA2yO4YfpxHzzB7hhEbLxzNVjDr/17HcWJOZ2TJyfT2QbFjP
E4G/8wnafJyqcZteZA+QSoSpCf5bxHY+646woUAS4GIel3YYS9k9KH7MrXrHzwqiBXlTVzEL4HR7
5BOdNPTuqXL2pTB3ybEsoU4twbwKzFTSGa09skjU5um3LJbG13dEJYMyLfcsS0akhfP2C4nMm6ln
Cmge3TGr+nhPlY0dPoAQgmaAJ3fN0osr8YnV+0wS8hO8Yt/HjHteSXk4LtbUUbb/YDYAIfadB8UR
uf+cY4zitO4VpuHS0nb5Z0s+uikq5hHgHaPdgI4lH0RUvWqBFYuDQBbAxxRBSuhk2froIk8HrEjG
OSTfsZ8JwjKyndFawzWS+V0mdjj7twDJ0/m7nMtO6pziQphqzuT0/rNTnEI1pGZZ9lrCiB+XCmVV
mUno49+uNF6MlPwZrs/sNIPsWb64Nk0DivwKYDPsvTttQPDYBDwBQSqqr3HjR1RAMBA653yPEje2
50Pys9O2zUBKoOFv4+PkJTNcSGTHWDTtStuSeY/O9VCBwUC8xHm63nho5MS25qnXLA/Pjf3j55g1
rpwyDJmd6g6F4ew984IWd8vCmW4/jDfg+JmC6O1QpVGyLy/WGhgJSwKNuwi27RUTHvewqilQBYdw
HowR6LinDFU8gHLIC1lb9SzCeAz/JBW9ZvnM5wSAPGB5e4Zsi34ss/a/KJ7zho5dYEl2SYhWVmaU
4C5p67vY0R76i4VbC8+CNp5ZEbV/De3gaI6556alvwk36QWP+sN/5hkMwHkLnEvEU/xALxWbAVOC
SZLprENgm4+cYMk6te602ee44VvTLcEgfHGmVe209t8YQ9BjQl8Kub5dS1q1uILUYoK/LKAyXT5f
iqQlnQDUQ3cMRzuvcfrUtBMJCH06TQGp4uZA1aO6aBhWOHpEGD6dJUoeUx6M28qJ1ceUqniQkU1i
Jjb5qtK0XahtHn9b+qi/8tExxzwJSYxtataJg1I3QaE7NX337cYZIHl6jSymRCWapbF9u5t/+wNc
ckArtMGpE/mwoZWRhQjqUW1ANkRSht5zU9zFAYdHehU0wmIWmyFGRCgcEh+bkHxsAn3dckSdimtL
3xBGZ6uKzpTBtIVuPDE42Exk9lhuRCD2TOAGImmUdvHQmu2xO+l2xa7615/SL/rC3mH0Zho2LFg2
4m03aU+MHYUBKw7oHfNyXgsB6iwX7ET4vPNiUeNLipKUwAMCquiDuLT+W+/e0H7apZ6JdgQCsRcR
2Xt1tjHdVMEaR58E5M4brETPa4a482mkce+Rs43U9RobjyLDo1e1Cw+QrqLFINVu4V9FCG4/7bP/
s4Bzg6S6L6w5s33fSxcL2dJC0lQmHWniQynKcROrVlVql/22jq/2ZjzU3MuQIA7cK/i/HbqaljDO
8f8PjNilb1JQFf2L3U0QqbjabcxJQWL7klCU0xXKoXt1GfF6H2BSixQBrhad7+OzyjyTfjlx8oLu
FWbUFP2P14zy8Qg1N8jALGf3xil5yqrMc5GmMSGLg+FD2Y6OFepbGjrLTP0NdTVqzUUIr2MLrZfy
1ANhVuMJeW45pNt2c59EswAanOiVXzeaX+IE7S+vIq0FjSUuSIxCNeU2A3ktArhrvug/hn4L57y4
4cernpvwVGI+BvP0Nef/YZfeC3tSEMFQyQaBosRhR52FIdvjYxncjB43sBcfEW3W5anUL+MIcQeI
0l5DrSOeubRfM4Y825sGPq51TlwfR5zN3nb7kH44Cx0g8T8Y6iNjh5fiiRP+I3YQKdDXbqVSYE7o
udbb6CoWtCxpZFuShk5tKL9hDz5H7h7Z7IF4yoToCMudtm7gb2KQLpmbri8vl8uMe0cr+LtWwoXF
Fe6pBA5tkcriHKCK5q96Mua7IbsJyScav0DOhHvq+IBaViV2y2tzjfQWgY4LmUMYppdBYvUVPRLR
r8K/XEIIm8Oqqr3vksQAAe8Ce9rKRa9uZuBPVXhAValGi+ZnpjDGsWIFWd2ISh4T6QkJgx0LM3Z7
p2xOQO6gDB7xLl/xY8Xi/D4aa9UTgLEtDT7wMaQT9f1vYoOvSPrpLq9WmYiJP+3YZthpTABoOwM+
byLuPsdRi9xZ993hNCeRTf75pBu9+gkz0lbkRH7DSA5SZkY6f4R4YvgF3Z+kTiqJ7ahS+ZligGYy
Fqry6ECp++sC8mYOPNOGupwiIC9GpOFg550Wam4AH56KbXZWdIIhJybkYB0etNA/N6UI6kcA9TeB
n1AestTNkqsQF0xI3txKzNA9fZGp1k2uCiKKsrniI2bNf5v0zY/Hv8Peh/uzRCeOnXS6kGwhDKsP
fR8qhsP7MiJCEX2DTa1RsT68j910AumYylpsRbcXmYHgZ/JxpSuTOoFYF9VtELoGA3zt46xUixMU
PA+7nJBO05vS1eGX/D1quFd9C1a0l+A0nOEd5DiW6hPUHEZkXvEurqjS62S0XEld0WRpUkmZzzZ8
wM5P2qtxlhXR7i5WJkaMnbxpDu5kIhP2kYw4WO7nMy/m3D5lS8D9sFS3lqo4mmPFKpjLUEODuS7H
u7CCg2Ju+vYdkalEtZIfPodhtPFJy6TK49Z+nyZ7HnBoa17+/VInrWv8xWr5dcKff6pmO6qlMq9a
oM1lnwmZBTHJxYQ4Dq+/8K73JBii0YnKr9YeGRHbhmJxynDV31ZK7fGRaQsa0irB9y0ddy+RwXjp
GeX7dAWh97nAXa5TwjPUbOokFVRM33qYQq7wFnN4G/kLlAy/LdmaY1Hcspy6sfFCLfayMqH1jZpc
cZODGvt48akLzkyHPBJ7I+xnpIiKT/e51aI+/urmSHDhdOEjpESwW8Yxc8wiv8oUOkSFLRQyUvll
hYz2Ue3MmwsmB+Mdq348afow+dY2h32sM5HSteRLIYYYR9McHKpKKvDCcTRt0BeJC7MOSGFauSeQ
tGzzd6hbQKsarohjNE8GOB7p0+COV0nLtRi7BkskPt9P33LuY8G/IP+4hPamsp48Gke04WVA3aSv
zR90iir5le1IRRWd7lhxtTfrYz6dtwE1T9j3prUBpziHKZo1gNL6ngjaqQLeD5X2G4VezD2NvOHw
PV6rH/jJUv7fJQMHNL2bVmweLqR3krF2B06X4/VSD6z0I9EhEf38DWrShZltuvP2diwcFIoCrypR
gxmsMgIg+MeoH9mxIV7ghGyz9Kp8C1t44f6iaO7liTMDwaK4YaFnxH0CkPia1r3VxgOjvD0Y2F5L
XNl6ZV5zp9gZQNhjOZluxH0AbaUlZLmcsfNQJElqczVVnF+kYWIriH0GoKjsqqt4aS8Oegb5VQSu
ljv0xI92UXYblNW55tqlSCdaDxoUhwxBs8uPBwlqnI8lFs6194Jbkk3bEY/aDtj79RdXSlFMDFKk
os3nwdx/ZQ3YiV8SNw/E9iDdhB9SCxO0qTW5AjEvg2WnbuVGdBqVAA0kLP7H60BpGPKKPYZo7NMO
b9m/CVUsK7TwgZFNAX7lmKo7BhODT4K60uh1xuPoCmaXN5pTb9IXqcSq0U9AMeW5pvtEK702jsuB
XybhV6IQacfJMrPmXPYG8SVJKUvmaY8MCsjEbhB2jyxdmMcW4harSYnWN3Nu5bmQTy1OjZROzmL2
iEhH3WlpR2e6dnzo8AWj9WqhMrKWCNWslkN2XCwLlK/cvlpQElYPJqBQm1h2FHJdASczupndEL0U
Z3Wx23AeOJoBT9VBwIwHq3IHDThYwfWX0N0AtXCVLy8D+vO6ESflI1FQ7acCxjnxB47M+t8VUxb5
aLs4bbitS1nAJGvdma1YcLC2/CzgUuThY3W8xh0VINbPl10jNIkUm4IINSEMg6OSiLEuXRrg9mow
WcjlnlLxYDGKSy9lMYrhUwUVg/kik0XUBY+QSPE4TVozMz5GGpeJ8UopgEqZTQqLy/p6XKvuI6nM
p/YaxfaOSZI45RxvPNkr73WeU1G1VtNVv6bF+9ic0gyXOQBtAieW85DC7SopCP9qcfydSCE3/9bs
4xArwoPYPt1ugjBzL5d5NVFjYew7dJ9O35mv2CvJUjG9jjUJkT/KHOjTmNZcgN/ZHkVGm8n6Kbza
DbU6qcGzv6561pg9lfpwOoxwy4SbX8BSN50+jACEQqD5nbGogv6lccuaCVMSVDGIJlWUSo9IgR7m
v7JLMTamGXY+ERx9lL0fkKu7nHPye07UFMDRtK9jVDXh0K4GLz8muWbdx/TtATnMUoX4/x1OCCjF
koycJGZSmfNrLQZkCnM1Tnq81pNgHzXOrPNHv4wqe2jYsd2JZCJx0g5Cfzd6zXP2KtEmLuB5uIOU
O+nB+pK3zs2wfSHPPApGJGTSahxSx4q8Qgak56wyKaonTdJf+JDZIFt5DnguPbh3
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
