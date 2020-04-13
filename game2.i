# 1 "game2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game2.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
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
# 157 "myLib.h"
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
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
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

PLAYER player;
int amJumping;
int ground;
int idle = 2;

int hOff;
int vOff;

int loseG2;
int winG2;






void initGame2() {
    hOff = 0;
    vOff = 512 - 160;
    ground = (160 / 2 + vOff);
    amJumping = 1;
    initPlayer2();
}

void drawGame2() {
    drawPlayer2();
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void updateGame2() {
    updatePlayer2();
}

void initPlayer2() {
    player.width = 16;
    player.height = 16;
    player.worldRow = ((160 / 2 + vOff) << 8);
    player.worldCol = 240 / 2 - player.height / 2 + hOff;
    player.rdel = 0;
    player.cdel = 1;
    player.aniCounter = 0;
    player.curFrame = idle;
    player.numFrames = 4;
    player.aniState = 0;
}

void updatePlayer2() {
    if (((player.worldRow + player.rdel) >> 8) < ground) {
        player.worldRow += player.rdel;

    } else {
        player.rdel = 0;
        amJumping = 0;

    }

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !amJumping) {
        player.rdel -= 1500;
        amJumping = 1;


        if (vOff >= 0 && player.screenRow < 160 / 2) {
             vOff--;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol > 0 ) {
            player.worldCol -= player.cdel;

            if (hOff >= 0 && player.screenCol < 240 / 2) {
                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.worldCol < 256 - player.width) {
            player.worldCol += player.cdel;

            if (hOff < 256 - 240 && player.screenCol > 240 / 2){
                hOff++;

            }
        }
    }

    player.rdel += 100;


    player.screenRow = ((player.worldRow) >> 8) - vOff + 64;
    player.screenCol = player.worldCol - hOff;
}

void drawPlayer2() {
    shadowOAM[100].attr0 = (0xFF & player.screenRow) | (0<<14);
    shadowOAM[100].attr1 = (0x1FF & player.screenCol) |(1<<14);
    shadowOAM[100].attr2 = ((0)<<12) | ((0)*32+(0));
}
