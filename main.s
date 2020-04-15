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
	ldr	r4, .L17
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L17+4
	mov	lr, pc
	bx	r4
	mov	r3, #2992
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
	mov	r5, #67108864
	mov	r2, #39936
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L17+20
	ldr	r1, .L17+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L17+28
	ldr	r1, .L17+32
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+36
	mov	lr, pc
	bx	r3
	mov	r1, #4352
	mov	r2, #2
	ldr	r3, .L17+40
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
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
	ldr	r4, .L21
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+4
	mov	lr, pc
	bx	r4
	mov	r3, #2640
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
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #3
	ldr	r1, .L21+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L22:
	.align	2
.L21:
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
	ldr	r3, .L33
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L24
	ldr	r2, .L33+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L24:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L32:
	b	goToGame
.L34:
	.align	2
.L33:
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
	ldr	r4, .L37
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L37+4
	mov	lr, pc
	bx	r4
	mov	r3, #2640
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L37+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L37+12
	ldr	r1, .L37+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #4
	ldr	r1, .L37+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L38:
	.align	2
.L37:
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
	ldr	r3, .L49
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r2, .L49+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L48
.L40:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L48:
	b	goToGame2
.L50:
	.align	2
.L49:
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
	ldr	r4, .L53
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+4
	mov	lr, pc
	bx	r4
	mov	r3, #1552
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L53+12
	ldr	r1, .L53+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #5
	ldr	r1, .L53+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L57
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L58:
	.align	2
.L57:
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
	ldr	r4, .L61
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+4
	mov	lr, pc
	bx	r4
	mov	r3, #2000
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L61+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L61+12
	ldr	r1, .L61+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #6
	ldr	r1, .L61+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L62:
	.align	2
.L61:
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
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L77+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L77+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L77+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L77+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
.L64:
	ldr	r3, .L77+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L75
.L65:
	ldr	r3, .L77+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L76
	pop	{r4, lr}
	bx	lr
.L76:
	pop	{r4, lr}
	b	goToLose
.L75:
	bl	goToWin
	b	.L65
.L74:
	bl	goToPause
	b	.L64
.L78:
	.align	2
.L77:
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
	ldr	r3, .L93
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L93+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L93+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L93+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r3, .L93+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L80:
	ldr	r3, .L93+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L91
.L81:
	ldr	r3, .L93+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L92
	pop	{r4, lr}
	bx	lr
.L92:
	pop	{r4, lr}
	b	goToLose
.L91:
	bl	goToWin
	b	.L81
.L90:
	bl	goToPause2
	b	.L80
.L94:
	.align	2
.L93:
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
	ldr	r4, .L98
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L98+4
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L98+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L98+12
	ldr	r1, .L98+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #7
	ldr	r1, .L98+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L99:
	.align	2
.L98:
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
	ldr	r4, .L117
	ldrh	r3, [r4]
	tst	r3, #32
	beq	.L101
	ldr	r2, .L117+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L114
.L101:
	tst	r3, #16
	beq	.L102
	ldr	r2, .L117+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L115
.L102:
	tst	r3, #64
	beq	.L100
	ldr	r3, .L117+4
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L116
.L100:
	pop	{r4, lr}
	bx	lr
.L116:
	pop	{r4, lr}
	b	goToInstructions
.L114:
	bl	goToGame
	ldr	r3, .L117+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L101
.L115:
	bl	goToGame2
	ldr	r3, .L117+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L102
.L118:
	.align	2
.L117:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	initGame2
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
	ldr	r6, .L135
	ldr	r8, .L135+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L135+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L135+12
	ldr	r2, [r6]
	ldrh	r0, [r8]
	ldr	fp, .L135+16
	ldr	r10, .L135+20
	ldr	r9, .L135+24
	ldr	r7, .L135+28
	ldr	r4, .L135+32
.L121:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L131
.L123:
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L122
	.word	.L126
	.word	.L125
	.word	.L124
	.word	.L122
.L122:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L127:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L128:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L129:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L124:
	tst	r0, #8
	beq	.L131
	ldr	r3, .L135+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L125:
	tst	r0, #8
	beq	.L131
	ldr	r3, .L135+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L126:
	ldr	r3, .L135+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L121
.L131:
	mov	r0, r3
	b	.L121
.L136:
	.align	2
.L135:
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	game2
	.word	pause
	.word	67109120
	.word	lose.part.0
	.word	win.part.0
	.word	pause2
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
	.comm	timeToNextBall,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
