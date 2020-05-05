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
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	ip, #1
	mov	r1, #16
	mov	r9, #112
	mov	r8, #4
	mov	r0, #8
	mov	r5, #5
	mvn	r4, #0
	mov	lr, #10
	mov	r7, #20
	mov	r6, #12
	ldr	r2, .L4
	ldr	r10, .L4+4
	str	r3, [r2]
	str	r3, [r10]
	ldr	r2, .L4+8
	ldr	r10, .L4+12
	str	r8, [r2, #44]
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	str	ip, [r2, #20]
	str	r3, [r2, #16]
	str	r3, [r2, #36]
	str	r10, [r2, #8]
	str	r9, [r2, #12]
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	str	ip, [r2]
	ldr	r2, .L4+24
	str	ip, [r1, #20]
	str	r7, [r1, #4]
	str	r0, [r1, #24]
	str	ip, [r2, #20]
	str	r6, [r2, #4]
	str	r0, [r1, #28]
	str	r0, [r1]
	str	r0, [r2, #24]
	str	r0, [r2, #28]
	str	r0, [r2]
	str	r5, [r1, #44]
	str	r5, [r2, #44]
	str	r4, [r1, #36]
	str	r4, [r2, #36]
	str	lr, [r1, #48]
	str	lr, [r2, #48]
	str	r3, [r1, #16]
	str	r3, [r1, #32]
	str	r3, [r2, #16]
	str	r3, [r2, #32]
	ldr	r0, .L4+28
	ldr	ip, .L4+32
	ldr	r1, .L4+36
	ldr	r2, .L4+40
	str	ip, [r0]
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	onBar
	.word	player
	.word	126720
	.word	amJumping
	.word	nums
	.word	nums10
	.word	vOff
	.word	351
	.word	winG2
	.word	loseG2
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #67108864
	ldr	r2, .L8
	ldr	r3, .L8+4
	ldrh	r1, [r2]
	ldr	lr, .L8+8
	ldr	r2, .L8+12
	ldrb	r9, [r3]	@ zero_extendqisi2
	ldrb	r8, [r2]	@ zero_extendqisi2
	ldrb	r7, [lr]	@ zero_extendqisi2
	ldr	ip, [r3, #4]
	ldr	r4, [r2, #4]
	strh	r1, [r6, #16]	@ movhi
	ldr	r5, .L8+16
	ldr	r1, [r2, #36]
	ldr	r2, [lr, #36]
	ldr	lr, [lr, #4]
	ldr	r0, [r3, #36]
	ldr	r3, .L8+20
	and	r4, r4, r5
	and	lr, lr, r5
	and	ip, ip, r5
	ldr	r5, .L8+24
	add	r10, r3, #800
	orr	ip, ip, #16384
	lsl	r0, r0, #5
	ldrh	fp, [r5]
	add	r0, r0, #4
	strh	ip, [r10, #2]	@ movhi
	lsl	r1, r1, #5
	add	ip, r3, #804
	lsl	r2, r2, #5
	strh	r9, [r10]	@ movhi
	add	r5, r3, #812
	strh	r0, [ip]	@ movhi
	add	r1, r1, #6
	add	ip, r3, #808
	add	r0, r3, #816
	add	r2, r2, #6
	add	r3, r3, #820
	strh	r8, [ip]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strh	r1, [r5]	@ movhi
	strh	r7, [r0]	@ movhi
	strh	lr, [r0, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	fp, [r6, #18]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hOff
	.word	player
	.word	nums10
	.word	nums
	.word	511
	.word	shadowOAM
	.word	vOff
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
	push	{r4, lr}
	mov	r0, #16
	mov	r4, #112
	mov	lr, #1
	mov	r1, #0
	mov	ip, #4
	ldr	r3, .L12
	ldr	r2, [r3]
	ldr	r3, .L12+4
	add	r2, r2, #144
	lsl	r2, r2, #8
	str	r4, [r3, #12]
	str	lr, [r3, #20]
	str	r2, [r3, #8]
	str	ip, [r3, #44]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	vOff
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
	ldr	r3, .L63
	ldrh	r3, [r3]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L63+4
	tst	r3, #64
	ldr	r3, [r4, #16]
	beq	.L15
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L58
.L15:
	ldr	r2, .L63+12
	cmp	r3, #0
	ldr	r0, [r2]
	ble	.L18
.L62:
	ldr	r1, .L63+16
	add	ip, r0, r3, asr #8
	cmp	ip, r1
	ble	.L59
.L19:
	ldr	ip, [r4, #8]
	cmp	ip, #3
	movle	r1, #1
	ldrle	r2, .L63+20
	ldr	r5, .L63+24
	strle	r1, [r2]
	ldr	r2, [r5]
	cmp	r2, #0
	addeq	r3, r3, #90
	add	r2, r0, #159
	streq	r3, [r4, #16]
	cmp	r2, ip, asr #8
	movlt	r1, #1
	ldrlt	r2, .L63+28
	strlt	r1, [r2]
	ldr	r1, [r4, #28]
	add	r2, ip, r3
	add	r1, r1, r2, asr #8
	cmp	r1, #512
	ldr	lr, [r4, #12]
	asr	r6, ip, #8
	asr	r1, r2, #8
	blt	.L60
	mov	r3, #0
	mov	r1, r6
	ldr	r6, .L63+32
	str	r3, [r4, #16]
	str	r3, [r6]
	ldr	r6, .L63+36
	mov	r2, ip
	lsl	ip, r1, #8
.L26:
	add	r3, ip, lr
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	bne	.L61
.L28:
	ldr	r3, .L63+40
	ldrh	r3, [r3, #48]
	lsr	r3, r3, #5
	eor	r3, r3, #1
	cmp	lr, #0
	movle	r3, #0
	andgt	r3, r3, #1
	ldr	r5, .L63+44
	cmp	r3, #0
	ldr	ip, [r5]
	bne	.L29
.L57:
	ldr	r3, [r4, #12]
.L30:
	ldr	lr, .L63+40
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L33
	ldr	lr, [r4, #24]
	rsb	r6, lr, #256
	cmp	r6, r3
	ble	.L33
	ldr	r7, [r4, #20]
	add	lr, lr, r3
	sub	lr, lr, #1
	add	lr, lr, r7
	ldr	r6, .L63+48
	add	r8, lr, r1, lsl #8
	lsl	r8, r8, #1
	ldrh	r8, [r6, r8]
	cmp	r8, #0
	beq	.L33
	ldr	r8, [r4, #28]
	add	r2, r2, r8
	sub	r2, r2, #1
	bic	r2, r2, #255
	add	r2, r2, lr
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	beq	.L33
	add	r3, r3, r7
	cmp	ip, #15
	str	r3, [r4, #12]
	bgt	.L33
	ldr	r2, [r4, #4]
	cmp	r2, #120
	addgt	ip, ip, #1
	strgt	ip, [r5]
.L33:
	sub	r2, r1, r0
	sub	r3, r3, ip
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L60:
	add	ip, r2, r3
	bic	ip, ip, #255
	add	r7, ip, lr
	ldr	r6, .L63+36
	cmp	r3, #0
	lsl	r3, r7, #1
	str	r2, [r4, #8]
	ldrh	r7, [r6, r3]
	ble	.L26
	ldr	r3, [r4, #24]
	add	ip, ip, r3
	add	ip, ip, lr
	add	ip, r6, ip, lsl #1
	cmp	r7, #0
	ldrh	r3, [ip, #-2]
	bne	.L27
	cmp	r3, #0
	bne	.L28
	mov	ip, #1
	mov	r7, #2
	str	ip, [r5]
	ldr	ip, .L63+32
	str	r3, [r4, #16]
	str	r3, [ip]
	str	r7, [r4, #36]
	lsl	ip, r1, #8
	b	.L26
.L61:
	ldr	r3, [r4, #24]
	add	ip, ip, r3
	add	ip, ip, lr
	add	ip, r6, ip, lsl #1
	ldrh	r3, [ip, #-2]
.L27:
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r5]
	strne	r3, [r4, #36]
	b	.L28
.L59:
	ldr	r1, [r4]
	cmp	r1, #80
	movle	r1, #0
	movgt	r1, #1
	cmp	r0, #352
	movge	r1, #0
	cmp	r1, #0
	addne	r0, r0, #1
	strne	r0, [r2]
	b	.L19
.L58:
	ldr	ip, .L63+32
	ldr	r2, [ip]
	cmp	r2, #0
	bne	.L15
	mov	lr, #1
	ldr	r2, .L63+40
	ldrh	r2, [r2, #48]
	tst	r2, #1
	subne	r3, r3, #1696
	subeq	r3, r3, #2000
	subne	r3, r3, #4
	mov	r2, #0
	str	r3, [r4, #16]
	ldr	r1, .L63+52
	ldr	r3, .L63+56
	ldr	r0, .L63+60
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
	ldr	r2, .L63+12
	cmp	r3, #0
	ldr	r0, [r2]
	bgt	.L62
.L18:
	beq	.L19
	cmp	r0, #0
	blt	.L19
	ldr	r1, [r4]
	cmp	r1, #79
	cmple	r1, r0
	bge	.L19
	sub	ip, r0, #1
	cmp	r1, ip
	sublt	r0, r0, #2
	movge	r0, ip
	strge	ip, [r2]
	strlt	r0, [r2]
	b	.L19
.L29:
	ldr	r3, [r4, #20]
	sub	r3, lr, r3
	ldr	r6, .L63+48
	add	lr, r3, r1, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r6, lr]
	cmp	lr, #0
	beq	.L57
	ldr	lr, [r4, #28]
	add	lr, r2, lr
	sub	lr, lr, #1
	bic	lr, lr, #255
	add	lr, lr, r3
	lsl	lr, lr, #1
	ldrh	lr, [r6, lr]
	cmp	lr, #0
	beq	.L57
	cmp	ip, #0
	str	r3, [r4, #12]
	blt	.L30
	ldr	lr, [r4, #4]
	cmp	lr, #119
	suble	ip, ip, #1
	strle	ip, [r5]
	b	.L30
.L64:
	.align	2
.L63:
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
	.word	sportCollisionBitmap
	.word	4234
	.word	playSoundB
	.word	grunt
	.size	updatePlayer2, .-updatePlayer2
	.global	__aeabi_idivmod
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L71
	bl	updatePlayer2
	ldr	r4, [r7, #32]
	add	r3, r4, r4, lsl #4
	ldr	r2, .L71+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L71+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	bcc	.L66
	ldr	r0, [r7, #36]
	ldr	r3, .L71+12
	ldr	r1, [r7, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r7, #36]
.L66:
	ldr	r6, .L71+16
	ldr	r2, .L71+20
	ldr	r3, .L71+24
	ldr	r5, [r6, #32]
	mla	r3, r5, r3, r2
	ldr	r2, .L71+28
	add	r4, r4, #1
	cmp	r2, r3, ror #3
	str	r4, [r7, #32]
	bcc	.L68
	ldr	r0, [r6, #36]
	ldr	r3, .L71+12
	ldr	r1, [r6, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r1, #2
	moveq	r2, #1
	ldreq	r3, .L71+32
	str	r1, [r6, #36]
	streq	r2, [r3]
.L68:
	add	r5, r5, #1
	str	r5, [r6, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	nums
	.word	143165576
	.word	71582788
	.word	__aeabi_idivmod
	.word	nums10
	.word	28633112
	.word	-1775253149
	.word	7158278
	.word	loseG2
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
	ldr	r0, .L74
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #36]
	ldr	r1, .L74+4
	lsl	r3, r3, #23
	ldrb	ip, [r0]	@ zero_extendqisi2
	lsr	r3, r3, #23
	lsl	r2, r2, #5
	add	r0, r1, #800
	orr	r3, r3, #16384
	add	r1, r1, #804
	add	r2, r2, #4
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	bx	lr
.L75:
	.align	2
.L74:
	.word	player
	.word	shadowOAM
	.size	drawPlayer2, .-drawPlayer2
	.align	2
	.global	initNums
	.syntax unified
	.arm
	.fpu softvfp
	.type	initNums, %function
initNums:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #8
	mov	r5, #20
	mov	r4, #1
	mov	lr, #5
	mov	r1, #0
	mvn	ip, #0
	mov	r0, #10
	ldr	r3, .L78
	stm	r3, {r2, r5}
	str	r4, [r3, #20]
	str	lr, [r3, #44]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	ip, [r3, #36]
	str	r0, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	pop	{r4, r5, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	nums
	.size	initNums, .-initNums
	.align	2
	.global	initNums10
	.syntax unified
	.arm
	.fpu softvfp
	.type	initNums10, %function
initNums10:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #8
	mov	r6, #12
	mov	r4, #1
	mov	lr, #5
	mov	r2, #0
	mvn	ip, #0
	mov	r0, #10
	ldr	r5, .L82
	ldr	r3, .L82+4
	ldr	r5, [r5, #28]
	str	r4, [r3, #20]
	stm	r3, {r5, r6}
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #48]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	nums
	.word	nums10
	.size	initNums10, .-initNums10
	.align	2
	.global	drawNums
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNums, %function
drawNums:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L85
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #36]
	ldr	r1, .L85+4
	ldrb	ip, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #23
	lsl	r3, r3, #5
	add	r0, r1, #808
	lsr	r2, r2, #23
	add	r1, r1, #812
	add	r3, r3, #6
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
.L86:
	.align	2
.L85:
	.word	nums
	.word	shadowOAM
	.size	drawNums, .-drawNums
	.align	2
	.global	drawNums10
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNums10, %function
drawNums10:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L88
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #36]
	ldr	r1, .L88+4
	ldrb	ip, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #23
	lsl	r3, r3, #5
	add	r0, r1, #816
	lsr	r2, r2, #23
	add	r1, r1, #820
	add	r3, r3, #6
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
.L89:
	.align	2
.L88:
	.word	nums10
	.word	shadowOAM
	.size	drawNums10, .-drawNums10
	.align	2
	.global	updateNums
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNums, %function
updateNums:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L93
	ldr	r4, [r5, #32]
	add	r3, r4, r4, lsl #4
	ldr	r2, .L93+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L93+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	bcc	.L91
	ldr	r0, [r5, #36]
	ldr	r3, .L93+12
	ldr	r1, [r5, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #36]
.L91:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	nums
	.word	143165576
	.word	71582788
	.word	__aeabi_idivmod
	.size	updateNums, .-updateNums
	.align	2
	.global	updateNums10
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNums10, %function
updateNums10:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L100
	ldr	r2, .L100+4
	ldr	r3, .L100+8
	ldr	r4, [r5, #32]
	mla	r3, r4, r3, r2
	ldr	r2, .L100+12
	cmp	r2, r3, ror #3
	bcc	.L97
	ldr	r0, [r5, #36]
	ldr	r3, .L100+16
	ldr	r1, [r5, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r1, #2
	moveq	r2, #1
	ldreq	r3, .L100+20
	str	r1, [r5, #36]
	streq	r2, [r3]
.L97:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	nums10
	.word	28633112
	.word	-1775253149
	.word	7158278
	.word	__aeabi_idivmod
	.word	loseG2
	.size	updateNums10, .-updateNums10
	.comm	winG2,4,4
	.comm	loseG2,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.global	idle
	.comm	ground,4,4
	.comm	onBar,4,4
	.comm	amJumping,4,4
	.comm	nums10,56,4
	.comm	nums,56,4
	.comm	player,56,4
	.data
	.align	2
	.type	idle, %object
	.size	idle, 4
idle:
	.word	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
