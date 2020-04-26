# 1 "game2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game2.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 72 "myLib.h"
extern unsigned short *videoBuffer;
# 93 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 165 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 208 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 219 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 259 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 350 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game2.c" 2
# 1 "game2.h" 1



typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} PLAYER;

extern int hOff;
extern int vOff;
extern int winG2;
extern int loseG2;


void initGame2();
void updateGame2();
void drawGame2();
void initPlayer2();
void updatePlayer2();
void animatePlayer2();
void drawPlayer2();
# 3 "game2.c" 2
# 1 "collision2.h" 1
# 20 "collision2.h"
extern const unsigned short collision2Bitmap[131072];
# 4 "game2.c" 2
# 1 "sportCollision.h" 1
# 20 "sportCollision.h"
extern const unsigned short sportCollisionBitmap[131072];
# 5 "game2.c" 2
# 1 "grunt.h" 1




extern const signed char grunt[4234];
# 6 "game2.c" 2

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






void initGame2() {
    hOff = 0;
    vOff = 512 - 160 - 1;


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
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void updateGame2() {
    updatePlayer2();
    updateNums();

    updateNums10();


}

void initPlayer2() {
    player.width = 16;
    player.height = 16;
    player.worldRow = ((160 -player.width + vOff) << 8);
    player.worldCol = 240 / 2 - player.height / 2;
    player.rdel = 0;
    player.cdel = 1;
    player.curFrame = 4;
    player.aniState = 0;
}

void updatePlayer2() {
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !amJumping) {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
            player.rdel -= (1700 + 300);
        } else {
            player.rdel -= 1700;
        }

        amJumping = 1;
        playSoundB(grunt, 4234, 0);

    }





    if(player.rdel > 0){
        if (vOff + ((player.rdel) >> 8) < 512 -1 && player.screenRow > 160 / 2 && vOff < 512 - 160) {
                vOff++;

        }
    } else if(player.rdel<0){
        if (vOff >= 0 && player.screenRow < 160 / 2 && player.screenRow < vOff) {
                vOff--;
                if (player.screenRow < vOff) {
                    vOff--;
                }
        }
    }


    if (player.worldRow <= 3) {
        winG2 = 1;
    }

    if(!onBar){
        player.rdel += 90;
    }

    if (((player.worldRow) >> 8) > vOff + 160 - 1) {
            loseG2 = 1;
    }



    if(((player.worldRow + player.rdel) >> 8) + player.height-1 < 512 -1){
        player.worldRow += player.rdel;
    } else {
        player.rdel = 0;
        amJumping = 0;
    }



    if(player.rdel > 0 && !collision2Bitmap[((((player.worldRow+player.rdel) >> 8))*(256)+(player.worldCol))]
        && !collision2Bitmap[((((player.worldRow+player.rdel) >> 8))*(256)+(player.worldCol + player.width - 1))]){
        player.rdel = 0;
        onBar = 1;
        amJumping = 0;
        player.aniState = 2;
    }


    if(collision2Bitmap[((((player.worldRow+player.rdel) >> 8))*(256)+(player.worldCol))]
        && collision2Bitmap[((((player.worldRow+player.rdel) >> 8))*(256)+(player.worldCol + player.width - 1))]){
        onBar=0;
        player.aniState = 0;
    }



    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol > 0
        && sportCollisionBitmap[((((player.worldRow) >> 8))*(256)+(player.worldCol - player.cdel))]
        && sportCollisionBitmap[((((player.worldRow + player.height - 1) >> 8))*(256)+(player.worldCol - player.cdel))]) {
            player.worldCol -= player.cdel;

            if (hOff >= 0 && player.screenCol < 240 / 2) {
                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.worldCol < 256 - player.width
        && sportCollisionBitmap[((((player.worldRow) >> 8))*(256)+(player.worldCol + player.width - 1 + player.cdel))]
        && sportCollisionBitmap[((((player.worldRow + player.height - 1) >> 8))*(256)+(player.worldCol + player.width - 1 + player.cdel))]) {
            player.worldCol += player.cdel;

            if (hOff < 256 - 240 && player.screenCol > 240 / 2){
                hOff++;

            }
        }
    }


    player.screenRow = ((player.worldRow) >> 8) - vOff;
    player.screenCol = player.worldCol - hOff;


}

void drawPlayer2() {
    shadowOAM[100].attr0 = (0xFF & player.screenRow) | (0<<14);
    shadowOAM[100].attr1 = (0x1FF & player.screenCol) |(1<<14);
    shadowOAM[100].attr2 = ((0)<<12) | ((player.aniState)*32+(4));
}


void initNums() {
    nums.width = 8;
    nums.height = 8;
    nums.screenRow = nums.height;
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
    nums10.screenRow = nums.height;
    nums10.screenCol = 20 - 8;
    nums10.rdel = 0;
    nums10.cdel = 1;
    nums10.curFrame = 5;
    nums10.aniState = -1;
    nums10.aniCounter = 0;
    nums10.numFrames = 10;

}


void drawNums() {
    shadowOAM[101].attr0 = (0xFF & nums.screenRow) | (0<<14);
    shadowOAM[101].attr1 = (0x1FF & nums.screenCol) |(0<<14);
    shadowOAM[101].attr2 = ((0)<<12) | ((nums.aniState)*32+(6));
}



void drawNums10() {
    shadowOAM[102].attr0 = (0xFF & nums10.screenRow) | (0<<14);
    shadowOAM[102].attr1 = (0x1FF & nums10.screenCol) |(0<<14);
    shadowOAM[102].attr2 = ((0)<<12) | ((nums10.aniState)*32+(6));
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
        if (nums10.aniState == 2){
            loseG2 = 1;
        }
    }
    nums10.aniCounter++;

}
