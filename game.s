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
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #16
	mov	r4, #1008
	mov	lr, #120
	mov	r1, #1
	mov	ip, #6
	ldr	r3, .L7
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	climber
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
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
	ldr	r3, .L43
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldrh	r3, [r3, #48]
	ldr	r4, .L43+4
	ldr	r7, .L43+8
	tst	r3, #64
	add	r3, r4, #8
	ldm	r3, {r3, r5}
	ldr	r6, [r7]
	bne	.L10
	cmp	r3, #0
	ble	.L10
	ldr	r8, [r4, #16]
	sub	r8, r3, r8
	ldr	r1, .L43+12
	add	r2, r5, r8, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	lsl	r2, r8, #8
	beq	.L10
	ldr	r0, [r4, #24]
	add	r2, r2, r0
	add	r2, r2, r5
	add	r1, r1, r2, lsl #1
	ldrh	r2, [r1, #-2]
	cmp	r2, #0
	beq	.L10
	ldr	r9, [r4, #32]
	ldr	r3, .L43+16
	smull	r1, r2, r3, r9
	asr	r3, r9, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r9, r3, lsl #2
	str	r8, [r4, #8]
	bne	.L11
	ldr	r0, [r4, #44]
	ldr	r3, .L43+20
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L11:
	ldr	r1, .L43+24
	ldr	r0, .L43+28
	ldr	r3, [r1]
	ldr	r2, [r0]
	add	r9, r9, #1
	sub	r3, r3, #1
	cmp	r2, #0
	str	r9, [r4, #32]
	str	r3, [r1]
	ble	.L12
	ldr	r1, [r4]
	cmp	r1, #79
	bgt	.L12
.L13:
	ldr	lr, .L43+32
	ldr	ip, .L43+36
	sub	r2, r2, #1
	ldr	r1, [lr]
	str	r2, [r0]
	ldr	r2, [ip]
	sub	r6, r6, #1
	add	r1, r1, #1
	sub	r2, r2, #1
	str	r6, [r7]
	str	r1, [lr]
	str	r2, [ip]
.L14:
	cmp	r3, #100
	moveq	r1, #1
	moveq	r3, r8
	movne	r3, r8
	ldreq	r2, .L43+40
	streq	r1, [r2]
.L10:
	ldr	r2, .L43
	ldrh	r2, [r2, #48]
	ldr	r0, .L43+44
	tst	r2, #32
	ldr	r1, [r0]
	bne	.L15
	cmp	r5, #0
	lsl	r7, r3, #8
	ble	.L42
	ldr	ip, [r4, #20]
	sub	ip, r5, ip
	ldr	r8, .L43+12
	add	r2, ip, r7
	lsl	r2, r2, #1
	ldrh	lr, [r8, r2]
	cmp	lr, #0
	bne	.L18
.L42:
	add	r2, r7, r5
	lsl	r2, r2, #1
.L17:
	ldr	ip, .L43+48
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	beq	.L20
	ldr	r2, [r4, #28]
	add	r2, r3, r2
	sub	r2, r2, #1
	add	r2, r5, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	beq	.L20
.L15:
	ldr	r2, .L43
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L21
	ldr	r2, [r4, #24]
	rsb	ip, r2, #256
	cmp	ip, r5
	ble	.L21
	ldr	lr, [r4, #20]
	add	r2, r2, r5
	sub	r2, r2, #1
	add	r2, r2, lr
	ldr	r7, .L43+12
	add	ip, r2, r3, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r7, ip]
	cmp	ip, #0
	beq	.L21
	ldr	ip, [r4, #28]
	add	ip, r3, ip
	sub	ip, ip, #1
	add	r2, r2, ip, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
	cmp	r2, #0
	beq	.L21
	add	r5, r5, lr
	cmp	r1, #15
	str	r5, [r4, #12]
	bgt	.L21
	ldr	r2, [r4, #4]
	cmp	r2, #120
	addgt	r1, r1, #1
	strgt	r1, [r0]
.L21:
	sub	r3, r3, r6
	sub	r5, r5, r1
	stm	r4, {r3, r5}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L20:
	mov	ip, #1
	ldr	r2, .L43+52
	str	ip, [r2]
	b	.L15
.L18:
	ldr	lr, [r4, #28]
	add	lr, r3, lr
	sub	lr, lr, #1
	add	lr, ip, lr, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r8, lr]
	cmp	lr, #0
	beq	.L42
	cmp	r1, #0
	str	ip, [r4, #12]
	blt	.L24
	ldr	lr, [r4, #4]
	cmp	lr, #119
	bgt	.L24
	sub	r1, r1, #1
	mov	r5, ip
	str	r1, [r0]
	b	.L17
.L12:
	cmp	r8, #384
	bge	.L14
	b	.L13
.L24:
	mov	r5, ip
	b	.L17
.L44:
	.align	2
.L43:
	.word	67109120
	.word	climber
	.word	playerVOff
	.word	collisionsBitmap
	.word	1717986919
	.word	__aeabi_idivmod
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
	ldr	r3, .L49
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L46
	ldr	r2, .L49+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L46:
	b	drawPlayer.part.0
.L50:
	.align	2
.L49:
	.word	climber
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L54
	ldr	r3, .L54+4
	ldr	r4, [r5, #32]
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L52
	ldr	r0, [r5, #44]
	ldr	r3, .L54+8
	ldr	r1, [r5, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L52:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	climber
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animatePlayer, .-animatePlayer
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
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r0, #2
	mov	r1, #8
	mov	lr, #3
	ldr	r3, .L60
	add	ip, r3, #300
.L57:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	str	r2, [r3, #56]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	lr, [r3, #48]
	str	r0, [r3, #36]
	add	r3, r3, #60
	cmp	r3, ip
	bne	.L57
	ldr	lr, [sp], #4
	bx	lr
.L61:
	.align	2
.L60:
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
	ldr	r3, .L69
	push	{r4, r5, lr}
	ldr	r2, .L69+4
	ldr	lr, .L69+8
	add	ip, r3, #300
.L66:
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #8]
	rsb	r1, r1, #0
	cmp	r0, r1
	blt	.L63
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L63
	ldr	r0, [r3, #4]
	ldr	r5, [r3, #44]
	ldr	r1, [r3, #36]
	ldrb	r4, [r3]	@ zero_extendqisi2
	and	r0, r0, lr
	add	r1, r1, r5, lsl #5
	strh	r0, [r2, #18]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	strh	r4, [r2, #16]	@ movhi
.L65:
	add	r3, r3, #60
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L66
	pop	{r4, r5, lr}
	bx	lr
.L63:
	ldrh	r1, [r2, #16]
	orr	r1, r1, #512
	strh	r1, [r2, #16]	@ movhi
	b	.L65
.L70:
	.align	2
.L69:
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L84
	ldr	r4, .L84+4
	ldr	r0, [r8]
	ldr	r7, .L84+8
	ldr	r5, .L84+12
	ldr	r10, .L84+16
	ldr	r9, .L84+20
	sub	sp, sp, #20
	add	r6, r4, #300
.L77:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	movle	r2, #1
	movle	r3, r2
	strle	r2, [r4, #12]
	ldr	r2, [r4, #24]
	rsb	r1, r2, #256
	cmp	r1, r3
	ldr	r3, [r4, #56]
	strlt	r1, [r4, #12]
	cmp	r3, #0
	beq	.L74
	ldr	ip, [r4, #8]
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #16]
	add	r1, ip, r1
	rsb	ip, r3, #1024
	cmp	r1, ip
	movgt	ip, #100
	movgt	lr, #0
	str	r1, [r4, #8]
	strgt	lr, [r4, #56]
	movgt	r1, ip
	strgt	ip, [r4, #8]
	ldr	fp, [r5, #8]
	ldr	lr, [r5, #12]
	ldr	ip, [r10]
	sub	r0, lr, r0
	sub	ip, fp, ip
	ldr	lr, [r5, #24]
	ldr	fp, [r5, #28]
	stm	sp, {r0, ip}
	str	fp, [sp, #12]
	str	lr, [sp, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	movne	r3, #0
	ldr	r0, [r8]
	strne	r3, [r4, #56]
.L74:
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #12]
	ldr	r1, [r7]
	sub	r3, r3, r0
	sub	r2, r2, r1
	stm	r4, {r2, r3}
	add	r4, r4, #60
	cmp	r4, r6
	bne	.L77
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	hOff
	.word	rocks
	.word	vOff
	.word	climber
	.word	totalVOff
	.word	collision
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
	ldr	r0, .L97
	mov	r2, r0
	ldr	r1, [r2, #56]
	cmp	r1, #0
	mov	r3, #0
	beq	.L96
.L87:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #60
	bxeq	lr
	ldr	r1, [r2, #56]
	cmp	r1, #0
	bne	.L87
.L96:
	mov	r1, #1
	mov	r2, #100
	rsb	r3, r3, r3, lsl #4
	push	{r4, lr}
	add	r4, r0, r3, lsl #2
	str	r1, [r4, #56]
	str	r2, [r4, #8]
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L97+8
	smull	r1, r3, r2, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #5
	add	r2, r2, r2, lsl #2
	ldr	r3, .L97+12
	add	r2, r2, r2, lsl #2
	ldr	r3, [r3]
	sub	r2, r0, r2, lsl #2
	add	r2, r2, #100
	add	r2, r2, r3
	str	r2, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	rocks
	.word	rand
	.word	1374389535
	.word	hOff
	.size	makeBallsFall, .-makeBallsFall
	.align	2
	.global	animateRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateRocks, %function
animateRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L104
	ldr	r10, .L104+4
	ldr	r8, .L104+8
	ldr	r7, .L104+12
	ldr	r9, .L104+16
	add	r6, r4, #300
.L101:
	ldr	r5, [r4, #32]
	mla	r3, r10, r5, r8
	cmp	r7, r3, ror #2
	bcc	.L100
	add	r0, r4, #44
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r9
	str	r1, [r4, #44]
.L100:
	add	r5, r5, #1
	str	r5, [r4, #32]
	add	r4, r4, #60
	cmp	r4, r6
	bne	.L101
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	rocks
	.word	-1030792151
	.word	85899344
	.word	42949672
	.word	__aeabi_idivmod
	.size	animateRocks, .-animateRocks
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
	mov	r10, #1
	mov	r6, #8
	ldr	r4, .L110
	ldr	r9, .L110+4
	ldr	r7, .L110+8
	ldr	fp, .L110+12
	ldr	r8, .L110+16
.L107:
	mov	r5, #0
	str	r10, [r4, #56]
	str	r6, [r4, #24]
	str	r6, [r4, #28]
	str	r10, [r4, #20]
	str	r5, [r4, #16]
	mov	lr, pc
	bx	r9
	smull	r3, r1, r8, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	sub	r0, r0, r2, lsl #2
	ldr	r1, [r7]
	ldr	r2, [fp]
	add	r0, r0, #100
	ldr	r3, .L110+20
	add	r0, r0, r1
	add	r2, r2, #80
	str	r5, [r4, #36]
	str	r0, [r4, #12]
	str	r2, [r4, #8]
	add	r4, r4, #64
	cmp	r4, r3
	bne	.L107
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	spiders
	.word	rand
	.word	hOff
	.word	vOff
	.word	1374389535
	.word	spiders+192
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
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #1
	mov	r5, #16
	mov	r10, #1008
	mov	r9, #120
	mov	r8, #6
	mov	r7, #30
	mov	r6, #1024
	mov	r0, #2
	mov	r1, #8
	mov	lr, #3
	ldr	r3, .L116
	str	ip, [r3]
	ldr	r3, .L116+4
	str	ip, [r3]
	ldr	r3, .L116+8
	str	ip, [r3]
	ldr	r3, .L116+12
	str	ip, [r3]
	ldr	r3, .L116+16
	str	ip, [r3, #32]
	str	ip, [r3, #44]
	str	ip, [r3, #36]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r10, [r3, #8]
	str	r9, [r3, #12]
	str	r8, [r3, #48]
	str	r5, [r3, #24]
	str	r5, [r3, #28]
	ldr	r3, .L116+20
	ldr	r4, .L116+24
	str	r7, [r3]
	mov	r2, ip
	ldr	r3, .L116+28
	ldr	ip, .L116+32
	str	r6, [r3]
	str	r4, [ip]
	ldr	r3, .L116+36
	ldr	ip, .L116+40
	ldr	r4, .L116+44
	str	ip, [r3]
	ldr	r3, .L116+48
	str	ip, [r4]
	add	ip, r3, #300
.L113:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	str	r2, [r3, #56]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	lr, [r3, #48]
	str	r0, [r3, #36]
	add	r3, r3, #60
	cmp	r3, ip
	bne	.L113
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initSpiders
.L117:
	.align	2
.L116:
	.word	count
	.word	hOff
	.word	winG
	.word	loseG
	.word	climber
	.word	screenBlock
	.word	351
	.word	winCount
	.word	vOff
	.word	playerVOff
	.word	863
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
	mov	r5, #512
	ldr	r3, .L124
	ldr	r2, .L124+4
	ldr	r4, .L124+8
	add	lr, r3, #24
.L121:
	ldr	r1, [r2, #56]
	cmp	r1, #0
	ldr	r0, [r2]
	bne	.L119
	cmp	r0, #0
	strhgt	r5, [r3]	@ movhi
	ble	.L119
.L120:
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #64
	bne	.L121
	pop	{r4, r5, lr}
	bx	lr
.L119:
	ldr	r1, [r2, #36]
	ldr	ip, [r2, #4]
	lsl	r1, r1, #5
	and	r0, r0, #255
	add	r1, r1, #3
	and	ip, ip, r4
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	b	.L120
.L125:
	.align	2
.L124:
	.word	shadowOAM+960
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
	ldr	r3, .L130
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L127
	ldr	r2, .L130+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L127:
	bl	drawPlayer.part.0
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L131:
	.align	2
.L130:
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
	ldr	r8, .L144
	ldr	r4, .L144+4
	ldr	r3, [r8]
	ldr	r7, .L144+8
	ldr	r5, .L144+12
	ldr	r10, .L144+16
	ldr	r9, .L144+20
	sub	sp, sp, #20
	add	r6, r4, #192
.L137:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L133
	ldr	ip, [r4, #12]
	ldr	r2, [r4, #20]
	cmp	ip, #254
	rsb	r0, r2, #0
	mov	r1, r0
	ble	.L134
	mov	r2, r0
	str	r0, [r4, #20]
	str	fp, [r4, #36]
.L135:
	ldr	r0, [r5, #8]
	ldr	r1, [r10]
	sub	r1, r0, r1
	ldr	r0, [r5, #12]
	add	ip, r2, ip
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
	ldrne	r3, .L144+24
	strne	fp, [r4, #56]
	strne	r2, [r3]
	ldr	r3, [r8]
.L133:
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r0, [r7]
	sub	r2, r2, r3
	sub	r1, r1, r0
	stm	r4, {r1, r2}
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L137
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L134:
	cmp	ip, #99
	movle	r1, #1
	movle	r2, r0
	strle	r0, [r4, #20]
	strle	r1, [r4, #36]
	b	.L135
.L145:
	.align	2
.L144:
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
	bl	updateRock
	ldr	r1, .L154
	ldr	r3, [r1]
	cmp	r3, #256
	bgt	.L147
	ldr	r3, .L154+4
	ldr	r3, [r3]
.L148:
	ldr	r1, .L154+8
	ldr	r2, [r1]
	cmp	r2, #255
	suble	r2, r2, #256
	strle	r2, [r1]
	mov	r2, #67108864
	ldr	r1, .L154+12
	lsl	r3, r3, #16
	ldrh	r1, [r1]
	lsr	r3, r3, #16
	strh	r1, [r2, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	bx	lr
.L147:
	ldr	ip, .L154+16
	ldr	r2, [ip]
	ldr	r0, .L154+4
	cmp	r2, #28
	ldr	r3, [r0]
	beq	.L148
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
	b	.L148
.L155:
	.align	2
.L154:
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
	.comm	rocks,300,4
	.comm	climber,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	timeToNextBall,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
