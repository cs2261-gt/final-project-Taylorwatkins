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
	ldr	lr, .L7+4
	ldr	r3, .L7+8
	str	r2, [lr]
	str	r2, [r3]
	ldr	lr, .L7+12
	ldr	r3, .L7+16
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
	.word	loseG
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
	ldr	r3, .L58
	ldrh	r2, [r3, #48]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L58+4
	ldr	lr, .L58+8
	tst	r2, #64
	ldr	r1, [r3, #12]
	ldr	r2, [r3, #8]
	ldr	ip, [lr]
	bne	.L19
	cmp	r2, #0
	ble	.L20
	ldr	r0, [r3, #16]
	sub	r0, r2, r0
	ldr	r5, .L58+12
	add	r4, r1, r0, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r5, r4]
	cmp	r4, #0
	lsl	r4, r0, #8
	beq	.L19
	ldr	r6, [r3, #24]
	add	r4, r4, r6
	add	r4, r4, r1
	add	r5, r5, r4, lsl #1
	ldrh	r4, [r5, #-2]
	cmp	r4, #0
	beq	.L19
	cmp	ip, #0
	str	r0, [r3, #8]
	blt	.L30
	ldr	r2, [r3]
	cmp	r2, #79
	bgt	.L30
	mov	r2, r0
	sub	ip, ip, #1
	str	ip, [lr]
.L20:
	cmp	r2, #0
	moveq	r4, #1
	ldreq	r0, .L58+16
	streq	r4, [r0]
.L19:
	ldr	r0, .L58
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L21
	ldr	r0, [r3, #28]
	rsb	r4, r0, #512
	cmp	r4, r2
	bgt	.L57
.L21:
	ldr	r0, .L58
	ldrh	r0, [r0, #48]
	ldr	r4, .L58+20
	tst	r0, #32
	ldr	lr, [r4]
	bne	.L22
	cmp	r1, #0
	lsl	r7, r2, #8
	ble	.L56
	ldr	r5, [r3, #20]
	sub	r5, r1, r5
	ldr	r8, .L58+12
	add	r0, r5, r7
	lsl	r0, r0, #1
	ldrh	r6, [r8, r0]
	cmp	r6, #0
	bne	.L25
.L56:
	add	r0, r7, r1
	lsl	r0, r0, #1
.L24:
	ldr	r5, .L58+24
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L27
	ldr	r0, [r3, #28]
	add	r0, r2, r0
	sub	r0, r0, #1
	add	r0, r1, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L27
.L22:
	ldr	r0, .L58
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L28
	ldr	r0, [r3, #24]
	rsb	r5, r0, #256
	cmp	r5, r1
	ble	.L28
	ldr	r6, [r3, #20]
	add	r0, r0, r1
	sub	r0, r0, #1
	add	r0, r0, r6
	ldr	r7, .L58+12
	add	r5, r0, r2, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L28
	ldr	r5, [r3, #28]
	add	r5, r2, r5
	sub	r5, r5, #1
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L28
	add	r1, r1, r6
	cmp	lr, #15
	str	r1, [r3, #12]
	bgt	.L28
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	lr, lr, #1
	strgt	lr, [r4]
.L28:
	sub	r1, r1, lr
	sub	r2, r2, ip
	str	r2, [r3]
	str	r1, [r3, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	ldr	r5, [r3, #16]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r0, r0, r5
	add	r4, r1, r0, lsl #8
	ldr	r6, .L58+12
	lsl	r4, r4, #1
	ldrh	r4, [r6, r4]
	cmp	r4, #0
	lsl	r0, r0, #8
	beq	.L21
	ldr	r4, [r3, #24]
	add	r0, r0, r4
	add	r0, r0, r1
	add	r0, r6, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L21
	add	r2, r2, r5
	cmp	ip, #352
	str	r2, [r3, #8]
	bge	.L21
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [lr]
	b	.L21
.L27:
	mov	r5, #1
	ldr	r0, .L58+28
	str	r5, [r0]
	b	.L22
.L25:
	ldr	r6, [r3, #28]
	add	r6, r2, r6
	sub	r6, r6, #1
	add	r6, r5, r6, lsl #8
	lsl	r6, r6, #1
	ldrh	r6, [r8, r6]
	cmp	r6, #0
	beq	.L56
	cmp	lr, #0
	str	r5, [r3, #12]
	blt	.L32
	ldr	r1, [r3, #4]
	cmp	r1, #119
	bgt	.L32
	sub	lr, lr, #1
	mov	r1, r5
	str	lr, [r4]
	b	.L24
.L30:
	mov	r2, r0
	b	.L20
.L32:
	mov	r1, r5
	b	.L24
.L59:
	.align	2
.L58:
	.word	67109120
	.word	climber
	.word	vOff
	.word	collisionsBitmap
	.word	winG
	.word	hOff
	.word	collisionLoseBitmap
	.word	loseG
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
	ldr	r3, .L65
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L62
	ldr	r2, .L65+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L62:
	b	drawPlayer.part.0
.L66:
	.align	2
.L65:
	.word	climber
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	loseG,4,4
	.comm	winG,4,4
	.comm	rocks,56,4
	.comm	climber,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
