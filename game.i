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
    int active;

} ROCK;

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
    int active;
    int prevWorldCol;
} SPIDER;


extern int hOff;
extern int vOff;
extern int winG;
extern int loseG;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE climber;
extern ROCK rocks[5];
int time;
int timeToNextBall;


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
ROCK rocks[5];
SPIDER spiders[3];
int winG;
int loseG;
int time;
int timeToNextBall;

void initGame() {


    vOff = 512 - 160;
    hOff = 0;
    winG = 0;
    loseG = 0;

    initPlayer();
    initRocks();
    initSpiders();
}


void updateGame() {



    makeBallsFall();
 updatePlayer();

    for (int i = 0; i < 5; i++)
  updateRock(&rocks[i]);

    for (int i = 0; i < 3; i++)
  updateSpider(&spiders[i]);



}

void drawGame() {

    drawPlayer();
    for (int i = 0; i < 5; i++)
  drawRocks(&rocks[i]);


  drawSpiders();


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

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        if (climber.worldRow > 0
        && collisionsBitmap[((climber.worldRow - climber.rdel)*(256)+(climber.worldCol))]
        && collisionsBitmap[((climber.worldRow - climber.rdel)*(256)+(climber.worldCol + climber.width - 1))]){
            climber.worldRow -= climber.rdel * 10;


            if (vOff >= 0 && climber.screenRow < 160 / 2) {
                vOff-- * 10;
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

void initRocks() {
 for (int i = 0; i < 5; i++) {
  rocks[i].worldRow = 0;
  rocks[i].worldCol = 0;
  rocks[i].rdel = 2;
  rocks[i].cdel = 0;
  rocks[i].hide = 0;
        rocks[i].height = 8;
        rocks[i].width = 8;
        rocks[i].active = 0;
 }
}

void drawRocks(ROCK* r) {
    for (int i = 0; i < 5; i++) {
        if((r[i].screenRow < -r[i].height) || !r[i].active){
           shadowOAM[1+i].attr0 |= (2<<8);
        }
        else {
            shadowOAM[1+i].attr0 = (0xFF & r[i].screenRow) | (0<<14);
            shadowOAM[1+i].attr1 = (0x1FF & r[i].screenCol) | (0<<14);
            shadowOAM[1+i].attr2 = ((0)<<12) | ((1)*32+(0));
        }
    }
}

void updateRock(ROCK* r) {

    if (r->worldCol < 1) {
  r->worldCol = 1;
 }
 if (r->worldCol > 256 - r->width) {
  r->worldCol = 256 - r->width;
 }


    if(r->active) {
   r->worldRow += r->rdel;
  if( r->worldRow > 512 - r->height) {
   r->active = 0;
   r->worldRow = -(r->height);
  }

        if (collision(r->worldCol, r->worldRow, r->width, r->height, climber.worldCol, climber.worldRow, climber.width, climber.height)) {
            r->active = 0;

            loseG = 1;
        }
    }
    r->screenRow = r->worldRow - vOff;
    r->screenCol = r->worldCol - hOff;



}

void makeBallsFall() {

 for (int i = 0; i < 5; i++) {
  if (!rocks[i].active) {
            rocks[i].active = 1;

      rocks[i].worldRow = -(rocks[i].height);
      rocks[i].worldCol = rand()%(240);


   break;
  }
 }
}







void initSpiders() {
    for (int i = 0; i < 3; i++) {
        spiders[i].active = 1;
        spiders[i].width = 8;
        spiders[i].height = 8;
        spiders[i].cdel = 1;
        spiders[i].rdel = 0;


        spiders[i].worldCol = 100;
        spiders[i].worldRow = rand()%100 + vOff;
    }
}

void drawSpiders() {
    for (int i = 0; i < 3; i++) {
        if(!spiders[i].active){
           shadowOAM[7+i].attr0 = (2<<8);
        }
        else {
            shadowOAM[7+i].attr0 = (0xFF & spiders[i].screenRow) | (0<<14);
            shadowOAM[7+i].attr1 = (0x1FF & spiders[i].screenCol) | (0<<14);
            shadowOAM[7+i].attr2 = ((0)<<12) | ((1)*32+(0));
        }
    }
}

void updateSpider(SPIDER* s) {







    if(s->active){


        if(s->screenRow>160){
            s->active=0;
        }
        if(s->worldCol > 256 - 2) {
            s->cdel *= -1;
        }
        if(s->worldCol < 100) {
            s->cdel *= -1;
        }
        s->worldCol += s->cdel;




        if (collision(s->screenCol, s->screenRow, s->width, s->height, climber.screenCol, climber.screenRow, climber.width, climber.height)) {
            s->active = 0;
            loseG = 1;
        }


    }

    s->screenRow = s->worldRow - vOff;
    s->screenCol = s->worldCol - hOff;
# 317 "game.c"
}
