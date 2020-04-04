# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern int winG;
extern int loseG;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE pikachu;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
# 3 "game.c" 2
# 1 "collisions.h" 1
# 20 "collisions.h"
extern const unsigned short collisionsBitmap[131072];
# 4 "game.c" 2
# 1 "collisionLose.h" 1
# 20 "collisionLose.h"
extern const unsigned short collisionLoseBitmap[131072];
# 5 "game.c" 2

int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE climber;
ANISPRITE rocks;
int winG;
int loseG;

void initGame() {


    vOff = 512 - 160;
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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void initPlayer() {
    climber.width = 16;
    climber.height = 16;
    climber.rdel = 1;
    climber.cdel = 1;
    climber.worldRow = vOff + 160 - climber.height;
    climber.worldCol = hOff;
}


void updatePlayer() {

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (climber.worldRow > 0
        && collisionsBitmap[((climber.worldRow - climber.rdel)*(256)+(climber.worldCol))]
        && collisionsBitmap[((climber.worldRow - climber.rdel)*(256)+(climber.worldCol + climber.width - 1))]){
            climber.worldRow -= climber.rdel;


            if (vOff >= 0 && climber.screenRow < 160 / 2) {
                vOff--;
            }

        }
        if (climber.worldRow == 0) {
            winG = 1;
        }

    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (climber.worldRow < 512 - climber.height
        && collisionsBitmap[((climber.worldRow + climber.height - 1 + climber.rdel)*(256)+(climber.worldCol))]
        && collisionsBitmap[((climber.worldRow + climber.height - 1 + climber.rdel)*(256)+(climber.worldCol + climber.width - 1))]){
            climber.worldRow += climber.rdel;

            if (vOff < 512 - 160 && climber.screenRow > 160 / 2){
                vOff++;
            }
        }

    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (climber.worldCol > 0
        && collisionsBitmap[((climber.worldRow)*(256)+(climber.worldCol - climber.cdel))]
        && collisionsBitmap[((climber.worldRow + climber.height - 1)*(256)+(climber.worldCol - climber.cdel))]){

            climber.worldCol -= climber.cdel;

            if (hOff >= 0 && climber.screenCol < 240 / 2) {
                hOff--;
            }
        }
        if (!(collisionLoseBitmap[((climber.worldRow)*(256)+(climber.worldCol))]
        && collisionLoseBitmap[((climber.worldRow + climber.height - 1)*(256)+(climber.worldCol))])) {
            loseG = 1;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (climber.worldCol < 256 - climber.width
        && collisionsBitmap[((climber.worldRow)*(256)+(climber.worldCol + climber.width - 1 + climber.cdel))]
        && collisionsBitmap[((climber.worldRow + climber.height - 1)*(256)+(climber.worldCol + climber.width - 1 + climber.cdel))]) {
            climber.worldCol += climber.cdel;


            if (hOff < 256 - 240 && climber.screenCol > 240 / 2){
                hOff++;

            }
        }

    }



    climber.screenRow = climber.worldRow - vOff;
    climber.screenCol = climber.worldCol - hOff;



}

void drawPlayer() {

    if (climber.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & climber.screenRow) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & climber.screenCol) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((climber.curFrame * 2)*32+(climber.aniState * 2));
    }
}
