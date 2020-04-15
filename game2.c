#include "myLib.h"
#include "game2.h"
#include "collision2.h"

PLAYER player;
int amJumping;
int onBar;
int ground;
int idle = 2;

int hOff;
int vOff;

int loseG2;
int winG2;

#define GRAVITY 90 //100
#define JUMPPOWER 1700 //1600
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)

void initGame2() {
    hOff = 0;
    vOff = 512 - SCREENHEIGHT - 1;
    // ground = (SCREENHEIGHT / 2 + vOff);
    //ground = 512 - player.height;
    amJumping = 1;

    onBar = 0;
    initPlayer2();
    winG2 = 0;
    loseG2 = 0;

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
    player.worldRow = SHIFTUP(SCREENHEIGHT-player.width + vOff);
    player.worldCol = SCREENWIDTH / 2 - player.height / 2; 
    player.rdel = 0;
    player.cdel = 1;
    player.aniCounter = 0;
    player.curFrame = idle;
    player.numFrames = 4;
    player.aniState = 0;
}

void updatePlayer2() {
    if (BUTTON_PRESSED(BUTTON_UP) && !amJumping) {
        player.rdel -= JUMPPOWER;
        amJumping = 1;

        
    }

    //Vertical Camera Movement
    if(player.rdel > 0){
        if (vOff + SHIFTDOWN(player.rdel) < MAPHEIGHT2-1 && player.screenRow > SCREENHEIGHT / 2 && vOff < MAPHEIGHT2 - SCREENHEIGHT) {
                vOff++;

        }
    } else if(player.rdel<0){
        if (vOff >= 0 && player.screenRow < SCREENHEIGHT / 2 && player.screenRow < vOff) {
                vOff--;
                if (player.screenRow < vOff) {
                    vOff--;
                }
        }
    }


    if (player.worldRow <= 3) {
        winG2 = 1;
    }
    //only apply gravity if not on the bar
    if(!onBar){
        player.rdel += GRAVITY;
    }
    
    if (SHIFTDOWN(player.worldRow) > vOff + SCREENHEIGHT - 1) {
            loseG2 = 1;
    }

    //on ground, increment worldRow
    //bottom of player in relation to map's boundary
    if(SHIFTDOWN(player.worldRow + player.rdel) + player.height-1 < MAPHEIGHT2-1){
        player.worldRow += player.rdel;
    } else {
        player.rdel = 0;
        amJumping = 0;
    }


    //check collision of top of player with the bar
    if(player.rdel > 0 && !collision2Bitmap[OFFSET(player.worldCol, SHIFTDOWN(player.worldRow+player.rdel),MAPWIDTH2)]
        && !collision2Bitmap[OFFSET(player.worldCol + player.width - 1, SHIFTDOWN(player.worldRow+player.rdel) , MAPWIDTH2)]){
        player.rdel = 0;
        onBar = 1;
        amJumping = 0;
    }

    //if the player isn't on the bar anymore, allow gravity to be applied
    if(collision2Bitmap[OFFSET(player.worldCol, SHIFTDOWN(player.worldRow+player.rdel),MAPWIDTH2)]
        && collision2Bitmap[OFFSET(player.worldCol + player.width - 1, SHIFTDOWN(player.worldRow+player.rdel) , MAPWIDTH2)]){
        onBar=0;
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
    

    player.screenRow = SHIFTDOWN(player.worldRow) - vOff;
    player.screenCol = player.worldCol - hOff;


}

void drawPlayer2() {
    shadowOAM[100].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[100].attr1 = (COLMASK & player.screenCol) |ATTR1_SMALL;
    shadowOAM[100].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
}