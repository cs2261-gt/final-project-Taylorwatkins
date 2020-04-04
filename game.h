// Constants
#define MAPHEIGHT 512
#define MAPWIDTH 256

// Variables
extern int hOff;
extern int vOff;
extern int winG;
extern int loseG;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE pikachu;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();