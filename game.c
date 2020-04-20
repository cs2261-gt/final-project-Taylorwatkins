#include "myLib.h"
#include "game.h"
#include "collisions.h"
#include "collisionLose.h"
// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE climber;
ROCK rocks[ROCKCOUNT];
SPIDER spiders[SPIDERCOUNT];
int winG;
int loseG;
int time;
int timeToNextBall;
int count;
int winCount;
int playerVOff;
int screenBlock;
int totalVOff;



void initGame() {

	// Place screen on map
    count = 0;
    vOff = 512 - SCREENHEIGHT - 1; // get to beginning of sb 31
    playerVOff = 1024 - SCREENHEIGHT - 1; // initialize to almost the bottom of the screen! because that's where we are stating!
    totalVOff = 1024 - SCREENHEIGHT - 1;
    screenBlock = 30;   
    hOff = 0;
    winG = 0;
    loseG = 0;
    winCount = 1024;

    initPlayer();
    initRocks();
    initSpiders();
}


void updateGame() {
    //Make balls fall at random
 
    makeBallsFall();
	updatePlayer();
    updateSpider();
    updateRock();

    
/*     for (int i = 0; i < SPIDERCOUNT; i++)
		updateSpider(&spiders[i]); */

    if (count > 256 && screenBlock != 28) { // don't decrement tracker if at the end of map
		//change where BG0 looks for maps
		screenBlock--;
		count = 0;
		vOff += 256;
		REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_TALL; 
        	
	   
	}

    if (playerVOff < 256) {
        playerVOff -= 256;
    }

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;
     
}

void drawGame() {

    drawPlayer();
	drawRocks();
	drawSpiders();


    //REG_BG0HOFF = hOff;
    //REG_BG0VOFF = vOff;
}

void initPlayer() {
    climber.width = 16;
    climber.height = 16;
    climber.rdel = 1;
    climber.cdel = 1;
    climber.worldRow = MAPHEIGHT - climber.height;
    climber.worldCol = SCREENWIDTH / 2;
    climber.aniCounter = 0;
    climber.curFrame = 0;
    climber.numFrames = 6;
    climber.aniState = 0;


}


void updatePlayer() {

    if(BUTTON_HELD(BUTTON_UP)) {
        if (climber.worldRow > 0 && collisionsBitmap[OFFSET(climber.worldCol, climber.worldRow - climber.rdel, MAPWIDTH)] 
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow - climber.rdel, MAPWIDTH)]){
            
            climber.worldRow -= climber.rdel;
            animatePlayer();
            winCount--;

            if ((vOff > 0 && climber.screenRow < SCREENHEIGHT / 2) || climber.worldRow < 384) { // weird hack to get bg to move once you reach last screenblock - 384 is 512 - 256/2
                count++; 
		        vOff--;
                totalVOff--; 
                playerVOff--;
                
            }
            

    
        if (winCount == 100) {

            winG = 1;
        }

    }
}

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (climber.worldCol > 0 
        && collisionsBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow + climber.height - 1, MAPWIDTH)] ){

            climber.worldCol -= climber.cdel;

            if (hOff >= 0 && climber.screenCol < SCREENWIDTH / 2) {
                hOff--; 
            }


        }
        if (!(collisionLoseBitmap[OFFSET(climber.worldCol, climber.worldRow, MAPWIDTH)]
        && collisionLoseBitmap[OFFSET(climber.worldCol, climber.worldRow + climber.height - 1, MAPWIDTH)])) {
            loseG = 1;
        } 
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (climber.worldCol < MAPWIDTH - climber.width
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1 + climber.cdel, climber.worldRow, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1 + climber.cdel, climber.worldRow  + climber.height - 1, MAPWIDTH)]
        ) { 
            climber.worldCol += climber.cdel;
       
            
            if (hOff < MAPWIDTH - SCREENWIDTH &&  climber.screenCol > SCREENWIDTH / 2){
                hOff++;

            }
        }

    }


    climber.screenRow = climber.worldRow - playerVOff;
    climber.screenCol = climber.worldCol - hOff;


}

void drawPlayer() {

    if (climber.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & climber.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & climber.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(climber.aniState * 2, climber.curFrame * 2);
    }
}

void animatePlayer() {
    if(climber.aniCounter % 20 == 0) {
        climber.curFrame = (climber.curFrame + 1) % climber.numFrames;
    }
    climber.aniCounter++;

}

void initRocks() {
	for (int i = 0; i < ROCKCOUNT; i++) {
		rocks[i].worldRow = 0; 
		rocks[i].worldCol = 0;
		rocks[i].rdel = 2;
		rocks[i].cdel = 0;
		rocks[i].hide = 0;
        rocks[i].height = 8;
        rocks[i].width = 8;
        rocks[i].active = 0;
        rocks[i].aniCounter = 0;
        rocks[i].curFrame = 0;
        rocks[i].numFrames = 3;
        rocks[i].aniState = 2;
	}
}

void drawRocks() {
    //ROCK rocks = r;
    for (int i = 0; i < ROCKCOUNT; i++) {
        if((rocks[i].worldRow < -rocks[i].height) || !rocks[i].active){
           shadowOAM[2+i].attr0 |= ATTR0_HIDE; 
        }
        else {
            shadowOAM[2+i].attr0 = (ROWMASK & rocks[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[2+i].attr1 = (COLMASK & rocks[i].screenCol) | ATTR1_TINY;
            shadowOAM[2+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(rocks[i].aniState, rocks[i].curFrame);
        } 
    }
}

void updateRock() {
    for(int i = 0; i < ROCKCOUNT; i++) {
 	//Keep ball within screen
        if (rocks[i].worldCol < 1) {
		    rocks[i].worldCol = 1;
	    }
	    if (rocks[i].worldCol > MAPWIDTH - rocks[i].width) {
		    rocks[i].worldCol = MAPWIDTH - rocks[i].width;
	    }
/*     if (!(collisionsBitmap[OFFSET(rocks[i].worldCol, rocks[i].worldRow, MAPWIDTH)]
        && collisionsBitmap[OFFSET(rocks[i].worldCol, rocks[i].worldRow + rocks[i].height - 1, MAPWIDTH)])) {
            animateRocks();
    } */

	//Make the balls fall
        if(rocks[i].active) {
	 	    rocks[i].worldRow += rocks[i].rdel; // Add the rd to row to make things fall
		    if(rocks[i].worldRow > MAPHEIGHT - rocks[i].height) {  // Check if row is past bottom of the screen
			    rocks[i].active = 0;
			    rocks[i].worldRow = 100;
		    } 
		//Check for collision with player 
        if (collision(rocks[i].worldCol, rocks[i].worldRow, rocks[i].width, rocks[i].height, climber.worldCol - hOff, climber.worldRow - totalVOff, climber.width, climber.height)) {
            rocks[i].active = 0;
            //loseG = 1;
            
        }
    } 
    rocks[i].screenRow = rocks[i].worldRow - vOff;
    rocks[i].screenCol = rocks[i].worldCol - hOff;
    }
  
}

void makeBallsFall() {
	// Find the first inactive ball
	for (int i = 0; i < ROCKCOUNT; i++) {
		if (!rocks[i].active) {
            rocks[i].active = 1;
			// Position the new ball					
   			rocks[i].worldRow = 100;				
   			rocks[i].worldCol = rand() % 100 + 100 + hOff;
			// Take the ball out of the pool
			// Break out of the loop
			break;
		}
	}
}
void animateRocks() {
    for (int i = 0; i < ROCKCOUNT; i++) {
        if(rocks[i].aniCounter % 100 == 0) {
            rocks[i].curFrame = (rocks[i].curFrame + 1) % rocks[i].numFrames;
        }
        rocks[i].aniCounter++;
    }

}


void initSpiders() {
    for (int i = 0; i < SPIDERCOUNT; i++) {
        spiders[i].active = 1; 
        spiders[i].width = 8;
        spiders[i].height = 8;
        spiders[i].cdel = 1;
        spiders[i].rdel = 0;
        spiders[i].worldCol = rand() % 100 + 100 + hOff;
        spiders[i].worldRow = 80 + vOff;
        spiders[i].aniState = 0;
    }

}

void drawSpiders() {
    for (int i = 0; i < SPIDERCOUNT; i++) {
        if(!spiders[i].active && spiders[i].screenRow > 0){
           shadowOAM[120+i].attr0 = ATTR0_HIDE; 
        }
        else {
            shadowOAM[120+i].attr0 = (ROWMASK & spiders[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[120+i].attr1 = (COLMASK & spiders[i].screenCol) | ATTR1_TINY;
            shadowOAM[120+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, spiders[i].aniState);
        } 
    }
}



void updateSpider() {
    for(int i = 0; i < SPIDERCOUNT; i++) {
        if (spiders[i].active) {
            if(spiders[i].worldCol > MAPWIDTH - 2) {
                spiders[i].cdel *= -1;
                spiders[i].aniState = 0;
            }
            if(spiders[i].worldCol < 100) {
                spiders[i].cdel *= -1;
                spiders[i].aniState = 1;
            }
            spiders[i].worldCol += spiders[i].cdel;

            if (collision(spiders[i].screenCol, spiders[i].screenRow, spiders[i].width, spiders[i].height, climber.worldCol - hOff, climber.worldRow - totalVOff, climber.width, climber.height)) {
                spiders[i].active = 0;
                loseG = 1;
            }
        }


        spiders[i].screenRow = spiders[i].worldRow - vOff;
        spiders[i].screenCol = spiders[i].worldCol - hOff;
    }   

}


 


