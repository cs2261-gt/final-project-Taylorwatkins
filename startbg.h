
//{{BLOCK(startBG)

//======================================================================
//
//	startBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 131 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4192 + 2048 = 6752
//
//	Time-stamp: 2020-04-01, 12:35:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTBG_H
#define GRIT_STARTBG_H

#define startBGTilesLen 4192
extern const unsigned short startBGTiles[2096];

#define startBGMapLen 2048
extern const unsigned short startBGMap[1024];

#define startBGPalLen 512
extern const unsigned short startBGPal[256];

#endif // GRIT_STARTBG_H

//}}BLOCK(startBG)
