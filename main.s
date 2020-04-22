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
	mov	r4, #0
	mov	r1, #7168
	mov	r2, #256
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	mov	r2, #1
	strh	r4, [r3, #18]	@ movhi
	ldr	r1, .L4+20
	ldr	r3, .L4+24
	ldr	r0, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startBGPal
	.word	startBGTiles
	.word	100720640
	.word	startBGMap
	.word	1903392
	.word	playSoundA
	.word	startsong
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
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L8
	ldr	r3, .L8+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	vBlankCount
	.word	setupSounds
	.word	setupInterrupts
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
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
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
	ldr	r4, .L16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #40448
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L16+32
	mov	r3, #16384
	ldr	r2, .L16+36
	mov	lr, pc
	bx	r4
	mov	r2, #144
	ldr	r3, .L16+40
	strh	r2, [r5, #80]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #4352
	ldr	r3, .L16+44
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+48
	ldr	r1, .L16+52
	ldr	r0, .L16+56
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	gameBGXLPal
	.word	14240
	.word	gameBGXLTiles
	.word	100720640
	.word	gameBGXLMap
	.word	83886592
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	100728832
	.word	hideSprites
	.word	stopSound
	.word	playSoundA
	.word	2437920
	.word	gamesong
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
	ldr	r4, .L20
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+4
	mov	lr, pc
	bx	r4
	mov	r3, #2992
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L20+12
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #39936
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L20+20
	ldr	r1, .L20+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L20+28
	ldr	r2, .L20+32
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+36
	mov	lr, pc
	bx	r3
	mov	r2, #4352
	ldr	r3, .L20+40
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L20+44
	ldr	r1, .L20+48
	ldr	r0, .L20+52
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L20+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	gameBGPal
	.word	gameBGTiles
	.word	100720640
	.word	gameBGMap
	.word	83886592
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	100728832
	.word	hideSprites
	.word	stopSound
	.word	playSoundA
	.word	2439936
	.word	gamesong2
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
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r5, #67108864
	mov	r2, #768
	ldr	r0, .L24
	ldr	r1, .L24+4
	ldr	r4, .L24+8
	str	r3, [r0]
	str	r3, [r1]
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L24+12
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r3, #3584
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L24+20
	ldr	r1, .L24+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L24+28
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L24+32
	ldr	r2, .L24+36
	ldr	r1, .L24+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L24+44
	ldr	r1, .L24+48
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L24+52
	ldr	r1, .L24+56
	ldr	r0, .L24+60
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L24+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	pauseHOff
	.word	pauseVOff
	.word	DMANow
	.word	backCloudsPal
	.word	backCloudsTiles
	.word	100720640
	.word	backCloudsMap
	.word	7684
	.word	7120
	.word	100679680
	.word	frontGuyClimbingTiles
	.word	100724736
	.word	frontGuyClimbingMap
	.word	playSoundA
	.word	1903392
	.word	pausesong
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
	ldr	r0, .L40
	ldr	r2, .L40+4
	ldr	r1, [r0]
	ldr	r3, .L40+8
	mla	r3, r1, r3, r2
	ldr	ip, .L40+12
	ldr	r2, .L40+16
	cmp	ip, r3, ror #2
	ldr	r3, [r2]
	addcs	r3, r3, #1
	strcs	r3, [r2]
	mov	ip, #0
	mov	r2, #67108864
	add	r1, r1, #1
	str	r1, [r0]
	ldr	r1, .L40+20
	lsl	r3, r3, #16
	ldrh	r1, [r1]
	lsr	r3, r3, #16
	strh	ip, [r2, #16]	@ movhi
	ldr	r0, .L40+24
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	strh	r1, [r2, #22]	@ movhi
	ldrh	r3, [r0]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L40+28
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L28:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L40+28
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L39:
	push	{r4, lr}
	ldr	r3, .L40+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L41:
	.align	2
.L40:
	.word	vBlankCount
	.word	9544368
	.word	-2023406815
	.word	4772184
	.word	pauseHOff
	.word	pauseVOff
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
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
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r5, #67108864
	mov	r2, #768
	ldr	r0, .L44
	ldr	r1, .L44+4
	ldr	r4, .L44+8
	str	r3, [r0]
	str	r3, [r1]
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L44+12
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r3, #3584
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L44+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L44+20
	ldr	r1, .L44+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L44+28
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L44+32
	ldr	r2, .L44+36
	ldr	r1, .L44+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L44+44
	ldr	r1, .L44+48
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L44+52
	ldr	r1, .L44+56
	ldr	r0, .L44+60
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L44+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	pauseHOff
	.word	pauseVOff
	.word	DMANow
	.word	backCloudsPal
	.word	backCloudsTiles
	.word	100720640
	.word	backCloudsMap
	.word	7684
	.word	7120
	.word	100679680
	.word	frontGuyClimbingTiles
	.word	100724736
	.word	frontGuyClimbingMap
	.word	playSoundA
	.word	1903392
	.word	pausesong
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
	ldr	r0, .L60
	ldr	r2, .L60+4
	ldr	r1, [r0]
	ldr	r3, .L60+8
	mla	r3, r1, r3, r2
	ldr	ip, .L60+12
	ldr	r2, .L60+16
	cmp	ip, r3, ror #2
	ldr	r3, [r2]
	addcs	r3, r3, #1
	strcs	r3, [r2]
	mov	ip, #0
	mov	r2, #67108864
	add	r1, r1, #1
	str	r1, [r0]
	ldr	r1, .L60+20
	lsl	r3, r3, #16
	ldrh	r1, [r1]
	lsr	r3, r3, #16
	strh	ip, [r2, #16]	@ movhi
	ldr	r0, .L60+24
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	strh	r1, [r2, #22]	@ movhi
	ldrh	r3, [r0]
	tst	r3, #8
	beq	.L48
	ldr	r2, .L60+28
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L59
.L48:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L60+28
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L59:
	push	{r4, lr}
	ldr	r3, .L60+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame2
.L61:
	.align	2
.L60:
	.word	vBlankCount
	.word	9544368
	.word	-2023406815
	.word	4772184
	.word	pauseHOff
	.word	pauseVOff
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
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
	ldr	r4, .L64
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L64+4
	mov	lr, pc
	bx	r4
	mov	r3, #2624
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L64+12
	ldr	r1, .L64+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #7168
	mov	r1, #256
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L64+20
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #1
	ldr	r3, .L64+24
	ldr	r1, .L64+28
	ldr	r0, .L64+32
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L64+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L65:
	.align	2
.L64:
	.word	DMANow
	.word	winBGPal
	.word	winBGTiles
	.word	100720640
	.word	winBGMap
	.word	stopSound
	.word	playSoundA
	.word	664992
	.word	endsong
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
	ldr	r3, .L68
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L69:
	.align	2
.L68:
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
	ldr	r4, .L72
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L72+4
	mov	lr, pc
	bx	r4
	mov	r3, #2592
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L72+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L72+12
	ldr	r1, .L72+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #7168
	mov	r1, #256
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L72+20
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #1
	ldr	r3, .L72+24
	ldr	r1, .L72+28
	ldr	r0, .L72+32
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L72+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L73:
	.align	2
.L72:
	.word	DMANow
	.word	loseBGPal
	.word	loseBGTiles
	.word	100720640
	.word	loseBGMap
	.word	stopSound
	.word	playSoundA
	.word	664992
	.word	endsong
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
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L88+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L88+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L88+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
	ldr	r3, .L88+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L85
.L75:
	ldr	r3, .L88+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L86
.L76:
	ldr	r3, .L88+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L87
	pop	{r4, lr}
	bx	lr
.L87:
	pop	{r4, lr}
	b	goToLose
.L86:
	bl	goToWin
	b	.L76
.L85:
	ldr	r3, .L88+36
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L75
.L89:
	.align	2
.L88:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	winG
	.word	loseG
	.word	pauseSound
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
	ldr	r3, .L104
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L104+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L104+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L104+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
	ldr	r3, .L104+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L101
.L91:
	ldr	r3, .L104+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L102
.L92:
	ldr	r3, .L104+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L103
	pop	{r4, lr}
	bx	lr
.L103:
	pop	{r4, lr}
	b	goToLose
.L102:
	bl	goToWin
	b	.L92
.L101:
	ldr	r3, .L104+36
	mov	lr, pc
	bx	r3
	bl	goToPause2
	b	.L91
.L105:
	.align	2
.L104:
	.word	updateGame2
	.word	drawGame2
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	winG2
	.word	loseG2
	.word	pauseSound
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
	ldr	r4, .L109
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L109+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L109+8
	ldr	r1, .L109+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L109+16
	ldr	r1, .L109+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #7
	ldr	r1, .L109+24
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L110:
	.align	2
.L109:
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
	ldr	r3, .L124
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L112
	ldr	r2, .L124+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L123
.L112:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L124+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L123:
	push	{r4, lr}
	ldr	r3, .L124+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L125:
	.align	2
.L124:
	.word	oldButtons
	.word	buttons
	.word	stopSound
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
	ldr	r4, .L128
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L128+4
	mov	lr, pc
	bx	r4
	mov	r3, #3904
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L128+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L128+12
	ldr	r1, .L128+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7168
	mov	r2, #0
	mov	ip, #256
	mov	r0, #8
	ldr	r1, .L128+20
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L129:
	.align	2
.L128:
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
	ldr	r4, .L142
	ldrh	r3, [r4]
	tst	r3, #32
	beq	.L131
	ldr	r2, .L142+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L140
.L131:
	tst	r3, #16
	beq	.L130
	ldr	r3, .L142+4
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L141
.L130:
	pop	{r4, lr}
	bx	lr
.L141:
	pop	{r4, lr}
	b	goToInstructions2
.L140:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L131
.L143:
	.align	2
.L142:
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
	ldr	r3, .L158
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L145
	ldr	r2, .L158+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L157
.L145:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L158+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L157:
	push	{r4, lr}
	ldr	r3, .L158+8
	mov	lr, pc
	bx	r3
	bl	goToGame2
	ldr	r3, .L158+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	oldButtons
	.word	buttons
	.word	stopSound
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
	mov	r1, #0
	ldr	r2, .L178
	push	{r4, r7, fp, lr}
	ldr	r3, .L178+4
	str	r1, [r2]
	ldr	r6, .L178+8
	mov	lr, pc
	bx	r3
	ldr	r7, .L178+12
	ldr	r3, .L178+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L178+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L178+24
	ldr	r2, [r6]
	ldrh	r0, [r7]
	ldr	fp, .L178+28
	ldr	r10, .L178+32
	ldr	r9, .L178+36
	ldr	r8, .L178+40
	ldr	r4, .L178+44
.L162:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #8
	ldrls	pc, [pc, r2, asl #2]
	b	.L174
.L164:
	.word	.L172
	.word	.L171
	.word	.L170
	.word	.L169
	.word	.L168
	.word	.L167
	.word	.L166
	.word	.L165
	.word	.L163
.L163:
	ldr	r3, .L178+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L165:
	ldr	r3, .L178+52
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L166:
	tst	r0, #8
	beq	.L174
	ldr	r3, .L178+56
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L167:
	tst	r0, #8
	beq	.L174
	ldr	r3, .L178+60
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L168:
	ldr	r3, .L178+64
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L169:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L170:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L171:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L172:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r7]
	b	.L162
.L174:
	mov	r0, r3
	b	.L162
.L179:
	.align	2
.L178:
	.word	vBlankCount
	.word	setupSounds
	.word	state
	.word	buttons
	.word	setupInterrupts
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
	.comm	pauseVOff,4,4
	.comm	pauseHOff,4,4
	.comm	vBlankCount,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	timeToNextBall,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
