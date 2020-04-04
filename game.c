#include "myLib.h"
#include "game.h"
#include "collisions.h"
#include "collisionLose.h"
// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE climber;
ANISPRITE rocks;
int winG;
int loseG;

void initGame() {

	// Place screen on map
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hOff = 0;
    winG = 0;
    loseG = 0;

    initPlayer();
}


void updateGame() {

	updatePlayer();
}

void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void initPlayer() {
    climber.width = 16;
    climber.height = 16;
    climber.rdel = 1;
    climber.cdel = 1;
    climber.worldRow = vOff + SCREENHEIGHT - climber.height;
    climber.worldCol = hOff;
}


void updatePlayer() {

    if(BUTTON_HELD(BUTTON_UP)) {
        if (climber.worldRow > 0 
        && collisionsBitmap[OFFSET(climber.worldCol, climber.worldRow - climber.rdel, MAPWIDTH)] 
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow - climber.rdel, MAPWIDTH)]){
            climber.worldRow -= climber.rdel; 
  

            if (vOff >= 0 && climber.screenRow < SCREENHEIGHT / 2) {
                vOff--;
            } 
            
        }
        if (climber.worldRow == 0) {
            winG = 1;
        }

    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (climber.worldRow < MAPHEIGHT - climber.height
        && collisionsBitmap[OFFSET(climber.worldCol, climber.worldRow + climber.height - 1 + climber.rdel, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow  + climber.height - 1 + climber.rdel, MAPWIDTH)]){
            climber.worldRow += climber.rdel;

            if (vOff < MAPHEIGHT - SCREENHEIGHT &&  climber.screenRow > SCREENHEIGHT / 2){
                vOff++;
            }
        }

    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (climber.worldCol > 0 
        && collisionsBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow + climber.height - 1, MAPWIDTH)]){

            climber.worldCol -= climber.cdel;

            if (hOff >= 0 && climber.screenCol < SCREENWIDTH / 2) {
                hOff--; 
            }
        }
        if (!(collisionLoseBitmap[OFFSET(climber.worldCol, climber.worldRow, MAPWIDTH)]
        && collisionLoseBitmap[OFFSET(climber.worldCol, climber.worldRow + climber.height - 1, MAPWIDTH)])) {
            loseG = 1;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (climber.worldCol < MAPWIDTH - climber.width
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1 + climber.cdel, climber.worldRow, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1 + climber.cdel, climber.worldRow  + climber.height - 1, MAPWIDTH)]) { 
            climber.worldCol += climber.cdel;
       
            
            if (hOff < MAPWIDTH - SCREENWIDTH &&  climber.screenCol > SCREENWIDTH / 2){
                hOff++;

            }
        }

    }

    // TODO 1.0: Update screen row and screen col

    climber.screenRow = climber.worldRow - vOff;
    climber.screenCol = climber.worldCol - hOff;


    //animatePlayer();
}

void drawPlayer() {

    if (climber.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & climber.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & climber.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(climber.aniState * 2, climber.curFrame * 2);
    }
}

