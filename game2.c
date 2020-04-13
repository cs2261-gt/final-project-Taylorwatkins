#include "myLib.h"
#include "game2.h"

PLAYER player;
int amJumping;
int ground;
int idle = 2;

int hOff;
int vOff;

int loseG2;
int winG2;

#define GRAVITY 100
#define JUMPPOWER 1500
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)

void initGame2() {
    hOff = 0;
    vOff = MAPHEIGHT2 - SCREENHEIGHT;
    ground = (SCREENHEIGHT / 2 + vOff);
    amJumping = 1;
    initPlayer2();
}

void drawGame2() {
    drawPlayer2();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void updateGame2() {
    updatePlayer2();
}

void initPlayer2() {
    player.width = 16;
    player.height = 16;
    player.worldRow = SHIFTUP(SCREENHEIGHT / 2  + vOff);
    player.worldCol = SCREENWIDTH / 2 - player.height / 2 + hOff; 
    player.rdel = 0;
    player.cdel = 1;
    player.aniCounter = 0;
    player.curFrame = idle;
    player.numFrames = 4;
    player.aniState = 0;
}

void updatePlayer2() {
    if (SHIFTDOWN(player.worldRow + player.rdel) < ground) {
        player.worldRow += player.rdel;

    } else {
        player.rdel = 0;
        amJumping = 0;

    }

    if (BUTTON_PRESSED(BUTTON_UP) && !amJumping) {
        player.rdel -= JUMPPOWER;
        amJumping = 1;


        if (vOff >= 0 && player.screenRow < SCREENHEIGHT / 2) {
    	        vOff--; 
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol > 0 ) {
            player.worldCol -= player.cdel;
    
            if (hOff >= 0 && player.screenCol < SCREENWIDTH / 2) {
                hOff--; 
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol < MAPWIDTH2 - player.width) {
            player.worldCol += player.cdel;

            if (hOff < MAPWIDTH2 - SCREENWIDTH &&  player.screenCol > SCREENWIDTH / 2){
                hOff++;

            }
        }
    }

    player.rdel += GRAVITY;


    player.screenRow = SHIFTDOWN(player.worldRow) - vOff + 64;
    player.screenCol = player.worldCol - hOff;
}

void drawPlayer2() {
    shadowOAM[100].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[100].attr1 = (COLMASK & player.screenCol) |ATTR1_SMALL;
    shadowOAM[100].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
}