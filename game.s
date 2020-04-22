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
	ldrb	r0, [r1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r1, .L3+4
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	orr	r0, r0, #1024
	lsl	r2, r2, #1
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
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
	ldr	r3, .L13
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L10
	ldr	r2, .L13+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L10:
	b	drawPlayer.part.0
.L14:
	.align	2
.L13:
	.word	climber
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.global	__aeabi_idivmod
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
	ldr	r5, .L18
	ldr	r3, .L18+4
	ldr	r4, [r5, #32]
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L16
	ldr	r0, [r5, #44]
	ldr	r3, .L18+8
	ldr	r1, [r5, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #44]
.L16:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	climber
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	alphaBlend
	.syntax unified
	.arm
	.fpu softvfp
	.type	alphaBlend, %function
alphaBlend:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L26
	ldr	r3, .L26+4
	ldr	r2, [r0]
	smull	ip, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	ldr	r1, .L26+8
	cmp	r2, r3, lsl #2
	ldr	r3, [r1]
	beq	.L21
	cmp	r3, #15
	addle	r3, r3, #1
	strle	r3, [r1]
.L21:
	cmp	r3, #16
	moveq	r1, #1
	add	r2, r2, #1
	str	r2, [r0]
	ldreq	r2, .L26+12
	streq	r1, [r2]
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #84]	@ movhi
	bx	lr
.L27:
	.align	2
.L26:
	.word	blendCount
	.word	1717986919
	.word	evy
	.word	loseG
	.size	alphaBlend, .-alphaBlend
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
	ldr	r3, .L70
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r3, [r3, #48]
	ldr	r4, .L70+4
	tst	r3, #64
	add	r3, r4, #8
	ldm	r3, {r3, r5}
	bne	.L67
	cmp	r3, #0
	ble	.L67
	ldr	r6, [r4, #16]
	sub	r6, r3, r6
	ldr	r1, .L70+8
	add	r2, r5, r6, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	lsl	r2, r6, #8
	bne	.L61
.L67:
	ldr	r7, .L70+12
.L29:
	ldr	r2, .L70
	ldrh	r2, [r2, #48]
	tst	r2, #32
	beq	.L64
	ldr	r6, .L70+16
.L32:
	ldr	r2, .L70
	ldrh	r2, [r2, #48]
	tst	r2, #16
	ldr	r1, [r6]
	bne	.L38
	ldr	r2, [r4, #24]
	rsb	r0, r2, #256
	cmp	r0, r5
	ble	.L38
	ldr	ip, [r4, #20]
	add	r2, r2, r5
	sub	r2, r2, #1
	add	r2, r2, ip
	ldr	lr, .L70+8
	add	r0, r2, r3, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	cmp	r0, #0
	beq	.L38
	ldr	r0, [r4, #28]
	add	r0, r3, r0
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	beq	.L38
	add	r5, r5, ip
	cmp	r1, #15
	str	r5, [r4, #12]
	bgt	.L38
	ldr	r2, [r4, #4]
	cmp	r2, #120
	addgt	r1, r1, #1
	strgt	r1, [r6]
.L38:
	ldr	r2, [r7]
	sub	r5, r5, r1
	sub	r3, r3, r2
	stm	r4, {r3, r5}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L64:
	cmp	r5, #0
	lsl	ip, r3, #8
	ble	.L69
	ldr	r1, [r4, #20]
	sub	r1, r5, r1
	add	r2, r1, ip
	ldr	lr, .L70+8
	lsl	r0, r2, #1
	ldrh	r2, [lr, r0]
	cmp	r2, #0
	bne	.L35
.L69:
	add	r2, ip, r5
	ldr	r6, .L70+16
	lsl	r0, r2, #1
.L34:
	ldr	r1, .L70+20
	ldrh	r2, [r1, r0]
	cmp	r2, #0
	beq	.L37
	ldr	r2, [r4, #28]
	add	r2, r3, r2
	sub	r2, r2, #1
	add	r2, r5, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	bne	.L32
.L37:
	bl	alphaBlend
	add	r3, r4, #8
	ldm	r3, {r3, r5}
	b	.L32
.L35:
	ldr	r2, [r4, #28]
	add	r2, r3, r2
	sub	r2, r2, #1
	add	r2, r1, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	beq	.L69
	ldr	r6, .L70+16
	ldr	r2, [r6]
	cmp	r2, #0
	str	r1, [r4, #12]
	blt	.L41
	ldr	ip, [r4, #4]
	cmp	ip, #119
	bgt	.L41
	sub	r2, r2, #1
	mov	r5, r1
	str	r2, [r6]
	b	.L34
.L61:
	ldr	r0, [r4, #24]
	add	r2, r2, r0
	add	r2, r2, r5
	add	r1, r1, r2, lsl #1
	ldrh	r2, [r1, #-2]
	cmp	r2, #0
	beq	.L67
	ldr	r7, [r4, #32]
	ldr	r3, .L70+24
	smull	r1, r2, r3, r7
	asr	r3, r7, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r7, r3, lsl #2
	str	r6, [r4, #8]
	bne	.L30
	ldr	r0, [r4, #44]
	ldr	r3, .L70+28
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L30:
	ldr	r2, .L70+32
	ldr	r3, [r4]
	cmp	r3, #79
	ldr	r3, [r2]
	add	r7, r7, #1
	sub	r3, r3, #1
	str	r7, [r4, #32]
	str	r3, [r2]
	ble	.L63
	ldr	r7, .L70+12
.L31:
	cmp	r3, #100
	moveq	r1, #1
	ldreq	r2, .L70+36
	moveq	r3, r6
	movne	r3, r6
	streq	r1, [r2]
	b	.L29
.L41:
	mov	r5, r1
	b	.L34
.L63:
	ldr	ip, .L70+40
	ldr	r2, [ip]
	ldr	r1, .L70+44
	add	r2, r2, #1
	str	r2, [ip]
	ldr	r2, [r1]
	ldr	r0, .L70+48
	ldr	r7, .L70+12
	sub	r2, r2, #1
	str	r2, [r1]
	ldr	r1, [r0]
	ldr	r2, [r7]
	sub	r1, r1, #1
	sub	r2, r2, #1
	str	r1, [r0]
	str	r2, [r7]
	b	.L31
.L71:
	.align	2
.L70:
	.word	67109120
	.word	climber
	.word	collisionsBitmap
	.word	playerVOff
	.word	hOff
	.word	collisionLoseBitmap
	.word	1717986919
	.word	__aeabi_idivmod
	.word	winCount
	.word	winG
	.word	count
	.word	vOff
	.word	totalVOff
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L76
	add	ip, r3, #300
.L73:
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
	bne	.L73
	ldr	lr, [sp], #4
	bx	lr
.L77:
	.align	2
.L76:
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
	ldr	r3, .L88
	push	{r4, r5, lr}
	ldr	r2, .L88+4
	ldr	r4, .L88+8
	add	ip, r3, #300
.L82:
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #8]
	rsb	r1, r1, #0
	cmp	r0, r1
	blt	.L79
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L79
	ldr	r1, [r3]
	cmp	r1, #160
	bls	.L80
.L79:
	ldrh	r1, [r2, #16]
	orr	r1, r1, #512
	strh	r1, [r2, #16]	@ movhi
.L81:
	add	r3, r3, #60
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L82
	pop	{r4, r5, lr}
	bx	lr
.L80:
	ldr	lr, [r3, #4]
	ldr	r5, [r3, #44]
	ldr	r0, [r3, #36]
	and	lr, lr, r4
	add	r0, r0, r5, lsl #5
	strh	r1, [r2, #16]	@ movhi
	strh	lr, [r2, #18]	@ movhi
	strh	r0, [r2, #20]	@ movhi
	b	.L81
.L89:
	.align	2
.L88:
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
	ldr	r4, .L110
	mov	r3, r4
	ldr	r8, .L110+4
	ldr	r7, .L110+8
	ldr	r6, .L110+12
	ldr	r9, .L110+16
	sub	sp, sp, #20
	add	r5, r4, #300
.L100:
	ldr	r1, [r4, #12]
	cmp	r1, #0
	movle	r3, #1
	movle	r1, r3
	ldr	r2, [r4, #24]
	strle	r3, [r4, #12]
	rsb	r3, r2, #256
	cmp	r3, r1
	movlt	r1, r3
	ldr	r0, [r4, #8]
	strlt	r3, [r4, #12]
	ldr	lr, .L110+20
	add	r3, r1, r0, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	beq	.L101
	ldr	r3, [r4, #28]
	add	ip, r0, r3
	sub	ip, ip, #1
	add	r1, r1, ip, lsl #8
	lsl	r1, r1, #1
	ldrh	r1, [lr, r1]
	cmp	r1, #0
	beq	.L101
	ldr	r1, [r4, #56]
	cmp	r1, #0
	beq	.L96
	ldr	r1, [r4, #16]
	add	r0, r0, r1
	rsb	r1, r3, #1024
	cmp	r0, r1
	movgt	r1, #100
	str	r0, [r4, #8]
	movgt	r0, #0
	add	ip, r9, #24
	strgt	r0, [r4, #56]
	strgt	r1, [r4, #8]
	ldm	ip, {ip, lr}
	ldm	r9, {r0, r1}
	ldr	r10, .L110+24
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	movne	r1, #0
	movne	r2, #1
	ldrne	r3, .L110+28
	strne	r1, [r4, #56]
	strne	r2, [r3]
	ldr	r0, [r4, #8]
.L96:
	ldr	r3, .L110+32
	ldr	r2, [r3]
	sub	r0, r0, r2
	ldr	r2, .L110+36
	ldr	r3, [r4, #12]
	ldr	r2, [r2]
	sub	r3, r3, r2
	stm	r4, {r0, r3}
	add	r4, r4, #60
	cmp	r4, r5
	bne	.L100
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L101:
	ldr	r10, .L110
.L104:
	ldr	fp, [r10, #32]
	mla	r3, r8, fp, r7
	cmp	r6, r3, ror #2
	bcc	.L95
	add	r0, r10, #44
	ldm	r0, {r0, r1}
	ldr	r3, .L110+40
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r10, #44]
.L95:
	add	fp, fp, #1
	str	fp, [r10, #32]
	add	r10, r10, #60
	cmp	r10, r5
	bne	.L104
	mov	r3, #0
	ldr	r0, [r4, #8]
	str	r3, [r4, #56]
	b	.L96
.L111:
	.align	2
.L110:
	.word	rocks
	.word	-1030792151
	.word	85899344
	.word	42949672
	.word	climber
	.word	collisionsBitmap
	.word	collision
	.word	loseG
	.word	vOff
	.word	hOff
	.word	__aeabi_idivmod
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
	ldr	r0, .L123
	mov	r2, r0
	ldr	r1, [r2, #56]
	cmp	r1, #0
	mov	r3, #0
	beq	.L122
.L113:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #60
	bxeq	lr
	ldr	r1, [r2, #56]
	cmp	r1, #0
	bne	.L113
.L122:
	mov	r1, #1
	mov	r2, #100
	rsb	r3, r3, r3, lsl #4
	push	{r4, lr}
	add	r4, r0, r3, lsl #2
	str	r1, [r4, #56]
	str	r2, [r4, #8]
	ldr	r3, .L123+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L123+8
	smull	r1, r3, r2, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #5
	add	r2, r2, r2, lsl #2
	ldr	r3, .L123+12
	add	r2, r2, r2, lsl #2
	ldr	r3, [r3]
	sub	r2, r0, r2, lsl #2
	add	r2, r2, #80
	add	r2, r2, r3
	str	r2, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L124:
	.align	2
.L123:
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
	ldr	r4, .L130
	ldr	r10, .L130+4
	ldr	r8, .L130+8
	ldr	r7, .L130+12
	ldr	r9, .L130+16
	add	r6, r4, #300
.L127:
	ldr	r5, [r4, #32]
	mla	r3, r10, r5, r8
	cmp	r7, r3, ror #2
	bcc	.L126
	add	r0, r4, #44
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r9
	str	r1, [r4, #44]
.L126:
	add	r5, r5, #1
	str	r5, [r4, #32]
	add	r4, r4, #60
	cmp	r4, r6
	bne	.L127
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L131:
	.align	2
.L130:
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
	ldr	r4, .L136
	ldr	r9, .L136+4
	ldr	r7, .L136+8
	ldr	fp, .L136+12
	ldr	r8, .L136+16
.L133:
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
	ldr	r3, .L136+20
	add	r0, r0, r1
	add	r2, r2, #80
	str	r5, [r4, #36]
	str	r0, [r4, #12]
	str	r2, [r4, #8]
	add	r4, r4, #64
	cmp	r4, r3
	bne	.L133
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L137:
	.align	2
.L136:
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
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #30
	mov	r10, #1024
	mov	r9, #67108864
	mov	r5, #16
	mov	r4, #1
	mov	r8, #1008
	mov	r7, #120
	mov	r6, #6
	mov	r0, #2
	mov	r1, #8
	mov	lr, #3
	ldr	ip, .L142
	str	r3, [ip]
	ldr	ip, .L142+4
	str	r3, [ip]
	ldr	ip, .L142+8
	str	r3, [ip]
	ldr	ip, .L142+12
	str	r3, [ip]
	ldr	ip, .L142+16
	str	r3, [ip]
	ldr	ip, .L142+20
	str	r3, [ip]
	ldr	ip, .L142+24
	str	fp, [ip]
	ldr	ip, .L142+28
	str	r10, [ip]
	ldr	ip, .L142+32
	ldr	r10, .L142+36
	str	r10, [ip]
	ldr	ip, .L142+40
	ldr	r10, .L142+44
	str	ip, [r10]
	ldr	r10, .L142+48
	str	ip, [r10]
	ldr	ip, .L142+52
	strh	r3, [r9, #84]	@ movhi
	mov	r2, r3
	str	r3, [ip, #32]
	str	r3, [ip, #44]
	str	r3, [ip, #36]
	ldr	r3, .L142+56
	str	r8, [ip, #8]
	str	r7, [ip, #12]
	str	r6, [ip, #48]
	str	r5, [ip, #24]
	str	r5, [ip, #28]
	str	r4, [ip, #16]
	str	r4, [ip, #20]
	add	ip, r3, #300
.L139:
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
	bne	.L139
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initSpiders
.L143:
	.align	2
.L142:
	.word	count
	.word	hOff
	.word	winG
	.word	loseG
	.word	evy
	.word	blendCount
	.word	screenBlock
	.word	winCount
	.word	vOff
	.word	351
	.word	863
	.word	playerVOff
	.word	totalVOff
	.word	climber
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
	ldr	r3, .L150
	ldr	r2, .L150+4
	ldr	r4, .L150+8
	add	lr, r3, #24
.L147:
	ldr	r1, [r2, #56]
	cmp	r1, #0
	ldr	r0, [r2]
	bne	.L145
	cmp	r0, #0
	strhgt	r5, [r3]	@ movhi
	ble	.L145
.L146:
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #64
	bne	.L147
	pop	{r4, r5, lr}
	bx	lr
.L145:
	ldr	r1, [r2, #36]
	ldr	ip, [r2, #4]
	lsl	r1, r1, #5
	and	r0, r0, #255
	add	r1, r1, #3
	and	ip, ip, r4
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	b	.L146
.L151:
	.align	2
.L150:
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
	ldr	r3, .L156
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L153
	ldr	r2, .L156+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L153:
	bl	drawPlayer.part.0
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L157:
	.align	2
.L156:
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
	ldr	r8, .L175
	ldr	r4, .L175+4
	ldr	r3, [r8]
	ldr	r7, .L175+8
	ldr	r5, .L175+12
	ldr	fp, .L175+16
	ldr	r10, .L175+20
	ldr	r9, .L175+24
	sub	sp, sp, #20
	add	r6, r4, #192
.L163:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L159
	ldr	ip, [r4, #12]
	cmp	ip, #254
	ldr	r2, [r4, #20]
	ble	.L160
	mov	r1, #0
	rsb	r2, r2, #0
	str	r2, [r4, #20]
	str	r1, [r4, #36]
.L161:
	ldr	r0, [r5, #8]
	ldr	r1, [fp]
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
	bx	r10
	cmp	r0, #0
	movne	r2, #0
	movne	r3, #1
	strne	r2, [r4, #56]
	ldrne	r2, .L175+28
	strne	r3, [r2]
	ldrh	r3, [r9]
	tst	r3, #1
	ldr	r3, [r8]
	beq	.L159
	ldr	r2, .L175+32
	ldrh	r2, [r2]
	ands	r2, r2, #1
	streq	r2, [r4, #56]
.L159:
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r0, [r7]
	sub	r2, r2, r3
	sub	r1, r1, r0
	stm	r4, {r1, r2}
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L163
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L160:
	cmp	ip, #99
	movle	r0, #1
	rsble	r1, r2, #0
	movle	r2, r1
	strle	r1, [r4, #20]
	strle	r0, [r4, #36]
	b	.L161
.L176:
	.align	2
.L175:
	.word	hOff
	.word	spiders
	.word	vOff
	.word	climber
	.word	totalVOff
	.word	collision
	.word	oldButtons
	.word	loseG
	.word	buttons
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
	ldr	r1, .L181
	ldr	r3, [r1]
	cmp	r3, #0
	blt	.L180
.L178:
	mov	r2, #67108864
	ldr	r1, .L181+4
	lsl	r3, r3, #16
	ldrh	r1, [r1]
	lsr	r3, r3, #16
	strh	r1, [r2, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	bx	lr
.L180:
	ldr	r0, .L181+8
	ldr	r2, [r0]
	cmp	r2, #27
	ble	.L178
	mov	r4, #0
	mov	lr, #67108864
	ldr	ip, .L181+12
	sub	r2, r2, #1
	str	r2, [r0]
	add	r3, r3, #256
	ldr	r0, [ip]
	lsl	r2, r2, #24
	str	r3, [r1]
	orr	r2, r2, #-2147483648
	ldr	r1, .L181+16
	lsr	r2, r2, #16
	add	r0, r0, #256
	str	r0, [ip]
	str	r4, [r1]
	strh	r2, [lr, #8]	@ movhi
	b	.L178
.L182:
	.align	2
.L181:
	.word	vOff
	.word	hOff
	.word	screenBlock
	.word	totalVOff
	.word	count
	.size	updateGame, .-updateGame
	.comm	evy,4,4
	.comm	blendCount,4,4
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
