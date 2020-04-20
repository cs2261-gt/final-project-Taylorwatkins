#include "myLib.h"
#include "game2.h"
#include "collision2.h"
#include "sportCollision.h"
#include "grunt.h"

PLAYER player;
ANISPRITE nums;
ANISPRITE nums10;
int amJumping;
int onBar;
int ground;
int idle = 4;

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
    initNums();
    initNums10();
    winG2 = 0;
    loseG2 = 0;

}

void drawGame2() {
    drawPlayer2();
    drawNums();
    drawNums10();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void updateGame2() {
    updatePlayer2();
    updateNums();

    updateNums10();


}

void initPlayer2() {
    player.width = 16;
    player.height = 16;
    player.worldRow = SHIFTUP(SCREENHEIGHT-player.width + vOff);
    player.worldCol = SCREENWIDTH / 2 - player.height / 2; 
    player.rdel = 0;
    player.cdel = 1;
    player.curFrame = 4;
    player.aniState = 0;
}

void updatePlayer2() {
    if (BUTTON_PRESSED(BUTTON_UP) && !amJumping) {
        player.rdel -= JUMPPOWER;
        amJumping = 1;
        playSoundB(grunt, GRUNTLEN, 0);
        
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
        player.aniState = 2;
    }

    //if the player isn't on the bar anymore, allow gravity to be applied
    if(collision2Bitmap[OFFSET(player.worldCol, SHIFTDOWN(player.worldRow+player.rdel),MAPWIDTH2)]
        && collision2Bitmap[OFFSET(player.worldCol + player.width - 1, SHIFTDOWN(player.worldRow+player.rdel) , MAPWIDTH2)]){
        onBar=0;
        player.aniState = 0;
    }



    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol > 0 
        && sportCollisionBitmap[OFFSET(player.worldCol - player.cdel, SHIFTDOWN(player.worldRow), MAPWIDTH2)]
        && sportCollisionBitmap[OFFSET(player.worldCol - player.cdel, SHIFTDOWN(player.worldRow + player.height - 1), MAPWIDTH2)]) {
            player.worldCol -= player.cdel;
    
            if (hOff >= 0 && player.screenCol < SCREENWIDTH / 2) {
                hOff--; 
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol < MAPWIDTH2 - player.width
        && sportCollisionBitmap[OFFSET(player.worldCol + player.width - 1 + player.cdel, SHIFTDOWN(player.worldRow), MAPWIDTH2)]
        && sportCollisionBitmap[OFFSET(player.worldCol + player.width - 1 + player.cdel, SHIFTDOWN(player.worldRow  + player.height - 1), MAPWIDTH2)]) {
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
    shadowOAM[100].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4,player.aniState);
}


void initNums() {
    nums.width = 8;
    nums.height = 8;
    nums.screenRow = nums.height; //+ vOff;
    nums.screenCol = 20; 
    nums.rdel = 0;
    nums.cdel = 1;
    nums.curFrame = 5;
    nums.aniState = -1;
    nums.aniCounter = 0;
    nums.numFrames = 10;

}
void initNums10() {
    nums10.width = 8;
    nums10.height = 8;
    nums10.screenRow = nums.height; //+ vOff;
    nums10.screenCol = 20 - 8; 
    nums10.rdel = 0;
    nums10.cdel = 1;
    nums10.curFrame = 5;
    nums10.aniState = -1;
    nums10.aniCounter = 0;
    nums10.numFrames = 10;

}


void drawNums() {
    shadowOAM[101].attr0 = (ROWMASK & nums.screenRow) | ATTR0_SQUARE;
    shadowOAM[101].attr1 = (COLMASK & nums.screenCol) |ATTR1_TINY;
    shadowOAM[101].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, nums.aniState);
}



void drawNums10() {
    shadowOAM[102].attr0 = (ROWMASK & nums10.screenRow) | ATTR0_SQUARE;
    shadowOAM[102].attr1 = (COLMASK & nums10.screenCol) |ATTR1_TINY;
    shadowOAM[102].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, nums10.aniState);
}

void updateNums() {
    if(nums.aniCounter % 60 == 0) {
        nums.aniState = (nums.aniState + 1) % nums.numFrames;
    }
    nums.aniCounter++;

}

void updateNums10() {
    if(nums10.aniCounter % 600 == 0) {
        nums10.aniState = (nums10.aniState + 1) % nums10.numFrames;
        if (nums10.aniState == 6){
            loseG2 = 1;
        }
    }
    nums10.aniCounter++;

}
