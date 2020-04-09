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

void initGame() {

	// Place screen on map
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hOff = 0;
    winG = 0;
    loseG = 0;

    initPlayer();
    initRocks();
    initSpiders();
}


void updateGame() {
    //Make balls fall at random
 
    //makeSpiders();
    makeBallsFall();
	updatePlayer();
    
    for (int i = 0; i < ROCKCOUNT; i++)
		updateRock(&rocks[i]);
    
    for (int i = 0; i < SPIDERCOUNT; i++)
		updateSpider(&spiders[i]);


     
}

void drawGame() {

    drawPlayer();
    for (int i = 0; i < ROCKCOUNT; i++)
		drawRocks(&rocks[i]);
    
    // for (int i = 0; i < SPIDERCOUNT; i++)
		drawSpiders();


    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void initPlayer() {
    climber.width = 16;
    climber.height = 16;
    climber.rdel = 1;
    climber.cdel = 1;
    climber.worldRow = vOff + SCREENHEIGHT - climber.height;
    climber.worldCol = hOff;
}


void updatePlayer() {

    if(BUTTON_HELD(BUTTON_UP)) {
        if (climber.worldRow > 0 
        && collisionsBitmap[OFFSET(climber.worldCol, climber.worldRow - climber.rdel, MAPWIDTH)] 
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow - climber.rdel, MAPWIDTH)]){
            climber.worldRow -= climber.rdel; 
  

            if (vOff >= 0 && climber.screenRow < SCREENHEIGHT / 2) {
                vOff--;
            } 
            
        }
        if (climber.worldRow == 0) {
            winG = 1;
        }

    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (climber.worldRow < MAPHEIGHT - climber.height
        && collisionsBitmap[OFFSET(climber.worldCol, climber.worldRow + climber.height - 1 + climber.rdel, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow  + climber.height - 1 + climber.rdel, MAPWIDTH)]){
            climber.worldRow += climber.rdel;

            if (vOff < MAPHEIGHT - SCREENHEIGHT &&  climber.screenRow > SCREENHEIGHT / 2){
                vOff++;
            }
        }

    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (climber.worldCol > 0 
        && collisionsBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow, MAPWIDTH)]
        && collisionsBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow + climber.height - 1, MAPWIDTH)]){

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
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1 + climber.cdel, climber.worldRow  + climber.height - 1, MAPWIDTH)]) { 
            climber.worldCol += climber.cdel;
       
            
            if (hOff < MAPWIDTH - SCREENWIDTH &&  climber.screenCol > SCREENWIDTH / 2){
                hOff++;

            }
        }

    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        if (climber.worldRow > 0 
        && collisionsBitmap[OFFSET(climber.worldCol, climber.worldRow - climber.rdel, MAPWIDTH)] 
        && collisionsBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow - climber.rdel, MAPWIDTH)]){
            climber.worldRow -= climber.rdel * 10; 


            if (vOff >= 0 && climber.screenRow < SCREENHEIGHT / 2) {
                vOff-- * 10;
            }
        }

    }

    climber.screenRow = climber.worldRow - vOff;
    climber.screenCol = climber.worldCol - hOff;

 


    //animatePlayer();
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
	}
}

void drawRocks(ROCK* r) {
    for (int i = 0; i < ROCKCOUNT; i++) {
        if((r[i].screenRow < -r[i].height) || !r[i].active){
           shadowOAM[1+i].attr0 |= ATTR0_HIDE; 
        }
        else {
            shadowOAM[1+i].attr0 = (ROWMASK & r[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[1+i].attr1 = (COLMASK & r[i].screenCol) | ATTR1_TINY;
            shadowOAM[1+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 1);
        } 
    }
}

void updateRock(ROCK* r) {
 	//Keep ball within screen
    if (r->worldCol < 1) {
		r->worldCol = 1;
	}
	if (r->worldCol > MAPWIDTH - r->width) {
		r->worldCol = MAPWIDTH - r->width;
	}

	//Make the balls fall
    if(r->active) {
	 	r->worldRow += r->rdel; // Add the rd to row to make things fall
		if( r->worldRow > MAPHEIGHT - r->height) {  // Check if row is past bottom of the screen
			r->active = 0;
			r->worldRow = -(r->height);
		} 
		//Check for collision with player 
        if (collision(r->worldCol, r->worldRow, r->width, r->height, climber.worldCol, climber.worldRow, climber.width, climber.height)) {
            r->active = 0;
            //r->worldRow = -(r->height);
            loseG = 1;
        }
    } 
    r->screenRow = r->worldRow - vOff;
    r->screenCol = r->worldCol - hOff;
    

    
}

void makeBallsFall() {
	// Find the first inactive ball
	for (int i = 0; i < ROCKCOUNT; i++) {
		if (!rocks[i].active) {
            rocks[i].active = 1;
			// Position the new ball					
   			rocks[i].worldRow = -(rocks[i].height);				
   			rocks[i].worldCol = rand()%(240);
			// Take the ball out of the pool
			// Break out of the loop
			break;
		}
	}
}







void initSpiders() {
    for (int i = 0; i < SPIDERCOUNT; i++) {
        spiders[i].active = 1; 
        spiders[i].width = 8;
        spiders[i].height = 8;
        spiders[i].cdel = 1;
        spiders[i].rdel = 0;
        // spiders[i].worldCol = 0;

        spiders[i].worldCol = 100;
        spiders[i].worldRow = rand()%100 + vOff;
    }
}

void drawSpiders() {
    for (int i = 0; i < SPIDERCOUNT; i++) {
        if(!spiders[i].active){
           shadowOAM[7+i].attr0 = ATTR0_HIDE; 
        }
        else {
            shadowOAM[7+i].attr0 = (ROWMASK & spiders[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[7+i].attr1 = (COLMASK & spiders[i].screenCol) | ATTR1_TINY;
            shadowOAM[7+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 1);
        } 
    }
}

void updateSpider(SPIDER* s) {
    // if(!s->active){
    //     s->active = 1;
    //     s->worldRow = rand(400);
    //     s->worldCol = 100;

    // }

    if(s->active){

        // //if the spider leaves the bottom of the screen, make it inactive
        if(s->screenRow>SCREENHEIGHT){
            s->active=0;
        }
        if(s->worldCol > MAPWIDTH - 2) {
            s->cdel *= -1;
        }
        if(s->worldCol < 100) {
            s->cdel *= -1;
        }  
        s->worldCol += s->cdel;
        // if (collision(s->worldCol, s->worldRow, s->width, s->height, climber.worldCol, climber.worldRow, climber.width, climber.height)) {
        //     s->active = 0;
        //     loseG = 1;
        // }
        if (collision(s->screenCol, s->screenRow, s->width, s->height, climber.screenCol, climber.screenRow, climber.width, climber.height)) {
            s->active = 0;
            loseG = 1;
        }


    }

    s->screenRow = s->worldRow - vOff;
    s->screenCol = s->worldCol - hOff;

    //  if (collision(s->worldCol, s->worldRow, s->width, s->height, climber.worldCol, climber.worldRow, climber.width, climber.height)) {
    //         s->active = 0;
    //         loseG = 1;
    //     }
    // if (collision(s->screenCol, s->screenRow, s->width, s->height, climber.screenCol, climber.screenRow, climber.width, climber.height)) {
    //         s->active = 0;
    //         loseG = 1;
    //     }

}


 


