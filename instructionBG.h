
//{{BLOCK(instructionBG)

//======================================================================
//
//	instructionBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 302 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9664 + 2048 = 12224
//
//	Time-stamp: 2020-04-15, 12:18:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONBG_H
#define GRIT_INSTRUCTIONBG_H

#define instructionBGTilesLen 9664
extern const unsigned short instructionBGTiles[4832];

#define instructionBGMapLen 2048
extern const unsigned short instructionBGMap[1024];

#define instructionBGPalLen 512
extern const unsigned short instructionBGPal[256];

#endif // GRIT_INSTRUCTIONBG_H

//}}BLOCK(instructionBG)
