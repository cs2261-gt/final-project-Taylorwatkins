// Constants
#define MAPHEIGHT 1024
#define MAPWIDTH 256
#define ROCKCOUNT 5
#define SPIDERCOUNT 3


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
    //int prevWorldCol;
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

// Variables
extern int hOff;
extern int vOff;
extern int winG;
extern int loseG;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE climber;
extern ROCK rocks[ROCKCOUNT];
int time;
int timeToNextBall;

// Prototypes
void initGame();
void initSpiders();
void initRocks();
void updateGame();
void updateSpider();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void drawRocks();
void drawSpiders();
void updateRock();
void makeBallsFall();

