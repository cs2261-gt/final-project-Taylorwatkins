
//{{BLOCK(backClouds)

//======================================================================
//
//	backClouds, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 224 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 7168 + 4096 = 11776
//
//	Time-stamp: 2020-04-20, 12:57:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKCLOUDS_H
#define GRIT_BACKCLOUDS_H

#define backCloudsTilesLen 7168
extern const unsigned short backCloudsTiles[3584];

#define backCloudsMapLen 4096
extern const unsigned short backCloudsMap[2048];

#define backCloudsPalLen 512
extern const unsigned short backCloudsPal[256];

#endif // GRIT_BACKCLOUDS_H

//}}BLOCK(backClouds)
