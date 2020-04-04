#include "myLib.h"
#include "game.h"
// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE climber;
ANISPRITE rocks;
int winG;

void initGame() {

	// Place screen on map
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hOff = 0;
    winG = 0;

    initPlayer();
}


void updateGame() {

	updatePlayer();
}

void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

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
        if (climber.worldRow > 0 ){
        //&& collisionmapBitmap[OFFSET(climber.worldCol, climber.worldRow - climber.rdel, MAPWIDTH)] 
        //&& collisionmapBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow - climber.rdel, MAPWIDTH)]) {
            climber.worldRow -= climber.rdel; 
  
        /*Delete that 1, then:
            for TODO 1.0, make sure climber doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/

            // Update climber's world position if the above is true



            if (vOff >= 0 && climber.screenRow < SCREENHEIGHT / 2) {
                vOff--;
            } /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if climber is in the right spot*/
                // Update background offset variable if the above is true
            
        }
        if (climber.worldRow == 0) {
            winG = 1;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (climber.worldRow < MAPHEIGHT - climber.height){
        //&& collisionmapBitmap[OFFSET(climber.worldCol, climber.worldRow + climber.height - 1 - climber.rdel, MAPWIDTH)]
        //&& collisionmapBitmap[OFFSET(climber.worldCol + climber.width - 1, climber.worldRow  + climber.height - 1 - climber.rdel, MAPWIDTH)]){
            climber.worldRow += climber.rdel;
       
            /*Delete that 1, then:
            for TODO 1.0, make sure climber doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/

            // Update climber's world position if the above is true



            if (vOff < MAPHEIGHT - SCREENHEIGHT &&  climber.screenRow > SCREENHEIGHT / 2){
                vOff++;
                /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if climber is in the right spot*/
                // Update background offset variable if the above is true
            }
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (climber.worldCol > 0 ){
        //&& collisionmapBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow, MAPHEIGHT)]
        //&& collisionmapBitmap[OFFSET(climber.worldCol - climber.cdel, climber.worldRow + climber.height - 1, MAPHEIGHT)]) {
            climber.worldCol -= climber.cdel;
    
             /*Delete that 1, then:
            for TODO 1.0, make sure climber doesn't go off the map here,
            for TODO 2.2, check collision map here as well*/

            // Update climber's world position if the above is true



            if (hOff >= 0 && climber.screenCol < SCREENWIDTH / 2) {
                hOff--; 
                /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if climber is in the right spot*/
                // Update background offset variable if the above is true
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (climber.worldCol < MAPWIDTH - climber.width) { 
        //&& collisionmapBitmap[OFFSET(climber.worldCol + climber.width - 1 - climber.cdel, climber.worldRow, MAPHEIGHT)]
        //&& collisionmapBitmap[OFFSET(climber.worldCol + climber.width - 1 - climber.cdel, climber.worldRow  + climber.height - 1, MAPHEIGHT)]){
            climber.worldCol += climber.cdel;
       
            




            if (hOff < MAPWIDTH - SCREENWIDTH &&  climber.screenCol > SCREENWIDTH / 2){
                hOff++;
                 /*Delete that 1, then:
                for TODO 1.0, make sure the background offset doesn't show past the edge,
                and only update the offset variables if climber is in the right spot*/
                // Update background offset variable if the above is true
            }
        }
    }

    // TODO 1.0: Update screen row and screen col

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

