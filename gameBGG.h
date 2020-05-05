
//{{BLOCK(gameBGG)

//======================================================================
//
//	gameBGG, 256x1024@4, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x128 
//	Total size: 512 + 32 + 8192 = 8736
//
//	Time-stamp: 2020-04-10, 13:38:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBGG_H
#define GRIT_GAMEBGG_H

#define gameBGGTilesLen 32
extern const unsigned short gameBGGTiles[16];

#define gameBGGMapLen 8192
extern const unsigned short gameBGGMap[4096];

#define gameBGGPalLen 512
extern const unsigned short gameBGGPal[256];

#endif // GRIT_GAMEBGG_H

//}}BLOCK(gameBGG)
