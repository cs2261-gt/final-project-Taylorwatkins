#define MAPHEIGHT2 512
#define MAPWIDTH2 256

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

// Prototypes
void initGame2();
void updateGame2();
void drawGame2();
void initPlayer2();
void updatePlayer2();
void animatePlayer2();
void drawPlayer2();
void initNums();
void initNums10();
void drawNums();
void drawNums10();
void updateNums();
void updateNums10();