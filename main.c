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
#include "spritesheet.h"
#include "game.h"
#include "game2.h"


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

// States
enum {START, GAME, GAME2, PAUSE, PAUSE2, WIN, LOSE, INSTRUCTIONS};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;



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
        }

    }

}

void initialize() {
    // Set up the first state
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

    state = START;


}

void start() {

    // State transitions
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        goToGame2();
        initGame2();
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        goToInstructions();
    }
}

void goToGame() {
    DMANow(3, gameBGXLPal, PALETTE, 256);
    DMANow(3, gameBGXLTiles, &CHARBLOCK[0], gameBGXLTilesLen / 2);
    DMANow(3, gameBGXLMap, &SCREENBLOCK[28], 1024 * 4);
    


    REG_BG0CNT= BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_TALL | BG_4BPP;
   
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

	hideSprites();

    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 

    state = GAME;
}

// Runs every frame of the game state
void game() {


    updateGame();
    drawGame();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
    if (winG)
        goToWin();
    if (loseG)
        goToLose(); 
}

void goToGame2() {
    DMANow(3, gameBGPal, PALETTE, 256);
    DMANow(3, gameBGTiles, &CHARBLOCK[0], gameBGTilesLen / 2);
    DMANow(3, gameBGMap, &SCREENBLOCK[28], 1024 * 4);
    


    REG_BG0CNT= BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_TALL | BG_4BPP;
   
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

	hideSprites();

    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 

    state = GAME2;
}

// Runs every frame of the game state
void game2() {


    updateGame2();
    drawGame2();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToPause2();
    if (winG2)
        goToWin();
    if (loseG2)
        goToLose(); 
}

void goToPause() {
    int hOff = 0;
    int vOff = 0;

    DMANow(3, pauseBGPal, PALETTE, 256);
    DMANow(3, pauseBGTiles, &CHARBLOCK[0], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[28], 1024 * 4);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    state = PAUSE;

}

void pause() {


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToPause2() {
    int hOff = 0;
    int vOff = 0;

    DMANow(3, pauseBGPal, PALETTE, 256);
    DMANow(3, pauseBGTiles, &CHARBLOCK[0], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[28], 1024 * 4);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    state = PAUSE2;

}

void pause2() {


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame2();
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
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}