/*In this milestone I finalized all the backgrounds. I made a pause screen
with a scrolling background. I fixed the rock fall collisions. I added a
cheat to the sport game. If you press a all the spiders disappear. I also 
added a timer to the speed game. I have two sprites with more than 3 frames
of animation, the sport climber and the numbers in the speed game, all other
sprites have two animation states except for the rocks which just have one. 
I add all of the sound for the game. I have 5 looping songs and 1 non looping
sound, a grunt in the speed game. I may add the scream for when the sport player
dies but it's not a priority right now. I also implemented alpha blending in 
the sport game when the player "falls" off the edge of the mountain. I really want
to get an A on this assignment so if you have any suggestions please let me know.
Also for some reason, all the sprites in the game alpha blend when I have alpha
blend off for the spiders and rocks, so if that's a quick fix for that that you 
know of i'd really appreciate a solution. Thank you */
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "startbg.h"
#include "loseBG.h"
#include "pausebg.h"
#include "winbg.h"
#include "gameBGXL.h"
#include "gameBG.h"
#include "instructionBG.h"
#include "instructionBG2.h"
#include "spritesheet.h"
#include "game.h"
#include "game2.h"
#include "sound.h"
#include "startsong.h"
#include "gamesong.h"
#include "gamesong2.h"
#include "pausesong.h"
#include "endsong.h"
#include "backClouds.h"
#include "frontGuyClimbing.h"





// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToGame2();
void game2();
void goToPause();
void pause();
void goToPause2();
void pause2();
void goToWin();
void win();
void goToLose();
void lose();
void goToInstructions();
void instructions();
void goToInstructions2();
void instructions2();

// States
enum {START, GAME, GAME2, PAUSE, PAUSE2, WIN, LOSE, INSTRUCTIONS, INSTRUCTIONS2};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int vBlankCount;
int pauseHOff;
int pauseVOff;



int main() {
    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case GAME2:
                game2();
                break;
            case PAUSE:
                pause();
                break;
            case PAUSE2:
                pause2();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case INSTRUCTIONS2:
                instructions2();
                break;
        }

    }

}

void initialize() {
    vBlankCount = 0;
    // Set up the first state
    setupSounds();
	setupInterrupts();
    goToStart();
}

void goToStart() {
    int hOff = 0;
    int vOff = 0;
    
    

    DMANow(3, startBGPal, PALETTE, 256);
    DMANow(3, startBGTiles, &CHARBLOCK[0], startBGTilesLen / 2);
    DMANow(3, startBGMap, &SCREENBLOCK[28], 1024 * 4);

    // Tell the BG0 control register where to look for its tiles and tile map AND
    // 		how to read them from this location (using the given settings)
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    playSoundA(startsong, STARTSONGLEN, 1);

    state = START;


}

void start() {

    // State transitions
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        goToInstructions();

    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        goToInstructions2();

    }
}

void goToGame() {
    DMANow(3, gameBGXLPal, PALETTE, 256);
    DMANow(3, gameBGXLTiles, &CHARBLOCK[0], gameBGXLTilesLen / 2);
    DMANow(3, gameBGXLMap, &SCREENBLOCK[28], gameBGXLMapLen / 2);
    


    REG_BG0CNT= BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_TALL | BG_4BPP;
   
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    REG_BLDCNT = BLD_OBJa | BLD_WHITE;
	hideSprites();

    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    stopSound();
    playSoundA(gamesong, GAMESONGLEN, 1);

    state = GAME;
}

// Runs every frame of the game state
void game() {


    updateGame();
    drawGame();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        pauseSound();
        goToPause();
    }

    if (winG)
        goToWin();
    if (loseG)
        goToLose(); 
}

void goToGame2() {
    DMANow(3, gameBGPal, PALETTE, 256);
    DMANow(3, gameBGTiles, &CHARBLOCK[0], gameBGTilesLen / 2);
    DMANow(3, gameBGMap, &SCREENBLOCK[28], gameBGMapLen / 2);
    


    REG_BG0CNT= BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_TALL | BG_4BPP;
   
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

	hideSprites();

    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    stopSound();
    playSoundA(gamesong2, GAMESONG2LEN, 1);

    state = GAME2;
}

// Runs every frame of the game state
void game2() {


    updateGame2();
    drawGame2();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        pauseSound();
        goToPause2();
    }
    if (winG2)
        goToWin();
    if (loseG2)
        goToLose(); 
}

void goToPause() {
    pauseHOff = 0;
    pauseVOff = 0;
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE;

    DMANow(3, backCloudsPal, PALETTE, 256);

    REG_BG1CNT= BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | BG_4BPP; 

    DMANow(3, backCloudsTiles, &CHARBLOCK[0], backCloudsTilesLen / 2);
    DMANow(3, backCloudsMap, &SCREENBLOCK[28], backCloudsMapLen / 2);

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, frontGuyClimbingTiles, &CHARBLOCK[1], frontGuyClimbingTilesLen / 2);
    DMANow(3, frontGuyClimbingMap, &SCREENBLOCK[30], frontGuyClimbingMapLen / 2);
    


    playSoundA(pausesong, STARTSONGLEN, 1);

    state = PAUSE;

}

void pause() { 
    if(vBlankCount % 900 == 0) {
        pauseHOff++;
    }
    vBlankCount++;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = pauseVOff;
    REG_BG1HOFF = pauseHOff;
    REG_BG1VOFF = pauseVOff;   


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){

        unpauseSound();
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToPause2() {
    pauseHOff = 0;
    pauseVOff = 0;
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE;

    DMANow(3, backCloudsPal, PALETTE, 256);

    REG_BG1CNT= BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | BG_4BPP; 

    DMANow(3, backCloudsTiles, &CHARBLOCK[0], backCloudsTilesLen / 2);
    DMANow(3, backCloudsMap, &SCREENBLOCK[28], backCloudsMapLen / 2);

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, frontGuyClimbingTiles, &CHARBLOCK[1], frontGuyClimbingTilesLen / 2);
    DMANow(3, frontGuyClimbingMap, &SCREENBLOCK[30], frontGuyClimbingMapLen / 2);
    


    playSoundA(pausesong, STARTSONGLEN, 1);

    state = PAUSE2;

}

void pause2() {
    if(vBlankCount % 900 == 0) {    
        pauseHOff++;
    }
    vBlankCount++;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = pauseVOff;
    REG_BG1HOFF = pauseHOff;
    REG_BG1VOFF = pauseVOff;   


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){

        unpauseSound();
        goToGame2();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    int hOff = 0;
    int vOff = 0;

    DMANow(3, winBGPal, PALETTE, 256);
    DMANow(3, winBGTiles, &CHARBLOCK[0], winBGTilesLen / 2);
    DMANow(3, winBGMap, &SCREENBLOCK[28], 1024 * 4);


    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    stopSound();
    playSoundA(endsong, ENDSONGLEN, 1);

    state = WIN;


}

void win() {
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToLose() {
    int hOff = 0;
    int vOff = 0;

    DMANow(3, loseBGPal, PALETTE, 256);
    DMANow(3, loseBGTiles, &CHARBLOCK[0], loseBGTilesLen / 2);
    DMANow(3, loseBGMap, &SCREENBLOCK[28], 1024 * 4);


    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    stopSound();
    playSoundA(endsong, ENDSONGLEN, 1);

    state = LOSE;

}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

void goToInstructions() {
    int hOff = 0;
    int vOff = 0;

    DMANow(3, instructionBGPal, PALETTE, 256);
    DMANow(3, instructionBGTiles, &CHARBLOCK[0], instructionBGTilesLen / 2);
    DMANow(3, instructionBGMap, &SCREENBLOCK[28], 1024 * 4);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    state = INSTRUCTIONS;

}

void instructions() {


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
		//playSoundA(gamesong, GAMESONGLEN, 1);
        initGame();
        goToGame();
        //initGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToInstructions2() {
    int hOff = 0;
    int vOff = 0;

    DMANow(3, instructionBG2Pal, PALETTE, 256);
    DMANow(3, instructionBG2Tiles, &CHARBLOCK[0], instructionBG2TilesLen / 2);
    DMANow(3, instructionBG2Map, &SCREENBLOCK[28], 1024 * 4);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    state = INSTRUCTIONS2;

}

void instructions2() {


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
		//playSoundA(gamesong2, GAMESONG2LEN, 1);
        goToGame2();
        initGame2();

    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

}