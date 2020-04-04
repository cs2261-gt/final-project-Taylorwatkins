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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L3
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	lsl	r3, r3, #23
	ldr	r0, .L3+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	climber
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #352
	mov	r2, #0
	mov	r0, #16
	mov	r1, #1
	mov	ip, #496
	ldr	r3, .L7
	str	lr, [r3]
	ldr	r3, .L7+4
	ldr	lr, .L7+8
	str	r2, [r3]
	ldr	r3, .L7+12
	str	r2, [lr]
	str	r2, [r3, #12]
	str	ip, [r3, #8]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	vOff
	.word	hOff
	.word	winG
	.word	climber
	.size	initGame, .-initGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L10
	ldr	r2, .L13+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L11:
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L13+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L13+16
	ldrh	r1, [r2]
	ldr	r2, .L13+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L10:
	bl	drawPlayer.part.0
	b	.L11
.L14:
	.align	2
.L13:
	.word	climber
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #16
	mov	r1, #1
	ldr	r3, .L16
	ldr	ip, .L16+4
	ldr	r2, [r3]
	ldr	ip, [ip]
	ldr	r3, .L16+8
	add	r2, r2, #144
	str	r2, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L17:
	.align	2
.L16:
	.word	vOff
	.word	hOff
	.word	climber
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	ldrh	r2, [r3, #48]
	ldr	r1, .L26+4
	ldr	r3, .L26+8
	tst	r2, #64
	push	{r4, lr}
	ldr	r2, [r3, #8]
	ldr	ip, [r1]
	bne	.L19
	cmp	r2, #0
	ble	.L20
	ldr	r0, [r3, #16]
	cmp	ip, #0
	sub	r2, r2, r0
	str	r2, [r3, #8]
	blt	.L20
	ldr	r0, [r3]
	cmp	r0, #79
	suble	ip, ip, #1
	strle	ip, [r1]
.L20:
	cmp	r2, #0
	moveq	lr, #1
	ldreq	r0, .L26+12
	streq	lr, [r0]
.L19:
	ldr	r0, .L26
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L21
	ldr	r0, [r3, #28]
	rsb	r0, r0, #512
	cmp	r0, r2
	bgt	.L25
.L21:
	ldr	r1, .L26
	ldrh	r1, [r1, #48]
	ldr	lr, .L26+16
	tst	r1, #32
	ldr	r0, [lr]
	ldr	r1, [r3, #12]
	bne	.L22
	cmp	r1, #0
	ble	.L22
	ldr	r4, [r3, #20]
	cmp	r0, #0
	sub	r1, r1, r4
	str	r1, [r3, #12]
	blt	.L22
	ldr	r4, [r3, #4]
	cmp	r4, #119
	suble	r0, r0, #1
	strle	r0, [lr]
.L22:
	ldr	r4, .L26
	ldrh	r4, [r4, #48]
	tst	r4, #16
	bne	.L23
	ldr	r4, [r3, #24]
	rsb	r4, r4, #256
	cmp	r4, r1
	ble	.L23
	ldr	r4, [r3, #20]
	cmp	r0, #15
	add	r1, r1, r4
	str	r1, [r3, #12]
	bgt	.L23
	ldr	r4, [r3, #4]
	cmp	r4, #120
	addgt	r0, r0, #1
	strgt	r0, [lr]
.L23:
	sub	r2, r2, ip
	sub	r1, r1, r0
	str	r2, [r3]
	str	r1, [r3, #4]
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r0, [r3, #16]
	cmp	ip, #352
	add	r2, r2, r0
	str	r2, [r3, #8]
	bge	.L21
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [r1]
	b	.L21
.L27:
	.align	2
.L26:
	.word	67109120
	.word	vOff
	.word	climber
	.word	winG
	.word	hOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L30
	ldr	r2, .L33+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L30:
	b	drawPlayer.part.0
.L34:
	.align	2
.L33:
	.word	climber
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	winG,4,4
	.comm	rocks,56,4
	.comm	climber,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
