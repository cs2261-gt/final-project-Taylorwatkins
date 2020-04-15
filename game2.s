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
	.global	initGame2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #4
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #16
	mov	r1, #1
	mov	r4, #112
	ldr	lr, .L4
	ldr	r3, .L4+4
	ldr	lr, [lr]
	str	lr, [r3, #44]
	ldr	lr, .L4+8
	str	ip, [r3, #48]
	str	lr, [r3, #8]
	ldr	ip, .L4+12
	ldr	lr, .L4+16
	str	r4, [r3, #12]
	str	r0, [r3, #24]
	ldr	r4, .L4+20
	str	r0, [r3, #28]
	str	r2, [ip]
	str	r1, [r3, #20]
	str	r1, [lr]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	ldr	ip, .L4+24
	ldr	r0, .L4+28
	ldr	r3, .L4+32
	ldr	r1, .L4+36
	str	r2, [r4]
	str	r2, [ip]
	str	r2, [r0]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	player
	.word	126720
	.word	hOff
	.word	amJumping
	.word	onBar
	.word	winG2
	.word	loseG2
	.word	vOff
	.word	351
	.size	initGame2, .-initGame2
	.align	2
	.global	drawGame2
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
	ldr	r3, .L8
	ldr	r2, .L8+4
	ldrh	r0, [r3]
	ldr	r3, [r2, #4]
	ldrb	r4, [r2]	@ zero_extendqisi2
	strh	r0, [r1, #16]	@ movhi
	ldr	r0, .L8+8
	ldr	r2, .L8+12
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
.L9:
	.align	2
.L8:
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
	mov	r5, #112
	mov	r4, #1
	mov	r0, #16
	mov	ip, #4
	ldr	r3, .L12
	ldr	lr, .L12+4
	ldr	r2, [r3]
	ldr	lr, [lr]
	ldr	r3, .L12+8
	add	r2, r2, #144
	lsl	r2, r2, #8
	str	r5, [r3, #12]
	str	r4, [r3, #20]
	str	lr, [r3, #44]
	str	r2, [r3, #8]
	str	ip, [r3, #48]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	vOff
	.word	.LANCHOR0
	.word	player
	.size	initPlayer2, .-initPlayer2
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
	ldr	r3, .L51
	ldrh	r2, [r3]
	ldr	r3, .L51+4
	tst	r2, #64
	push	{r4, r5, r6, lr}
	ldr	ip, [r3, #16]
	beq	.L15
	ldr	r2, .L51+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L46
.L15:
	ldr	r2, .L51+12
	cmp	ip, #0
	ldr	r5, [r2]
	ble	.L16
.L50:
	ldr	r1, .L51+16
	add	r0, r5, ip, asr #8
	cmp	r0, r1
	ble	.L47
.L17:
	ldr	r2, [r3, #8]
	cmp	r2, #3
	movle	r0, #1
	ldrle	r1, .L51+20
	ldr	r6, .L51+24
	strle	r0, [r1]
	ldr	r1, [r6]
	cmp	r1, #0
	addeq	ip, ip, #90
	add	r1, r5, #159
	streq	ip, [r3, #16]
	cmp	r1, r2, asr #8
	movlt	r0, #1
	ldrlt	r1, .L51+28
	strlt	r0, [r1]
	ldr	r1, [r3, #28]
	add	r0, r2, ip
	asr	lr, r2, #8
	add	r2, r1, r0, asr #8
	cmp	r2, #512
	asr	r4, r0, #8
	ldr	r2, [r3, #12]
	blt	.L48
	mov	r1, #0
	ldr	r0, .L51+32
	str	r1, [r3, #16]
	str	r1, [r0]
	ldr	ip, .L51+36
	mov	r4, lr
	lsl	lr, lr, #8
.L24:
	add	r1, lr, r2
	lsl	r1, r1, #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	bne	.L49
.L26:
	ldr	r1, .L51+40
	ldrh	r1, [r1, #48]
	lsr	r1, r1, #5
	eor	r1, r1, #1
	cmp	r2, #0
	movle	r1, #0
	andgt	r1, r1, #1
	ldr	ip, .L51+44
	cmp	r1, #0
	ldr	r0, [ip]
	bne	.L27
	ldr	r2, [r3, #12]
.L28:
	ldr	r1, .L51+40
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L29
	ldr	r1, [r3, #24]
	rsb	r1, r1, #256
	cmp	r1, r2
	ble	.L29
	ldr	r1, [r3, #20]
	cmp	r0, #15
	add	r2, r2, r1
	str	r2, [r3, #12]
	bgt	.L29
	ldr	r1, [r3, #4]
	cmp	r1, #120
	addgt	r0, r0, #1
	strgt	r0, [ip]
.L29:
	sub	r1, r4, r5
	sub	r2, r2, r0
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	add	lr, r0, ip
	bic	lr, lr, #255
	add	r1, lr, r2
	cmp	ip, #0
	ldr	ip, .L51+36
	lsl	r1, r1, #1
	str	r0, [r3, #8]
	ldrh	r0, [ip, r1]
	ble	.L24
	ldr	r1, [r3, #24]
	add	lr, lr, r1
	add	lr, lr, r2
	add	lr, ip, lr, lsl #1
	cmp	r0, #0
	ldrh	r1, [lr, #-2]
	bne	.L25
	cmp	r1, #0
	bne	.L26
	mov	lr, #1
	ldr	r0, .L51+32
	str	lr, [r6]
	str	r1, [r3, #16]
	str	r1, [r0]
	lsl	lr, r4, #8
	b	.L24
.L49:
	ldr	r1, [r3, #24]
	add	lr, lr, r1
	add	lr, lr, r2
	add	lr, ip, lr, lsl #1
	ldrh	r1, [lr, #-2]
.L25:
	cmp	r1, #0
	movne	r1, #0
	strne	r1, [r6]
	b	.L26
.L47:
	ldr	r1, [r3]
	cmp	r1, #80
	movle	r1, #0
	movgt	r1, #1
	cmp	r5, #352
	movge	r1, #0
	cmp	r1, #0
	addne	r5, r5, #1
	strne	r5, [r2]
	b	.L17
.L46:
	ldr	r2, .L51+32
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r1, #1
	subeq	ip, ip, #1696
	streq	r1, [r2]
	subeq	ip, ip, #4
	ldr	r2, .L51+12
	streq	ip, [r3, #16]
	cmp	ip, #0
	ldr	r5, [r2]
	bgt	.L50
.L16:
	beq	.L17
	cmp	r5, #0
	blt	.L17
	ldr	r1, [r3]
	cmp	r1, #79
	cmple	r1, r5
	bge	.L17
	sub	r0, r5, #1
	cmp	r1, r0
	sublt	r5, r5, #2
	movge	r5, r0
	strge	r0, [r2]
	strlt	r5, [r2]
	b	.L17
.L27:
	ldr	r1, [r3, #20]
	cmp	r0, #0
	sub	r2, r2, r1
	str	r2, [r3, #12]
	blt	.L28
	ldr	r1, [r3, #4]
	cmp	r1, #119
	suble	r0, r0, #1
	strle	r0, [ip]
	b	.L28
.L52:
	.align	2
.L51:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	vOff
	.word	510
	.word	winG2
	.word	onBar
	.word	loseG2
	.word	amJumping
	.word	collision2Bitmap
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
	ldr	r1, .L55
	ldr	r3, [r1, #4]
	ldr	r2, .L55+4
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
.L56:
	.align	2
.L55:
	.word	player
	.word	shadowOAM
	.size	drawPlayer2, .-drawPlayer2
	.comm	winG2,4,4
	.comm	loseG2,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.global	idle
	.comm	ground,4,4
	.comm	onBar,4,4
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
