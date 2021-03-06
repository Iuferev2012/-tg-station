/*
The /tg/ codebase currently requires you to have 9 z-levels of the same size dimensions.
z-level order is important, the order you put them in inside this file will determine what z level number they are assigned ingame.
Names of z-level do not matter, but order does greatly, for instances such as checking alive status of revheads on z1

current as of 2016/3/27
z1 = station
z2 = centcomm
z3 = derelict telecomms satellite
z4 = derelict station
z5 = mining
z6 = empty space
z7 = empty space
z8 = empty space
z9 = empty space
*/

#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

        #include "map_files\TgStation\tgstation.2.1.3.dmm"
        #include "map_files\generic\z2.dmm"
        #include "map_files\generic\z3.dmm"
        #include "map_files\generic\z4.dmm"
        #include "map_files\generic\lavaland.dmm"
        #include "map_files\generic\z6.dmm"
        #include "map_files\generic\z7.dmm"
        #include "map_files\generic\z8.dmm"
		#include "map_files\generic\z9.dmm"
		#include "map_files\TerrorStation\z9.dmm" //prison

		#define MAP_PATH "map_files/TgStation"
        #define MAP_FILE "tgstation.2.1.3.dmm"
        #define MAP_NAME "Box (TG Station 2)"

        #define MAP_TRANSITION_CONFIG	list(MAIN_STATION = CROSSLINKED, CENTCOMM = SELFLOOPING, ABANDONED_SATELLITE = CROSSLINKED, DERELICT = CROSSLINKED, MINING = SELFLOOPING, EMPTY_AREA_1 = CROSSLINKED, EMPTY_AREA_2 = CROSSLINKED, EMPTY_AREA_3 = CROSSLINKED, EMPTY_AREA_4 = CROSSLINKED, BANPRISON = SELFLOOPING)

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring /tg/station 2.

#endif