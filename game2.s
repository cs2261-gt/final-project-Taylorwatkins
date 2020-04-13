	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game2.c"
	.text
	.align	2
	.global	drawGame2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame2, %function
drawGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	push	{r4, lr}
	mov	lr, #0
	ldr	r3, .L4
	ldr	r2, .L4+4
	ldrh	r0, [r3]
	ldr	r3, [r2, #4]
	ldrb	r4, [r2]	@ zero_extendqisi2
	strh	r0, [r1, #16]	@ movhi
	ldr	r0, .L4+8
	ldr	r2, .L4+12
	lsl	r3, r3, #23
	ldrh	ip, [r0]
	lsr	r3, r3, #23
	add	r0, r2, #800
	orr	r3, r3, #16384
	add	r2, r2, #804
	strh	r4, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	ip, [r1, #18]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	player
	.word	vOff
	.word	shadowOAM
	.size	drawGame2, .-drawGame2
	.align	2
	.global	initPlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer2, %function
initPlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #0
	mov	r5, #1
	mov	lr, #4
	mov	ip, #16
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, .L8+4
	ldr	r4, .L8+8
	ldr	r0, [r3]
	ldr	r4, [r4]
	ldr	r3, .L8+12
	add	r2, r2, #80
	lsl	r2, r2, #8
	add	r0, r0, #112
	str	r5, [r3, #20]
	str	r4, [r3, #44]
	str	lr, [r3, #48]
	str	r2, [r3, #8]
	str	r0, [r3, #12]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	vOff
	.word	hOff
	.word	.LANCHOR0
	.word	player
	.size	initPlayer2, .-initPlayer2
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	str	lr, [sp, #-4]!
	mov	lr, #352
	mov	r0, #432
	mov	r2, #1
	ldr	r3, .L12
	ldr	ip, .L12+4
	str	r1, [r3]
	ldr	r1, .L12+8
	ldr	r3, .L12+12
	str	lr, [ip]
	ldr	lr, [sp], #4
	str	r0, [r1]
	str	r2, [r3]
	b	initPlayer2
.L13:
	.align	2
.L12:
	.word	hOff
	.word	vOff
	.word	ground
	.word	amJumping
	.size	initGame2, .-initGame2
	.align	2
	.global	updatePlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer2, %function
updatePlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L25
	ldr	r2, .L25+4
	ldr	ip, [r3, #8]
	ldr	r0, [r3, #16]
	ldr	r1, [r2]
	add	r2, ip, r0
	cmp	r1, r2, asr #8
	movle	r2, #0
	ldrle	r1, .L25+8
	push	{r4, r5, lr}
	movle	r0, r2
	strle	r2, [r1]
	strgt	r2, [r3, #8]
	strle	r2, [r3, #16]
	asrgt	r1, r2, #8
	ldr	r2, .L25+12
	asrle	r1, ip, #8
	ldrh	ip, [r2]
	ldr	r2, .L25+16
	tst	ip, #64
	ldr	lr, [r2]
	beq	.L17
	ldr	ip, .L25+20
	ldrh	ip, [ip]
	tst	ip, #64
	beq	.L24
.L17:
	ldr	r2, .L25+24
	ldrh	r2, [r2, #48]
	ldr	r4, .L25+28
	tst	r2, #32
	ldr	ip, [r4]
	ldr	r2, [r3, #12]
	bne	.L18
	cmp	r2, #0
	ble	.L18
	ldr	r5, [r3, #20]
	cmp	ip, #0
	sub	r2, r2, r5
	str	r2, [r3, #12]
	blt	.L18
	ldr	r5, [r3, #4]
	cmp	r5, #119
	suble	ip, ip, #1
	strle	ip, [r4]
.L18:
	ldr	r5, .L25+24
	ldrh	r5, [r5, #48]
	tst	r5, #16
	bne	.L19
	ldr	r5, [r3, #24]
	rsb	r5, r5, #256
	cmp	r5, r2
	ble	.L19
	ldr	r5, [r3, #20]
	cmp	ip, #15
	add	r2, r2, r5
	str	r2, [r3, #12]
	bgt	.L19
	ldr	r5, [r3, #4]
	cmp	r5, #120
	addgt	ip, ip, #1
	strgt	ip, [r4]
.L19:
	sub	r1, r1, lr
	add	r1, r1, #64
	add	r0, r0, #100
	sub	r2, r2, ip
	str	r1, [r3]
	str	r0, [r3, #16]
	str	r2, [r3, #4]
	pop	{r4, r5, lr}
	bx	lr
.L24:
	ldr	ip, .L25+8
	ldr	r4, [ip]
	cmp	r4, #0
	bne	.L17
	mov	r4, #1
	sub	r0, r0, #1488
	sub	r0, r0, #12
	cmp	lr, #0
	str	r0, [r3, #16]
	str	r4, [ip]
	blt	.L17
	ldr	ip, [r3]
	cmp	ip, #79
	suble	lr, lr, #1
	strle	lr, [r2]
	b	.L17
.L26:
	.align	2
.L25:
	.word	player
	.word	ground
	.word	amJumping
	.word	oldButtons
	.word	vOff
	.word	buttons
	.word	67109120
	.word	hOff
	.size	updatePlayer2, .-updatePlayer2
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer2
	.size	updateGame2, .-updateGame2
	.align	2
	.global	drawPlayer2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer2, %function
drawPlayer2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r1, .L29
	ldr	r3, [r1, #4]
	ldr	r2, .L29+4
	lsl	r3, r3, #23
	ldrb	ip, [r1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r1, r2, #800
	orr	r3, r3, #16384
	add	r2, r2, #804
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	shadowOAM
	.size	drawPlayer2, .-drawPlayer2
	.comm	winG2,4,4
	.comm	loseG2,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.global	idle
	.comm	ground,4,4
	.comm	amJumping,4,4
	.comm	player,56,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	idle, %object
	.size	idle, 4
idle:
	.word	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
