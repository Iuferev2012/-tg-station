/*
Birdstation by Tokiko1

A small map intended for lowpop(40 players and less).

*/


#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "mining"

        #include "map_files\BirdStation\BirdStation.dmm"
		#include "map_files\generic\z2.dmm"
		#include "map_files\generic\z3.dmm"
		#include "map_files\generic\z4.dmm"
		#include "map_files\BirdStation\z5.dmm"
		#include "map_files\generic\z6.dmm"
		#include "map_files\generic\z7.dmm"
		#include "map_files\generic\z8.dmm"
		#include "map_files\generic\z9.dmm"
		#include "map_files\TerrorStation\z9.dmm" //prison

		#define MAP_PATH "map_files/BirdStation"
        #define MAP_FILE "BirdStation.dmm"
        #define MAP_NAME "Birdboat Station"

		#define MAP_TRANSITION_CONFIG	list(MAIN_STATION = CROSSLINKED, CENTCOMM = SELFLOOPING, ABANDONED_SATELLITE = CROSSLINKED, DERELICT = CROSSLINKED, MINING = CROSSLINKED, EMPTY_AREA_1 = CROSSLINKED, EMPTY_AREA_2 = CROSSLINKED, EMPTY_AREA_3 = CROSSLINKED, EMPTY_AREA_4 = CROSSLINKED, BANPRISON = SELFLOOPING)

		#if !defined(MAP_OVERRIDE_FILES)
				#define MAP_OVERRIDE_FILES
				#include "map_files\BirdStation\telecomms.dm"
				#include "map_files\BirdStation\job\job_changes.dm"
		        #include "map_files\BirdStation\job\removed_jobs.dm"
		#endif

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring birdstation.

#endif
