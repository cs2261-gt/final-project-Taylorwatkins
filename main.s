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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #2096
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	ip, #7168
	mov	r0, #256
	ldr	r1, .L4+20
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r2, [r1]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startBGPal
	.word	startBGTiles
	.word	100720640
	.word	startBGMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L10:
	.align	2
.L9:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L13
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L13+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L13+8
	ldr	r1, .L13+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L13+16
	ldr	r1, .L13+20
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #40448
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L13+24
	ldr	r1, .L13+28
	mov	lr, pc
	bx	r4
	ldr	r2, .L13+32
	ldr	r1, .L13+36
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+40
	mov	lr, pc
	bx	r3
	mov	r1, #4352
	mov	r2, #1
	ldr	r3, .L13+44
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	DMANow
	.word	gameBGPal
	.word	9056
	.word	gameBGTiles
	.word	100724736
	.word	gameBGMap
	.word	83886592
	.word	RCspritesheetPal
	.word	100728832
	.word	RCspritesheetTiles
	.word	hideSprites
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L17
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L17+4
	mov	lr, pc
	bx	r4
	mov	r3, #2640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L17+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L17+12
	ldr	r1, .L17+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #2
	ldr	r1, .L17+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L18:
	.align	2
.L17:
	.word	DMANow
	.word	pauseBGPal
	.word	pauseBGTiles
	.word	100720640
	.word	pauseBGMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
	ldr	r2, .L29+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L20:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L28:
	b	goToGame
.L30:
	.align	2
.L29:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L33
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L33+4
	mov	lr, pc
	bx	r4
	mov	r3, #1552
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L33+12
	ldr	r1, .L33+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #3
	ldr	r1, .L33+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L34:
	.align	2
.L33:
	.word	DMANow
	.word	winBGPal
	.word	winBGTiles
	.word	100720640
	.word	winBGMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L38:
	.align	2
.L37:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L41
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L41+4
	mov	lr, pc
	bx	r4
	mov	r3, #2000
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L41+12
	ldr	r1, .L41+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #4
	ldr	r1, .L41+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L42:
	.align	2
.L41:
	.word	DMANow
	.word	loseBGPal
	.word	loseBGTiles
	.word	100720640
	.word	loseBGMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L57+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
.L44:
	ldr	r3, .L57+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L55
.L45:
	ldr	r3, .L57+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L56
	pop	{r4, lr}
	bx	lr
.L56:
	pop	{r4, lr}
	b	goToLose
.L55:
	bl	goToWin
	b	.L45
.L54:
	bl	goToPause
	b	.L44
.L58:
	.align	2
.L57:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	winG
	.word	loseG
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L62
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L62+4
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L62+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L62+12
	ldr	r1, .L62+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #5
	ldr	r1, .L62+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L63:
	.align	2
.L62:
	.word	DMANow
	.word	instructionBGPal
	.word	instructionBGTiles
	.word	100720640
	.word	instructionBGMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L76
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L65
	ldr	r2, .L76+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L74
.L65:
	tst	r3, #4
	beq	.L64
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L75
.L64:
	pop	{r4, lr}
	bx	lr
.L75:
	pop	{r4, lr}
	b	goToInstructions
.L74:
	bl	goToGame
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L65
.L77:
	.align	2
.L76:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r6, .L92
	ldr	r10, .L92+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L92+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L92+16
	ldr	r8, .L92+20
	ldr	r7, .L92+24
	ldr	fp, .L92+28
	ldr	r4, .L92+32
.L80:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L88
.L82:
	.word	.L86
	.word	.L85
	.word	.L81
	.word	.L84
	.word	.L83
	.word	.L81
.L81:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L85:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L86:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L83:
	tst	r0, #8
	beq	.L88
	ldr	r3, .L92+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L84:
	tst	r0, #8
	beq	.L88
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L80
.L88:
	mov	r0, r3
	b	.L80
.L93:
	.align	2
.L92:
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win.part.0
	.word	67109120
	.word	lose.part.0
	.size	main, .-main
	.text
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	pause
	.size	instructions, .-instructions
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
