
//{{BLOCK(gameBGXL)

//======================================================================
//
//	gameBGXL, 256x1024@4, 
//	+ palette 256 entries, not compressed
//	+ 890 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x128 
//	Total size: 512 + 28480 + 8192 = 37184
//
//	Time-stamp: 2020-04-10, 16:22:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBGXL_H
#define GRIT_GAMEBGXL_H

#define gameBGXLTilesLen 28480
extern const unsigned short gameBGXLTiles[14240];

#define gameBGXLMapLen 8192
extern const unsigned short gameBGXLMap[4096];

#define gameBGXLPalLen 512
extern const unsigned short gameBGXLPal[256];

#endif // GRIT_GAMEBGXL_H

//}}BLOCK(gameBGXL)
