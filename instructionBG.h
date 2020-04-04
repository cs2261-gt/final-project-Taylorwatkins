
//{{BLOCK(instructionBG)

//======================================================================
//
//	instructionBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 256 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8192 + 2048 = 10752
//
//	Time-stamp: 2020-04-01, 13:23:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONBG_H
#define GRIT_INSTRUCTIONBG_H

#define instructionBGTilesLen 8192
extern const unsigned short instructionBGTiles[4096];

#define instructionBGMapLen 2048
extern const unsigned short instructionBGMap[1024];

#define instructionBGPalLen 512
extern const unsigned short instructionBGPal[256];

#endif // GRIT_INSTRUCTIONBG_H

//}}BLOCK(instructionBG)
