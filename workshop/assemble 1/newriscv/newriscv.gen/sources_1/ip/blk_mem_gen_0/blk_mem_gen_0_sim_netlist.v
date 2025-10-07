// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct  7 16:00:28 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/inbed/LibreCore/workshop/assemble
//               1/newriscv/newriscv.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v}
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [3:0]wea;
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
  (* C_BYTE_SIZE = "8" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.96495 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
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
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
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
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27920)
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
