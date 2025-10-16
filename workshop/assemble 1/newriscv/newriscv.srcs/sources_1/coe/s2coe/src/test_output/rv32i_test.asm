
test_output\rv32i_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000f93          	li	t6,0
   4:	00001f37          	lui	t5,0x1

00000008 <test_lui>:
   8:	123452b7          	lui	t0,0x12345
   c:	12345337          	lui	t1,0x12345
  10:	00628463          	beq	t0,t1,18 <pass_1>
  14:	3880006f          	j	39c <fail_halt>

00000018 <pass_1>:
  18:	001f8f93          	addi	t6,t6,1

0000001c <test_auipc>:
  1c:	00000397          	auipc	t2,0x0
  20:	00001417          	auipc	s0,0x1
  24:	407404b3          	sub	s1,s0,t2
  28:	00001537          	lui	a0,0x1
  2c:	ff050513          	addi	a0,a0,-16 # ff0 <_end+0xc40>
  30:	00954463          	blt	a0,s1,38 <pass_2>
  34:	3680006f          	j	39c <fail_halt>

00000038 <pass_2>:
  38:	001f8f93          	addi	t6,t6,1
  3c:	001f8f93          	addi	t6,t6,1

00000040 <test_addi>:
  40:	06400593          	li	a1,100
  44:	03258613          	addi	a2,a1,50
  48:	09600693          	li	a3,150
  4c:	00d60463          	beq	a2,a3,54 <pass_4>
  50:	34c0006f          	j	39c <fail_halt>

00000054 <pass_4>:
  54:	001f8f93          	addi	t6,t6,1

00000058 <test_add>:
  58:	0c800713          	li	a4,200
  5c:	12c00793          	li	a5,300
  60:	00f70833          	add	a6,a4,a5
  64:	1f400893          	li	a7,500
  68:	01180463          	beq	a6,a7,70 <pass_5>
  6c:	3300006f          	j	39c <fail_halt>

00000070 <pass_5>:
  70:	001f8f93          	addi	t6,t6,1

00000074 <test_sub>:
  74:	3e800913          	li	s2,1000
  78:	19000993          	li	s3,400
  7c:	41390a33          	sub	s4,s2,s3
  80:	25800a93          	li	s5,600
  84:	015a0463          	beq	s4,s5,8c <pass_6>
  88:	3140006f          	j	39c <fail_halt>

0000008c <pass_6>:
  8c:	001f8f93          	addi	t6,t6,1

00000090 <test_slti>:
  90:	03200b13          	li	s6,50
  94:	064b2b93          	slti	s7,s6,100
  98:	00100c13          	li	s8,1
  9c:	018b8463          	beq	s7,s8,a4 <pass_7>
  a0:	2fc0006f          	j	39c <fail_halt>

000000a4 <pass_7>:
  a4:	001f8f93          	addi	t6,t6,1

000000a8 <test_andi>:
  a8:	00001cb7          	lui	s9,0x1
  ac:	ff0c8c93          	addi	s9,s9,-16 # ff0 <_end+0xc40>
  b0:	0ffcfd13          	andi	s10,s9,255
  b4:	0f000d93          	li	s11,240
  b8:	01bd0463          	beq	s10,s11,c0 <pass_8>
  bc:	2e00006f          	j	39c <fail_halt>

000000c0 <pass_8>:
  c0:	001f8f93          	addi	t6,t6,1

000000c4 <test_ori>:
  c4:	000012b7          	lui	t0,0x1
  c8:	f0028293          	addi	t0,t0,-256 # f00 <_end+0xb50>
  cc:	0ff2e313          	ori	t1,t0,255
  d0:	000013b7          	lui	t2,0x1
  d4:	fff38393          	addi	t2,t2,-1 # fff <_end+0xc4f>
  d8:	00730463          	beq	t1,t2,e0 <pass_9>
  dc:	2c00006f          	j	39c <fail_halt>

000000e0 <pass_9>:
  e0:	001f8f93          	addi	t6,t6,1

000000e4 <test_xori>:
  e4:	00001437          	lui	s0,0x1
  e8:	aaa40413          	addi	s0,s0,-1366 # aaa <_end+0x6fa>
  ec:	7ff44493          	xori	s1,s0,2047
  f0:	25500513          	li	a0,597
  f4:	00a48463          	beq	s1,a0,fc <pass_10>
  f8:	2a40006f          	j	39c <fail_halt>

000000fc <pass_10>:
  fc:	001f8f93          	addi	t6,t6,1

00000100 <test_and>:
 100:	000015b7          	lui	a1,0x1
 104:	f0f58593          	addi	a1,a1,-241 # f0f <_end+0xb5f>
 108:	00001637          	lui	a2,0x1
 10c:	ff060613          	addi	a2,a2,-16 # ff0 <_end+0xc40>
 110:	00c5f6b3          	and	a3,a1,a2
 114:	00001737          	lui	a4,0x1
 118:	f0070713          	addi	a4,a4,-256 # f00 <_end+0xb50>
 11c:	00e68463          	beq	a3,a4,124 <pass_11>
 120:	27c0006f          	j	39c <fail_halt>

00000124 <pass_11>:
 124:	001f8f93          	addi	t6,t6,1

00000128 <test_or>:
 128:	000017b7          	lui	a5,0x1
 12c:	f0078793          	addi	a5,a5,-256 # f00 <_end+0xb50>
 130:	0ff00813          	li	a6,255
 134:	0107e8b3          	or	a7,a5,a6
 138:	00001937          	lui	s2,0x1
 13c:	fff90913          	addi	s2,s2,-1 # fff <_end+0xc4f>
 140:	01288463          	beq	a7,s2,148 <pass_12>
 144:	2580006f          	j	39c <fail_halt>

00000148 <pass_12>:
 148:	001f8f93          	addi	t6,t6,1

0000014c <test_xor>:
 14c:	000019b7          	lui	s3,0x1
 150:	fff98993          	addi	s3,s3,-1 # fff <_end+0xc4f>
 154:	00001a37          	lui	s4,0x1
 158:	aaaa0a13          	addi	s4,s4,-1366 # aaa <_end+0x6fa>
 15c:	0149cab3          	xor	s5,s3,s4
 160:	55500b13          	li	s6,1365
 164:	016a8463          	beq	s5,s6,16c <pass_13>
 168:	2340006f          	j	39c <fail_halt>

0000016c <pass_13>:
 16c:	001f8f93          	addi	t6,t6,1

00000170 <test_slli>:
 170:	00100b93          	li	s7,1
 174:	008b9c13          	slli	s8,s7,0x8
 178:	10000c93          	li	s9,256
 17c:	019c0463          	beq	s8,s9,184 <pass_14>
 180:	21c0006f          	j	39c <fail_halt>

00000184 <pass_14>:
 184:	001f8f93          	addi	t6,t6,1

00000188 <test_srli>:
 188:	00001d37          	lui	s10,0x1
 18c:	800d0d13          	addi	s10,s10,-2048 # 800 <_end+0x450>
 190:	004d5d93          	srli	s11,s10,0x4
 194:	08000e13          	li	t3,128
 198:	01cd8463          	beq	s11,t3,1a0 <pass_15>
 19c:	2000006f          	j	39c <fail_halt>

000001a0 <pass_15>:
 1a0:	001f8f93          	addi	t6,t6,1

000001a4 <test_srai>:
 1a4:	f0000293          	li	t0,-256
 1a8:	4042d313          	srai	t1,t0,0x4
 1ac:	ff000393          	li	t2,-16
 1b0:	00730463          	beq	t1,t2,1b8 <pass_16>
 1b4:	1e80006f          	j	39c <fail_halt>

000001b8 <pass_16>:
 1b8:	001f8f93          	addi	t6,t6,1

000001bc <test_sll>:
 1bc:	00300413          	li	s0,3
 1c0:	00400493          	li	s1,4
 1c4:	00941533          	sll	a0,s0,s1
 1c8:	03000593          	li	a1,48
 1cc:	00b50463          	beq	a0,a1,1d4 <pass_17>
 1d0:	1cc0006f          	j	39c <fail_halt>

000001d4 <pass_17>:
 1d4:	001f8f93          	addi	t6,t6,1

000001d8 <test_srl>:
 1d8:	00001637          	lui	a2,0x1
 1dc:	f0060613          	addi	a2,a2,-256 # f00 <_end+0xb50>
 1e0:	00400693          	li	a3,4
 1e4:	00d65733          	srl	a4,a2,a3
 1e8:	0f000793          	li	a5,240
 1ec:	00f70463          	beq	a4,a5,1f4 <pass_18>
 1f0:	1ac0006f          	j	39c <fail_halt>

000001f4 <pass_18>:
 1f4:	001f8f93          	addi	t6,t6,1

000001f8 <test_sra>:
 1f8:	f0000813          	li	a6,-256
 1fc:	00400893          	li	a7,4
 200:	41185933          	sra	s2,a6,a7
 204:	ff000993          	li	s3,-16
 208:	01390463          	beq	s2,s3,210 <pass_19>
 20c:	1900006f          	j	39c <fail_halt>

00000210 <pass_19>:
 210:	001f8f93          	addi	t6,t6,1

00000214 <test_slt>:
 214:	ff600a13          	li	s4,-10
 218:	00a00a93          	li	s5,10
 21c:	015a2b33          	slt	s6,s4,s5
 220:	00100b93          	li	s7,1
 224:	017b0463          	beq	s6,s7,22c <pass_20>
 228:	1740006f          	j	39c <fail_halt>

0000022c <pass_20>:
 22c:	001f8f93          	addi	t6,t6,1

00000230 <test_sltu>:
 230:	fff00c13          	li	s8,-1
 234:	00100c93          	li	s9,1
 238:	018cbd33          	sltu	s10,s9,s8
 23c:	00100d93          	li	s11,1
 240:	01bd0463          	beq	s10,s11,248 <pass_21>
 244:	1580006f          	j	39c <fail_halt>

00000248 <pass_21>:
 248:	001f8f93          	addi	t6,t6,1

0000024c <test_sltiu>:
 24c:	03200e13          	li	t3,50
 250:	064e3293          	sltiu	t0,t3,100
 254:	00100313          	li	t1,1
 258:	00628463          	beq	t0,t1,260 <pass_22>
 25c:	1400006f          	j	39c <fail_halt>

00000260 <pass_22>:
 260:	001f8f93          	addi	t6,t6,1

00000264 <test_sw_lw>:
 264:	abcd13b7          	lui	t2,0xabcd1
 268:	23438393          	addi	t2,t2,564 # abcd1234 <_end+0xabcd0e84>
 26c:	007f2023          	sw	t2,0(t5) # 1000 <_end+0xc50>
 270:	000f2403          	lw	s0,0(t5)
 274:	00838463          	beq	t2,s0,27c <pass_23>
 278:	1240006f          	j	39c <fail_halt>

0000027c <pass_23>:
 27c:	001f8f93          	addi	t6,t6,1

00000280 <test_sh_lh>:
 280:	000054b7          	lui	s1,0x5
 284:	67848493          	addi	s1,s1,1656 # 5678 <_end+0x52c8>
 288:	009f1223          	sh	s1,4(t5)
 28c:	004f1503          	lh	a0,4(t5)
 290:	000055b7          	lui	a1,0x5
 294:	67858593          	addi	a1,a1,1656 # 5678 <_end+0x52c8>
 298:	00b50463          	beq	a0,a1,2a0 <pass_24>
 29c:	1000006f          	j	39c <fail_halt>

000002a0 <pass_24>:
 2a0:	001f8f93          	addi	t6,t6,1

000002a4 <test_sb_lb>:
 2a4:	09a00613          	li	a2,154
 2a8:	00cf0423          	sb	a2,8(t5)
 2ac:	008f0683          	lb	a3,8(t5)
 2b0:	f9a00713          	li	a4,-102
 2b4:	00e68463          	beq	a3,a4,2bc <pass_25>
 2b8:	0e40006f          	j	39c <fail_halt>

000002bc <pass_25>:
 2bc:	001f8f93          	addi	t6,t6,1

000002c0 <test_lbu_lhu>:
 2c0:	0ff00793          	li	a5,255
 2c4:	00ff0623          	sb	a5,12(t5)
 2c8:	00cf4803          	lbu	a6,12(t5)
 2cc:	0ff00893          	li	a7,255
 2d0:	01180463          	beq	a6,a7,2d8 <pass_26>
 2d4:	0c80006f          	j	39c <fail_halt>

000002d8 <pass_26>:
 2d8:	001f8f93          	addi	t6,t6,1

000002dc <test_beq>:
 2dc:	02a00913          	li	s2,42
 2e0:	02a00993          	li	s3,42
 2e4:	01390463          	beq	s2,s3,2ec <pass_27>
 2e8:	0b40006f          	j	39c <fail_halt>

000002ec <pass_27>:
 2ec:	001f8f93          	addi	t6,t6,1

000002f0 <test_bne>:
 2f0:	00a00a13          	li	s4,10
 2f4:	01400a93          	li	s5,20
 2f8:	015a1463          	bne	s4,s5,300 <pass_28>
 2fc:	0a00006f          	j	39c <fail_halt>

00000300 <pass_28>:
 300:	001f8f93          	addi	t6,t6,1

00000304 <test_blt>:
 304:	ffb00b13          	li	s6,-5
 308:	00a00b93          	li	s7,10
 30c:	017b4463          	blt	s6,s7,314 <pass_29>
 310:	08c0006f          	j	39c <fail_halt>

00000314 <pass_29>:
 314:	001f8f93          	addi	t6,t6,1

00000318 <test_bge>:
 318:	06400c13          	li	s8,100
 31c:	03200c93          	li	s9,50
 320:	019c5463          	ble	s9,s8,328 <pass_30>
 324:	0780006f          	j	39c <fail_halt>

00000328 <pass_30>:
 328:	001f8f93          	addi	t6,t6,1

0000032c <test_bltu>:
 32c:	00a00d13          	li	s10,10
 330:	fff00d93          	li	s11,-1
 334:	01bd6463          	bltu	s10,s11,33c <pass_31>
 338:	0640006f          	j	39c <fail_halt>

0000033c <pass_31>:
 33c:	001f8f93          	addi	t6,t6,1

00000340 <test_bgeu>:
 340:	fff00e13          	li	t3,-1
 344:	06400293          	li	t0,100
 348:	005e7463          	bleu	t0,t3,350 <pass_32>
 34c:	0500006f          	j	39c <fail_halt>

00000350 <pass_32>:
 350:	001f8f93          	addi	t6,t6,1

00000354 <test_jal>:
 354:	0080036f          	jal	t1,35c <jal_target>
 358:	0440006f          	j	39c <fail_halt>

0000035c <jal_target>:
 35c:	001f8f93          	addi	t6,t6,1

00000360 <test_jalr>:
 360:	00000397          	auipc	t2,0x0
 364:	01038393          	addi	t2,t2,16 # 370 <jalr_target>
 368:	00038467          	jalr	s0,t2
 36c:	0300006f          	j	39c <fail_halt>

00000370 <jalr_target>:
 370:	001f8f93          	addi	t6,t6,1

00000374 <test_complete>:
 374:	fffff4b7          	lui	s1,0xfffff
 378:	ffc48493          	addi	s1,s1,-4 # ffffeffc <_end+0xffffec4c>
 37c:	01f4a023          	sw	t6,0(s1)
 380:	00002537          	lui	a0,0x2
 384:	01f52023          	sw	t6,0(a0) # 2000 <_end+0x1c50>
 388:	deadb5b7          	lui	a1,0xdeadb
 38c:	7ef58593          	addi	a1,a1,2031 # deadb7ef <_end+0xdeadb43f>
 390:	40058593          	addi	a1,a1,1024
 394:	00b52223          	sw	a1,4(a0)
 398:	0140006f          	j	3ac <done>

0000039c <fail_halt>:
 39c:	ffc00493          	li	s1,-4
 3a0:	fff00613          	li	a2,-1
 3a4:	00c4a023          	sw	a2,0(s1)
 3a8:	0040006f          	j	3ac <done>

000003ac <done>:
 3ac:	0000006f          	j	3ac <done>
