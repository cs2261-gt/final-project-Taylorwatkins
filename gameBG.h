
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 566 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 18112 + 4096 = 22720
//
//	Time-stamp: 2020-04-03, 19:51:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 18112
extern const unsigned short gameBGTiles[9056];

#define gameBGMapLen 4096
extern const unsigned short gameBGMap[2048];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
