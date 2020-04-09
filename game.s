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
	mov	r0, #16
	mov	r1, #1
	ldr	r3, .L6
	ldr	ip, .L6+4
	ldr	r2, [r3]
	ldr	ip, [ip]
	ldr	r3, .L6+8
	add	r2, r2, #144
	str	r2, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L7:
	.align	2
.L6:
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
	ldr	r3, .L59
	ldrh	r2, [r3, #48]
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L59+4
	ldr	lr, .L59+8
	tst	r2, #64
	ldr	r1, [r3, #12]
	ldr	r2, [r3, #8]
	ldr	ip, [lr]
	bne	.L9
	cmp	r2, #0
	ble	.L10
	ldr	r0, [r3, #16]
	sub	r0, r2, r0
	ldr	r5, .L59+12
	add	r4, r1, r0, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r5, r4]
	cmp	r4, #0
	lsl	r4, r0, #8
	beq	.L9
	ldr	r6, [r3, #24]
	add	r4, r4, r6
	add	r4, r4, r1
	add	r5, r5, r4, lsl #1
	ldrh	r4, [r5, #-2]
	cmp	r4, #0
	beq	.L9
	cmp	ip, #0
	str	r0, [r3, #8]
	blt	.L21
	ldr	r2, [r3]
	cmp	r2, #79
	bgt	.L21
	mov	r2, r0
	sub	ip, ip, #1
	str	ip, [lr]
.L10:
	cmp	r2, #0
	moveq	r4, #1
	ldreq	r0, .L59+16
	streq	r4, [r0]
.L9:
	ldr	r0, .L59
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L11
	ldr	r0, [r3, #28]
	rsb	r4, r0, #512
	cmp	r4, r2
	bgt	.L57
.L11:
	ldr	r0, .L59
	ldrh	r0, [r0, #48]
	ldr	r5, .L59+20
	tst	r0, #32
	ldr	r4, [r5]
	bne	.L12
	cmp	r1, #0
	lsl	r8, r2, #8
	ble	.L56
	ldr	r6, [r3, #20]
	sub	r6, r1, r6
	ldr	r9, .L59+12
	add	r0, r6, r8
	lsl	r0, r0, #1
	ldrh	r7, [r9, r0]
	cmp	r7, #0
	bne	.L15
.L56:
	add	r0, r8, r1
	lsl	r0, r0, #1
.L14:
	ldr	r6, .L59+24
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L17
	ldr	r0, [r3, #28]
	add	r0, r2, r0
	sub	r0, r0, #1
	add	r0, r1, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L17
.L12:
	ldr	r0, .L59
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L18
	ldr	r0, [r3, #24]
	rsb	r6, r0, #256
	cmp	r6, r1
	bgt	.L58
.L18:
	ldr	r0, .L59+28
	ldrh	r0, [r0]
	tst	r0, #1
	beq	.L19
	ldr	r0, .L59+32
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L19
	cmp	r2, #0
	ble	.L19
	ldr	r7, [r3, #16]
	sub	r6, r2, r7
	ldr	r5, .L59+12
	add	r0, r1, r6, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	lsl	r0, r6, #8
	beq	.L19
	ldr	r8, [r3, #24]
	add	r0, r0, r8
	add	r0, r0, r1
	add	r5, r5, r0, lsl #1
	ldrh	r0, [r5, #-2]
	cmp	r0, #0
	beq	.L19
	add	r7, r7, r7, lsl #3
	sub	r2, r6, r7
	cmp	ip, #0
	str	r2, [r3, #8]
	blt	.L19
	ldr	r0, [r3]
	cmp	r0, #79
	suble	ip, ip, #1
	strle	ip, [lr]
.L19:
	sub	r1, r1, r4
	sub	r2, r2, ip
	str	r2, [r3]
	str	r1, [r3, #4]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L57:
	ldr	r5, [r3, #16]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r0, r0, r5
	add	r4, r1, r0, lsl #8
	ldr	r6, .L59+12
	lsl	r4, r4, #1
	ldrh	r4, [r6, r4]
	cmp	r4, #0
	lsl	r0, r0, #8
	beq	.L11
	ldr	r4, [r3, #24]
	add	r0, r0, r4
	add	r0, r0, r1
	add	r0, r6, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L11
	add	r2, r2, r5
	cmp	ip, #352
	str	r2, [r3, #8]
	bge	.L11
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	ip, ip, #1
	strgt	ip, [lr]
	b	.L11
.L58:
	ldr	r7, [r3, #20]
	add	r0, r0, r1
	sub	r0, r0, #1
	add	r0, r0, r7
	ldr	r8, .L59+12
	add	r6, r0, r2, lsl #8
	lsl	r6, r6, #1
	ldrh	r6, [r8, r6]
	cmp	r6, #0
	beq	.L18
	ldr	r6, [r3, #28]
	add	r6, r2, r6
	sub	r6, r6, #1
	add	r0, r0, r6, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L18
	add	r1, r1, r7
	cmp	r4, #15
	str	r1, [r3, #12]
	bgt	.L18
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	r4, r4, #1
	strgt	r4, [r5]
	b	.L18
.L17:
	mov	r6, #1
	ldr	r0, .L59+36
	str	r6, [r0]
	b	.L12
.L15:
	ldr	r7, [r3, #28]
	add	r7, r2, r7
	sub	r7, r7, #1
	add	r7, r6, r7, lsl #8
	lsl	r7, r7, #1
	ldrh	r7, [r9, r7]
	cmp	r7, #0
	beq	.L56
	cmp	r4, #0
	str	r6, [r3, #12]
	blt	.L23
	ldr	r1, [r3, #4]
	cmp	r1, #119
	bgt	.L23
	sub	r4, r4, #1
	mov	r1, r6
	str	r4, [r5]
	b	.L14
.L21:
	mov	r2, r0
	b	.L10
.L23:
	mov	r1, r6
	b	.L14
.L60:
	.align	2
.L59:
	.word	67109120
	.word	climber
	.word	vOff
	.word	collisionsBitmap
	.word	winG
	.word	hOff
	.word	collisionLoseBitmap
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L71
	add	r0, r3, #300
.L68:
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
	bne	.L68
	bx	lr
.L72:
	.align	2
.L71:
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
	mov	r4, #32
	ldr	r3, .L80
	ldr	lr, .L80+4
	add	ip, r0, #300
.L77:
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	rsb	r2, r2, #0
	cmp	r1, r2
	blt	.L74
	ldr	r2, [r0, #56]
	cmp	r2, #0
	beq	.L74
	ldr	r2, [r0, #4]
	and	r1, r1, #255
	and	r2, r2, lr
	strh	r2, [r3, #10]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	r1, [r3, #8]	@ movhi
.L76:
	add	r0, r0, #60
	cmp	r0, ip
	add	r3, r3, #8
	bne	.L77
	pop	{r4, lr}
	bx	lr
.L74:
	ldrh	r2, [r3, #8]
	orr	r2, r2, #512
	strh	r2, [r3, #8]	@ movhi
	b	.L76
.L81:
	.align	2
.L80:
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
	push	{r4, r5, lr}
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
	beq	.L85
	ldr	r3, [r4, #28]
	ldr	ip, [r4, #16]
	add	r1, r1, ip
	rsb	ip, r3, #512
	cmp	r1, ip
	movgt	ip, #0
	strgt	ip, [r4, #56]
	ldr	ip, .L93
	add	r5, ip, #24
	ldm	r5, {r5, lr}
	str	r1, [r4, #8]
	rsbgt	r1, r3, #0
	strgt	r1, [r4, #8]
	str	lr, [sp, #12]
	ldr	lr, [ip, #8]
	ldr	ip, [ip, #12]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L93+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r1, #0
	movne	r2, #1
	ldrne	r3, .L93+8
	strne	r1, [r4, #56]
	strne	r2, [r3]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
.L85:
	ldr	r2, .L93+12
	ldr	r3, .L93+16
	ldr	r2, [r2]
	ldr	r3, [r3]
	sub	r1, r1, r2
	sub	r0, r0, r3
	str	r1, [r4]
	str	r0, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	climber
	.word	collision
	.word	loseG
	.word	vOff
	.word	hOff
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
	ldr	r0, .L106
	mov	r2, r0
	ldr	r1, [r2, #56]
	cmp	r1, #0
	mov	r3, #0
	beq	.L105
.L96:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #60
	bxeq	lr
	ldr	r1, [r2, #56]
	cmp	r1, #0
	bne	.L96
.L105:
	mov	r1, #1
	rsb	r3, r3, r3, lsl #4
	push	{r4, lr}
	add	r4, r0, r3, lsl #2
	ldr	r3, [r4, #28]
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	ldr	r2, .L106+4
	str	r1, [r4, #56]
	mov	lr, pc
	bx	r2
	ldr	r2, .L106+8
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L107:
	.align	2
.L106:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #1
	mov	r8, #8
	ldr	r4, .L112
	ldr	r7, .L112+4
	ldr	r10, .L112+8
	ldr	r6, .L112+12
	add	r5, r4, #192
.L109:
	mov	r3, #100
	mov	r2, #0
	str	r3, [r4, #12]
	str	r2, [r4, #16]
	str	r9, [r4, #56]
	str	r8, [r4, #24]
	str	r8, [r4, #28]
	str	r9, [r4, #20]
	mov	lr, pc
	bx	r7
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r2, [r10]
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, r2
	str	r0, [r4, #8]
	add	r4, r4, #64
	cmp	r4, r5
	bne	.L109
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	spiders
	.word	rand
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
	mov	r0, #0
	push	{r4, r5, r6, lr}
	mov	r4, #16
	mov	lr, #1
	mov	r6, #496
	mov	r5, #352
	mov	ip, #2
	mov	r1, #8
	ldr	r3, .L118
	str	r0, [r3]
	ldr	r3, .L118+4
	str	r0, [r3]
	ldr	r3, .L118+8
	str	r0, [r3]
	ldr	r3, .L118+12
	mov	r2, r0
	str	r0, [r3, #12]
	str	r6, [r3, #8]
	ldr	r0, .L118+16
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	ldr	r3, .L118+20
	str	r5, [r0]
	add	r0, r3, #300
.L115:
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
	bne	.L115
	pop	{r4, r5, r6, lr}
	b	initSpiders
.L119:
	.align	2
.L118:
	.word	hOff
	.word	winG
	.word	loseG
	.word	climber
	.word	vOff
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
	mov	r5, #32
	mov	r4, #512
	ldr	r3, .L126
	ldr	r2, .L126+4
	ldr	lr, .L126+8
	add	r0, r3, #24
.L123:
	ldr	r1, [r2, #56]
	cmp	r1, #0
	ldrne	r1, [r2, #4]
	ldrbne	ip, [r2]	@ zero_extendqisi2
	andne	r1, r1, lr
	strheq	r4, [r3, #56]	@ movhi
	strhne	r5, [r3, #60]	@ movhi
	strhne	r1, [r3, #58]	@ movhi
	strhne	ip, [r3, #56]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #64
	bne	.L123
	pop	{r4, r5, lr}
	bx	lr
.L127:
	.align	2
.L126:
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
	ldr	r3, .L133
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L129
	ldr	r2, .L133+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L130:
	ldr	r0, .L133+8
	bl	drawRocks
	ldr	r0, .L133+12
	bl	drawRocks
	ldr	r0, .L133+16
	bl	drawRocks
	ldr	r0, .L133+20
	bl	drawRocks
	ldr	r0, .L133+24
	bl	drawRocks
	bl	drawSpiders
	mov	r3, #67108864
	ldr	r2, .L133+28
	ldrh	r1, [r2]
	ldr	r2, .L133+32
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L129:
	bl	drawPlayer.part.0
	b	.L130
.L134:
	.align	2
.L133:
	.word	climber
	.word	shadowOAM
	.word	rocks
	.word	rocks+60
	.word	rocks+120
	.word	rocks+180
	.word	rocks+240
	.word	hOff
	.word	vOff
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
	push	{r4, r5, lr}
	ldr	r3, [r0, #56]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #20
	beq	.L137
	ldr	r1, [r0]
	cmp	r1, #160
	movgt	r3, #0
	strgt	r3, [r0, #56]
	ldr	r3, [r0, #12]
	cmp	r3, #254
	ldr	r0, [r0, #20]
	ble	.L139
.L146:
	rsb	r0, r0, #0
	str	r0, [r4, #20]
.L140:
	ldr	r2, .L147
	add	ip, r2, #24
	ldm	ip, {ip, lr}
	add	r3, r3, r0
	ldm	r2, {r0, r2}
	str	r3, [r4, #12]
	stmib	sp, {r0, ip, lr}
	str	r2, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	ldr	r5, .L147+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r1, #0
	movne	r2, #1
	ldrne	r3, .L147+8
	strne	r1, [r4, #56]
	strne	r2, [r3]
.L137:
	ldr	r2, .L147+12
	ldr	r3, .L147+16
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #12]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L139:
	cmp	r3, #99
	ble	.L146
	b	.L140
.L148:
	.align	2
.L147:
	.word	climber
	.word	collision
	.word	loseG
	.word	vOff
	.word	hOff
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L151
	bl	makeBallsFall
	bl	updatePlayer
	mov	r0, r4
	bl	updateRock
	add	r0, r4, #60
	bl	updateRock
	add	r0, r4, #120
	ldr	r5, .L151+4
	bl	updateRock
	add	r0, r4, #180
	bl	updateRock
	add	r0, r4, #240
	bl	updateRock
	mov	r0, r5
	bl	updateSpider
	add	r0, r5, #64
	bl	updateSpider
	add	r0, r5, #128
	pop	{r4, r5, r6, lr}
	b	updateSpider
.L152:
	.align	2
.L151:
	.word	rocks
	.word	spiders
	.size	updateGame, .-updateGame
	.comm	loseG,4,4
	.comm	winG,4,4
	.comm	spiders,192,4
	.comm	rocks,300,4
	.comm	climber,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	timeToNextBall,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
