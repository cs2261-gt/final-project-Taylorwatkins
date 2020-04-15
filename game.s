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
	mov	r1, #16
	mov	r2, #1
	mov	ip, #1008
	mov	r0, #120
	ldr	r3, .L6
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L7:
	.align	2
.L6:
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
	ldr	r3, .L41
	ldrh	r2, [r3, #48]
	ldr	r3, .L41+4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L41+8
	tst	r2, #64
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	lr, [r4]
	bne	.L9
	cmp	r1, #0
	ble	.L9
	ldr	r0, [r3, #16]
	sub	r0, r1, r0
	ldr	r5, .L41+12
	add	ip, r2, r0, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r5, ip]
	cmp	ip, #0
	lsl	ip, r0, #8
	beq	.L9
	ldr	r6, [r3, #24]
	add	ip, ip, r6
	add	ip, ip, r2
	add	r5, r5, ip, lsl #1
	ldrh	ip, [r5, #-2]
	cmp	ip, #0
	beq	.L9
	ldr	r5, .L41+16
	ldr	r6, .L41+20
	ldr	r1, [r5]
	ldr	ip, [r6]
	sub	r1, r1, #1
	cmp	ip, #0
	str	r0, [r3, #8]
	str	r1, [r5]
	ble	.L10
	ldr	r5, [r3]
	cmp	r5, #79
	bgt	.L10
.L11:
	ldr	r8, .L41+24
	ldr	r7, .L41+28
	sub	ip, ip, #1
	ldr	r5, [r8]
	str	ip, [r6]
	ldr	ip, [r7]
	sub	lr, lr, #1
	add	r5, r5, #1
	sub	ip, ip, #1
	str	lr, [r4]
	str	r5, [r8]
	str	ip, [r7]
.L12:
	cmp	r1, #100
	moveq	r4, #1
	moveq	r1, r0
	movne	r1, r0
	ldreq	ip, .L41+32
	streq	r4, [ip]
.L9:
	ldr	r0, .L41
	ldrh	r0, [r0, #48]
	ldr	r4, .L41+36
	tst	r0, #32
	ldr	ip, [r4]
	bne	.L13
	cmp	r2, #0
	lsl	r7, r1, #8
	ble	.L40
	ldr	r5, [r3, #20]
	sub	r5, r2, r5
	ldr	r8, .L41+12
	add	r0, r5, r7
	lsl	r0, r0, #1
	ldrh	r6, [r8, r0]
	cmp	r6, #0
	bne	.L16
.L40:
	add	r0, r7, r2
	lsl	r0, r0, #1
.L15:
	ldr	r5, .L41+40
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L18
	ldr	r0, [r3, #28]
	add	r0, r1, r0
	sub	r0, r0, #1
	add	r0, r2, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L18
.L13:
	ldr	r0, .L41
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L19
	ldr	r0, [r3, #24]
	rsb	r5, r0, #256
	cmp	r5, r2
	ble	.L19
	ldr	r6, [r3, #20]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r0, r0, r6
	ldr	r7, .L41+12
	add	r5, r0, r1, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L19
	ldr	r5, [r3, #28]
	add	r5, r1, r5
	sub	r5, r5, #1
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L19
	add	r2, r2, r6
	cmp	ip, #15
	str	r2, [r3, #12]
	bgt	.L19
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	ip, ip, #1
	strgt	ip, [r4]
.L19:
	sub	r1, r1, lr
	sub	r2, r2, ip
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L18:
	mov	r5, #1
	ldr	r0, .L41+44
	str	r5, [r0]
	b	.L13
.L16:
	ldr	r6, [r3, #28]
	add	r6, r1, r6
	sub	r6, r6, #1
	add	r6, r5, r6, lsl #8
	lsl	r6, r6, #1
	ldrh	r6, [r8, r6]
	cmp	r6, #0
	beq	.L40
	cmp	ip, #0
	str	r5, [r3, #12]
	blt	.L22
	ldr	r2, [r3, #4]
	cmp	r2, #119
	bgt	.L22
	sub	ip, ip, #1
	mov	r2, r5
	str	ip, [r4]
	b	.L15
.L10:
	cmp	r0, #384
	bge	.L12
	b	.L11
.L22:
	mov	r2, r5
	b	.L15
.L42:
	.align	2
.L41:
	.word	67109120
	.word	climber
	.word	playerVOff
	.word	collisionsBitmap
	.word	winCount
	.word	vOff
	.word	count
	.word	totalVOff
	.word	winG
	.word	hOff
	.word	collisionLoseBitmap
	.word	loseG
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L47
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L44
	ldr	r2, .L47+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L44:
	b	drawPlayer.part.0
.L48:
	.align	2
.L47:
	.word	climber
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocks, %function
initRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #2
	mov	r1, #8
	ldr	r3, .L53
	add	r0, r3, #180
.L50:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	str	r2, [r3, #56]
	add	r3, r3, #60
	cmp	r3, r0
	bne	.L50
	bx	lr
.L54:
	.align	2
.L53:
	.word	rocks
	.size	initRocks, .-initRocks
	.align	2
	.global	drawRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRocks, %function
drawRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #2
	ldr	r3, .L62
	ldr	r2, .L62+4
	ldr	lr, .L62+8
	add	ip, r3, #180
.L59:
	ldr	r1, [r3, #28]
	ldr	r0, [r3]
	rsb	r1, r1, #0
	cmp	r0, r1
	blt	.L56
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L56
	ldr	r1, [r3, #4]
	and	r0, r0, #255
	and	r1, r1, lr
	strh	r4, [r2, #20]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
.L58:
	add	r3, r3, #60
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L59
	pop	{r4, lr}
	bx	lr
.L56:
	ldrh	r1, [r2, #16]
	orr	r1, r1, #512
	strh	r1, [r2, #16]	@ movhi
	b	.L58
.L63:
	.align	2
.L62:
	.word	rocks
	.word	shadowOAM
	.word	511
	.size	drawRocks, .-drawRocks
	.align	2
	.global	updateRock
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRock, %function
updateRock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r0, [r0, #12]
	cmp	r0, #0
	movle	r3, #1
	movle	r0, r3
	ldr	r2, [r4, #24]
	strle	r3, [r4, #12]
	rsb	r3, r2, #256
	cmp	r3, r0
	movlt	r0, r3
	strlt	r3, [r4, #12]
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldr	r1, [r4, #8]
	sub	sp, sp, #20
	bne	.L72
	ldr	r5, .L75
.L67:
	ldr	r3, .L75+4
	ldr	r2, [r5]
	ldr	r3, [r3]
	sub	r0, r0, r2
	sub	r1, r1, r3
	str	r0, [r4, #4]
	str	r1, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L72:
	ldr	r3, [r4, #28]
	ldr	ip, [r4, #16]
	add	r1, r1, ip
	rsb	ip, r3, #1024
	cmp	r1, ip
	movgt	ip, #0
	ldr	lr, .L75+8
	strgt	ip, [r4, #56]
	ldr	ip, .L75+12
	ldr	lr, [lr]
	ldr	r6, [ip, #8]
	ldr	r5, .L75
	ldr	r7, [ip, #12]
	sub	r6, r6, lr
	ldr	lr, [r5]
	sub	lr, r7, lr
	ldr	r7, [ip, #28]
	ldr	ip, [ip, #24]
	str	r1, [r4, #8]
	rsbgt	r1, r3, #0
	strgt	r1, [r4, #8]
	str	r6, [sp, #4]
	str	lr, [sp]
	str	r7, [sp, #12]
	str	ip, [sp, #8]
	ldr	r6, .L75+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r1, #0
	movne	r2, #1
	ldrne	r3, .L75+20
	strne	r1, [r4, #56]
	strne	r2, [r3]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	b	.L67
.L76:
	.align	2
.L75:
	.word	hOff
	.word	vOff
	.word	totalVOff
	.word	climber
	.word	collision
	.word	loseG
	.size	updateRock, .-updateRock
	.align	2
	.global	makeBallsFall
	.syntax unified
	.arm
	.fpu softvfp
	.type	makeBallsFall, %function
makeBallsFall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L85
	push	{r4, lr}
	ldr	r4, [r3, #56]
	cmp	r4, #0
	beq	.L78
	ldr	r2, [r3, #116]
	cmp	r2, #0
	beq	.L80
	ldr	r2, [r3, #176]
	cmp	r2, #0
	moveq	r4, #2
	beq	.L78
	pop	{r4, lr}
	bx	lr
.L80:
	mov	r4, #1
.L78:
	mov	r1, #1
	rsb	r4, r4, r4, lsl #4
	add	r4, r3, r4, lsl #2
	ldr	r3, [r4, #28]
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	ldr	r2, .L85+4
	str	r1, [r4, #56]
	mov	lr, pc
	bx	r2
	ldr	r2, .L85+8
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	rocks
	.word	rand
	.word	-2004318071
	.size	makeBallsFall, .-makeBallsFall
	.align	2
	.global	initSpiders
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSpiders, %function
initSpiders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #1
	mov	r5, #8
	ldr	r4, .L91
	ldr	r8, .L91+4
	ldr	fp, .L91+8
	ldr	r10, .L91+12
	ldr	r7, .L91+16
	add	r6, r4, #192
.L88:
	mov	r3, #0
	str	r9, [r4, #56]
	str	r3, [r4, #16]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r9, [r4, #20]
	mov	lr, pc
	bx	r8
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	ldr	r2, [fp]
	ldr	r3, [r10]
	add	r0, r0, #100
	add	r0, r0, r2
	add	r3, r3, #80
	str	r0, [r4, #12]
	str	r3, [r4, #8]
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L88
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	spiders
	.word	rand
	.word	hOff
	.word	vOff
	.word	1374389535
	.size	initSpiders, .-initSpiders
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
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #30
	mov	r6, #1024
	mov	lr, #16
	mov	r0, #1
	mov	r4, #120
	mov	r5, #1008
	mov	ip, #2
	mov	r1, #8
	ldr	r8, .L97
	str	r3, [r8]
	ldr	r8, .L97+4
	str	r3, [r8]
	ldr	r8, .L97+8
	str	r3, [r8]
	ldr	r8, .L97+12
	mov	r2, r3
	str	r3, [r8]
	ldr	r3, .L97+16
	str	r7, [r3]
	ldr	r3, .L97+20
	str	r6, [r3]
	ldr	r3, .L97+24
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r4, [r3, #12]
	ldr	lr, .L97+28
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r5, [r3, #8]
	ldr	r0, .L97+32
	ldr	r3, .L97+36
	add	r4, r4, #231
	str	r4, [lr]
	str	r0, [r3]
	ldr	lr, .L97+40
	ldr	r3, .L97+44
	str	r0, [lr]
	add	r0, r3, #180
.L94:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	str	r2, [r3, #56]
	add	r3, r3, #60
	cmp	r3, r0
	bne	.L94
	pop	{r4, r5, r6, r7, r8, lr}
	b	initSpiders
.L98:
	.align	2
.L97:
	.word	count
	.word	hOff
	.word	winG
	.word	loseG
	.word	screenBlock
	.word	winCount
	.word	climber
	.word	vOff
	.word	863
	.word	playerVOff
	.word	totalVOff
	.word	rocks
	.size	initGame, .-initGame
	.align	2
	.global	drawSpiders
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpiders, %function
drawSpiders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, #3
	mov	r5, #512
	ldr	r3, .L105
	ldr	r2, .L105+4
	ldr	lr, .L105+8
	add	ip, r3, #24
.L102:
	ldr	r1, [r2, #56]
	cmp	r1, #0
	ldr	r1, [r2]
	bne	.L100
	cmp	r1, #0
	strhgt	r5, [r3, #64]	@ movhi
	ble	.L100
.L101:
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #64
	bne	.L102
	pop	{r4, r5, lr}
	bx	lr
.L100:
	ldr	r0, [r2, #4]
	and	r1, r1, #255
	and	r0, r0, lr
	strh	r1, [r3, #64]	@ movhi
	strh	r4, [r3, #68]	@ movhi
	strh	r0, [r3, #66]	@ movhi
	b	.L101
.L106:
	.align	2
.L105:
	.word	shadowOAM
	.word	spiders
	.word	511
	.size	drawSpiders, .-drawSpiders
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
	ldr	r3, .L111
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L108
	ldr	r2, .L111+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L108:
	bl	drawPlayer.part.0
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L112:
	.align	2
.L111:
	.word	climber
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	updateSpider
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpider, %function
updateSpider:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #0
	ldr	r8, .L126
	ldr	r4, .L126+4
	ldr	r3, [r8]
	ldr	r7, .L126+8
	ldr	r5, .L126+12
	ldr	r10, .L126+16
	ldr	r9, .L126+20
	sub	sp, sp, #20
	add	r6, r4, #192
.L118:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L114
	ldr	ip, [r4, #12]
	cmp	ip, #254
	ldr	r2, [r4, #20]
	bgt	.L124
	cmp	ip, #99
	bgt	.L116
.L124:
	rsb	r2, r2, #0
	str	r2, [r4, #20]
.L116:
	ldr	r0, [r5, #8]
	ldr	r1, [r10]
	sub	r1, r0, r1
	ldr	r0, [r5, #12]
	add	ip, ip, r2
	sub	r3, r0, r3
	ldr	r2, [r5, #24]
	ldr	r0, [r5, #28]
	str	r1, [sp, #4]
	str	r0, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	ip, [r4, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L126+24
	strne	fp, [r4, #56]
	strne	r2, [r3]
	ldr	r3, [r8]
.L114:
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r0, [r7]
	sub	r2, r2, r3
	sub	r1, r1, r0
	stm	r4, {r1, r2}
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L118
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	hOff
	.word	spiders
	.word	vOff
	.word	climber
	.word	totalVOff
	.word	collision
	.word	loseG
	.size	updateSpider, .-updateSpider
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
	push	{r4, lr}
	bl	makeBallsFall
	bl	updatePlayer
	bl	updateSpider
	ldr	r0, .L136
	bl	updateRock
	ldr	r0, .L136+4
	bl	updateRock
	ldr	r0, .L136+8
	bl	updateRock
	ldr	r1, .L136+12
	ldr	r3, [r1]
	cmp	r3, #256
	bgt	.L129
	ldr	r3, .L136+16
	ldr	r3, [r3]
.L130:
	ldr	r1, .L136+20
	ldr	r2, [r1]
	cmp	r2, #255
	suble	r2, r2, #256
	strle	r2, [r1]
	mov	r2, #67108864
	ldr	r1, .L136+24
	lsl	r3, r3, #16
	ldrh	r1, [r1]
	lsr	r3, r3, #16
	strh	r1, [r2, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	bx	lr
.L129:
	ldr	ip, .L136+28
	ldr	r2, [ip]
	ldr	r0, .L136+16
	cmp	r2, #28
	ldr	r3, [r0]
	beq	.L130
	mov	r4, #0
	mov	lr, #67108864
	sub	r2, r2, #1
	str	r2, [ip]
	lsl	r2, r2, #24
	orr	r2, r2, #-2147483648
	add	r3, r3, #256
	lsr	r2, r2, #16
	str	r3, [r0]
	str	r4, [r1]
	strh	r2, [lr, #8]	@ movhi
	b	.L130
.L137:
	.align	2
.L136:
	.word	rocks
	.word	rocks+60
	.word	rocks+120
	.word	count
	.word	vOff
	.word	playerVOff
	.word	hOff
	.word	screenBlock
	.size	updateGame, .-updateGame
	.comm	totalVOff,4,4
	.comm	screenBlock,4,4
	.comm	playerVOff,4,4
	.comm	winCount,4,4
	.comm	count,4,4
	.comm	loseG,4,4
	.comm	winG,4,4
	.comm	spiders,192,4
	.comm	rocks,180,4
	.comm	climber,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	timeToNextBall,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
