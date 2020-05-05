
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 187 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 5984 + 4096 = 10592
//
//	Time-stamp: 2020-04-11, 09:28:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 5984
extern const unsigned short gameBGTiles[2992];

#define gameBGMapLen 4096
extern const unsigned short gameBGMap[2048];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
