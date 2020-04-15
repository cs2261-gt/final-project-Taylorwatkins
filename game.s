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
	ldr	r3, .L35
	ldrh	r2, [r3, #48]
	ldr	r3, .L35+4
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L35+8
	tst	r2, #64
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	lr, [r4]
	bne	.L9
	cmp	r1, #0
	ble	.L9
	ldr	r0, [r3, #16]
	sub	r0, r1, r0
	ldr	r5, .L35+12
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
	ldr	ip, .L35+16
	ldr	r6, .L35+20
	ldr	r1, [ip]
	ldr	r5, [r6]
	sub	r1, r1, #1
	cmp	r5, #0
	str	r0, [r3, #8]
	str	r1, [ip]
	ble	.L10
	ldr	ip, [r3]
	cmp	ip, #79
	bgt	.L10
	ldr	r7, .L35+24
	ldr	ip, [r7]
	sub	r5, r5, #1
	sub	lr, lr, #1
	add	ip, ip, #1
	str	r5, [r6]
	str	lr, [r4]
	str	ip, [r7]
.L10:
	cmp	r1, #150
	moveq	r4, #1
	moveq	r1, r0
	movne	r1, r0
	ldreq	ip, .L35+28
	streq	r4, [ip]
.L9:
	ldr	r0, .L35
	ldrh	r0, [r0, #48]
	ldr	r4, .L35+32
	tst	r0, #32
	ldr	ip, [r4]
	bne	.L11
	cmp	r2, #0
	ble	.L11
	ldr	r0, [r3, #20]
	sub	r0, r2, r0
	ldr	r6, .L35+12
	add	r5, r0, r1, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L11
	ldr	r5, [r3, #28]
	add	r5, r1, r5
	sub	r5, r5, #1
	add	r5, r0, r5, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L11
	cmp	ip, #0
	str	r0, [r3, #12]
	blt	.L15
	ldr	r2, [r3, #4]
	cmp	r2, #119
	bgt	.L15
	mov	r2, r0
	sub	ip, ip, #1
	str	ip, [r4]
.L11:
	ldr	r0, .L35
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L12
	ldr	r0, [r3, #24]
	rsb	r5, r0, #256
	cmp	r5, r2
	ble	.L12
	ldr	r6, [r3, #20]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r0, r0, r6
	ldr	r7, .L35+12
	add	r5, r0, r1, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L12
	ldr	r5, [r3, #28]
	add	r5, r1, r5
	sub	r5, r5, #1
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L12
	add	r2, r2, r6
	cmp	ip, #15
	str	r2, [r3, #12]
	bgt	.L12
	ldr	r0, [r3, #4]
	cmp	r0, #120
	addgt	ip, ip, #1
	strgt	ip, [r4]
.L12:
	sub	r1, r1, lr
	sub	r2, r2, ip
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L15:
	mov	r2, r0
	b	.L11
.L36:
	.align	2
.L35:
	.word	67109120
	.word	climber
	.word	playerVOff
	.word	collisionsBitmap
	.word	winCount
	.word	vOff
	.word	count
	.word	winG
	.word	hOff
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
	ldr	r3, .L41
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L38
	ldr	r2, .L41+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L38:
	b	drawPlayer.part.0
.L42:
	.align	2
.L41:
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
	ldr	r3, .L47
	add	r0, r3, #180
.L44:
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
	bne	.L44
	bx	lr
.L48:
	.align	2
.L47:
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
	ldr	r3, .L56
	ldr	r2, .L56+4
	ldr	lr, .L56+8
	add	ip, r3, #180
.L53:
	ldr	r1, [r3, #28]
	ldr	r0, [r3]
	rsb	r1, r1, #0
	cmp	r0, r1
	blt	.L50
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L50
	ldr	r1, [r3, #4]
	and	r0, r0, #255
	and	r1, r1, lr
	strh	r4, [r2, #20]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	strh	r0, [r2, #16]	@ movhi
.L52:
	add	r3, r3, #60
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L53
	pop	{r4, lr}
	bx	lr
.L50:
	ldrh	r1, [r2, #16]
	orr	r1, r1, #512
	strh	r1, [r2, #16]	@ movhi
	b	.L52
.L57:
	.align	2
.L56:
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
	beq	.L61
	ldr	r3, [r4, #28]
	ldr	ip, [r4, #16]
	add	r1, r1, ip
	rsb	ip, r3, #1024
	cmp	r1, ip
	movgt	ip, #0
	strgt	ip, [r4, #56]
	ldr	ip, .L68
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
	ldr	r5, .L68+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #0
	ldreq	r1, [r4, #8]
	ldrne	r1, [r4, #8]
	strne	r3, [r4, #56]
	ldr	r0, [r4, #12]
.L61:
	ldr	r2, .L68+8
	ldr	r3, .L68+12
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
.L69:
	.align	2
.L68:
	.word	climber
	.word	collision
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
	ldr	r3, .L78
	push	{r4, lr}
	ldr	r4, [r3, #56]
	cmp	r4, #0
	beq	.L71
	ldr	r2, [r3, #116]
	cmp	r2, #0
	beq	.L73
	ldr	r2, [r3, #176]
	cmp	r2, #0
	moveq	r4, #2
	beq	.L71
	pop	{r4, lr}
	bx	lr
.L73:
	mov	r4, #1
.L71:
	mov	r1, #1
	rsb	r4, r4, r4, lsl #4
	add	r4, r3, r4, lsl #2
	ldr	r3, [r4, #28]
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	ldr	r2, .L78+4
	str	r1, [r4, #56]
	mov	lr, pc
	bx	r2
	ldr	r2, .L78+8
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
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
	mov	r10, #1
	mov	r9, #8
	ldr	r4, .L84
	ldr	r6, .L84+4
	ldr	r8, .L84+8
	ldr	fp, .L84+12
	ldr	r5, .L84+16
	add	r7, r4, #192
.L81:
	mov	r3, #0
	str	r10, [r4, #56]
	str	r3, [r4, #16]
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	str	r10, [r4, #20]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r2, [r8]
	sub	r0, r0, r3, lsl #2
	add	r0, r0, r2
	add	r0, r0, #100
	str	r0, [r4, #12]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r2, [fp]
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	add	r3, r3, r2
	str	r3, [r4, #8]
	add	r4, r4, #64
	cmp	r4, r7
	bne	.L81
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r8, #1184
	mov	r7, #30
	mov	r6, #1024
	mov	lr, #16
	mov	r0, #1
	mov	r4, #120
	mov	r5, #1008
	mov	ip, #2
	mov	r1, #8
	ldr	r9, .L90
	str	r3, [r9]
	ldr	r9, .L90+4
	str	r3, [r9]
	ldr	r9, .L90+8
	str	r3, [r9]
	ldr	r9, .L90+12
	mov	r2, r3
	str	r3, [r9]
	ldr	r3, .L90+16
	str	r8, [r3]
	ldr	r3, .L90+20
	str	r7, [r3]
	ldr	r3, .L90+24
	str	r6, [r3]
	ldr	r3, .L90+28
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	ldr	lr, .L90+32
	str	r4, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r5, [r3, #8]
	add	r4, r4, #231
	ldr	r3, .L90+36
	str	r4, [lr]
	add	r0, r3, #180
.L87:
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
	bne	.L87
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	initSpiders
.L91:
	.align	2
.L90:
	.word	count
	.word	hOff
	.word	winG
	.word	loseG
	.word	playerVOff
	.word	screenBlock
	.word	winCount
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
	mov	r5, #3
	mov	r4, #512
	ldr	r3, .L98
	ldr	r2, .L98+4
	ldr	lr, .L98+8
	add	r0, r3, #24
.L95:
	ldr	r1, [r2, #56]
	cmp	r1, #0
	ldrne	r1, [r2, #4]
	ldrbne	ip, [r2]	@ zero_extendqisi2
	andne	r1, r1, lr
	strheq	r4, [r3, #64]	@ movhi
	strhne	r5, [r3, #68]	@ movhi
	strhne	r1, [r3, #66]	@ movhi
	strhne	ip, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #64
	bne	.L95
	pop	{r4, r5, lr}
	bx	lr
.L99:
	.align	2
.L98:
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
	ldr	r3, .L104
	ldr	r3, [r3, #52]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L101
	ldr	r2, .L104+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L101:
	bl	drawPlayer.part.0
	bl	drawRocks
	pop	{r4, lr}
	b	drawSpiders
.L105:
	.align	2
.L104:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #0
	ldr	r4, .L119
	ldr	r8, .L119+4
	ldr	r7, .L119+8
	ldr	r5, .L119+12
	ldr	r9, .L119+16
	sub	sp, sp, #16
	add	r6, r4, #192
.L112:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L108
	ldr	r3, [r4, #12]
	cmp	r3, #254
	ldr	r0, [r4, #20]
	bgt	.L118
	cmp	r3, #99
	bgt	.L110
.L118:
	rsb	r0, r0, #0
	str	r0, [r4, #20]
.L110:
	add	ip, r5, #24
	ldm	ip, {ip, lr}
	ldr	r2, [r5, #8]
	add	r0, r3, r0
	ldr	r3, [r5, #12]
	stmib	sp, {r2, ip}
	ldr	r1, [r4, #8]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	sub	r1, r1, #180
	str	r0, [r4, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	strne	r10, [r4, #56]
.L108:
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #12]
	ldr	r0, [r8]
	ldr	r1, [r7]
	sub	r2, r2, r0
	sub	r3, r3, r1
	stm	r4, {r2, r3}
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L112
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L120:
	.align	2
.L119:
	.word	spiders
	.word	vOff
	.word	hOff
	.word	climber
	.word	collision
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
	ldr	r0, .L129
	bl	updateRock
	ldr	r0, .L129+4
	bl	updateRock
	ldr	r0, .L129+8
	bl	updateRock
	ldr	r1, .L129+12
	ldr	r3, [r1]
	cmp	r3, #256
	bgt	.L122
	ldr	r3, .L129+16
	ldr	r3, [r3]
.L123:
	ldr	r1, .L129+20
	ldr	r2, [r1]
	cmp	r2, #255
	suble	r2, r2, #256
	strle	r2, [r1]
	mov	r2, #67108864
	ldr	r1, .L129+24
	lsl	r3, r3, #16
	ldrh	r1, [r1]
	lsr	r3, r3, #16
	strh	r1, [r2, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	bx	lr
.L122:
	ldr	ip, .L129+28
	ldr	r2, [ip]
	ldr	r0, .L129+16
	cmp	r2, #28
	ldr	r3, [r0]
	beq	.L123
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
	b	.L123
.L130:
	.align	2
.L129:
	.word	rocks
	.word	rocks+60
	.word	rocks+120
	.word	count
	.word	vOff
	.word	playerVOff
	.word	hOff
	.word	screenBlock
	.size	updateGame, .-updateGame
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
