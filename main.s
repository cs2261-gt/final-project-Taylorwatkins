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
	mov	r3, #3424
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
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L10:
	.align	2
.L9:
	.word	buttons
	.size	pause.part.0, .-pause.part.0
	.set	instructions2.part.0,pause.part.0
	.set	instructions.part.0,pause.part.0
	.set	pause2.part.0,pause.part.0
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
	ldr	r3, .L13
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L14:
	.align	2
.L13:
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
	ldr	r4, .L17
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L17+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L17+8
	ldr	r1, .L17+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L17+16
	ldr	r1, .L17+20
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #40448
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L17+24
	ldr	r1, .L17+28
	mov	lr, pc
	bx	r4
	ldr	r2, .L17+32
	ldr	r1, .L17+36
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+40
	mov	lr, pc
	bx	r3
	mov	r1, #4352
	mov	r2, #1
	ldr	r3, .L17+44
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	DMANow
	.word	gameBGXLPal
	.word	14240
	.word	gameBGXLTiles
	.word	100720640
	.word	gameBGXLMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L21
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+4
	mov	lr, pc
	bx	r4
	mov	r3, #2992
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L21+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L21+12
	ldr	r1, .L21+16
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #39936
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L21+20
	ldr	r1, .L21+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L21+28
	ldr	r1, .L21+32
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L21+36
	mov	lr, pc
	bx	r3
	mov	r1, #4352
	mov	r2, #2
	ldr	r3, .L21+40
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	DMANow
	.word	gameBGPal
	.word	gameBGTiles
	.word	100720640
	.word	gameBGMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	state
	.size	goToGame2, .-goToGame2
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
	ldr	r4, .L25
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+4
	mov	lr, pc
	bx	r4
	mov	r3, #2640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #3
	ldr	r1, .L25+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L33
.L28:
	tst	r3, #4
	bxeq	lr
	b	pause.part.0
.L33:
	b	goToGame
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToPause2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause2, %function
goToPause2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L38
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L38+4
	mov	lr, pc
	bx	r4
	mov	r3, #2640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L38+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L38+12
	ldr	r1, .L38+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #4
	ldr	r1, .L38+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L39:
	.align	2
.L38:
	.word	DMANow
	.word	pauseBGPal
	.word	pauseBGTiles
	.word	100720640
	.word	pauseBGMap
	.word	state
	.size	goToPause2, .-goToPause2
	.align	2
	.global	pause2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause2, %function
pause2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L47
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L47+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L41:
	tst	r3, #4
	bxeq	lr
	b	pause2.part.0
.L46:
	b	goToGame2
.L48:
	.align	2
.L47:
	.word	oldButtons
	.word	buttons
	.size	pause2, .-pause2
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
	ldr	r4, .L51
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L51+4
	mov	lr, pc
	bx	r4
	mov	r3, #1552
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L51+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L51+12
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #5
	ldr	r1, .L51+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L52:
	.align	2
.L51:
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
	ldr	r3, .L55
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L56:
	.align	2
.L55:
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
	ldr	r4, .L59
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L59+4
	mov	lr, pc
	bx	r4
	mov	r3, #2000
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L59+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L59+12
	ldr	r1, .L59+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #6
	ldr	r1, .L59+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L60:
	.align	2
.L59:
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
	ldr	r3, .L75
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L75+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
	ldr	r3, .L75+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
.L62:
	ldr	r3, .L75+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L73
.L63:
	ldr	r3, .L75+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L74
	pop	{r4, lr}
	bx	lr
.L74:
	pop	{r4, lr}
	b	goToLose
.L73:
	bl	goToWin
	b	.L63
.L72:
	bl	goToPause
	b	.L62
.L76:
	.align	2
.L75:
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
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L91
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L91+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L91+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L91+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L91+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L88
.L78:
	ldr	r3, .L91+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L89
.L79:
	ldr	r3, .L91+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L90
	pop	{r4, lr}
	bx	lr
.L90:
	pop	{r4, lr}
	b	goToLose
.L89:
	bl	goToWin
	b	.L79
.L88:
	bl	goToPause2
	b	.L78
.L92:
	.align	2
.L91:
	.word	updateGame2
	.word	drawGame2
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	winG2
	.word	loseG2
	.size	game2, .-game2
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
	ldr	r4, .L96
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L96+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L96+8
	ldr	r1, .L96+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L96+16
	ldr	r1, .L96+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #7
	ldr	r1, .L96+24
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L97:
	.align	2
.L96:
	.word	DMANow
	.word	instructionBGPal
	.word	4832
	.word	instructionBGTiles
	.word	100720640
	.word	instructionBGMap
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	ldr	r3, .L112
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L99
	ldr	r2, .L112+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L111
.L99:
	tst	r3, #4
	bxeq	lr
	b	instructions.part.0
.L111:
	push	{r4, lr}
	bl	goToGame
	ldr	r3, .L112+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L116
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L116+4
	mov	lr, pc
	bx	r4
	mov	r3, #3904
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L116+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L116+12
	ldr	r1, .L116+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #8
	ldr	r1, .L116+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L117:
	.align	2
.L116:
	.word	DMANow
	.word	instructionBG2Pal
	.word	instructionBG2Tiles
	.word	100720640
	.word	instructionBG2Map
	.word	state
	.size	goToInstructions2, .-goToInstructions2
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
	ldr	r4, .L130
	ldrh	r3, [r4]
	tst	r3, #32
	beq	.L119
	ldr	r2, .L130+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L128
.L119:
	tst	r3, #16
	beq	.L118
	ldr	r3, .L130+4
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L129
.L118:
	pop	{r4, lr}
	bx	lr
.L129:
	pop	{r4, lr}
	b	goToInstructions2
.L128:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L119
.L131:
	.align	2
.L130:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L146
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L133
	ldr	r2, .L146+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L145
.L133:
	tst	r3, #4
	bxeq	lr
	b	instructions2.part.0
.L145:
	push	{r4, lr}
	bl	goToGame2
	ldr	r3, .L146+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	oldButtons
	.word	buttons
	.word	initGame2
	.size	instructions2, .-instructions2
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
	push	{r4, r7, fp, lr}
	ldr	r6, .L166
	ldr	r7, .L166+4
	ldr	r3, .L166+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L166+12
	ldr	r2, [r6]
	ldrh	r0, [r7]
	ldr	fp, .L166+16
	ldr	r10, .L166+20
	ldr	r9, .L166+24
	ldr	r8, .L166+28
	ldr	r4, .L166+32
.L150:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #8
	ldrls	pc, [pc, r2, asl #2]
	b	.L162
.L152:
	.word	.L160
	.word	.L159
	.word	.L158
	.word	.L157
	.word	.L156
	.word	.L155
	.word	.L154
	.word	.L153
	.word	.L151
.L151:
	ldr	r3, .L166+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L153:
	ldr	r3, .L166+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L154:
	tst	r0, #8
	beq	.L162
	ldr	r3, .L166+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L155:
	tst	r0, #8
	beq	.L162
	ldr	r3, .L166+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L156:
	ldr	r3, .L166+52
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L157:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L158:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L159:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L160:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L150
.L162:
	mov	r0, r3
	b	.L150
.L167:
	.align	2
.L166:
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	game2
	.word	pause
	.word	67109120
	.word	instructions2
	.word	instructions
	.word	lose.part.0
	.word	win.part.0
	.word	pause2
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	timeToNextBall,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
