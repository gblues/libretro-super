#! /usr/bin/env bash
# vim: set ts=3 sw=3 noet ft=sh : bash

SCRIPT="${0#./}"
BASE_DIR="${SCRIPT%/*}"
WORKDIR="$PWD"

if [ "$BASE_DIR" = "$SCRIPT" ]; then
	BASE_DIR="$WORKDIR"
else
	if [[ "$0" != /* ]]; then
		# Make the path absolute
		BASE_DIR="$WORKDIR/$BASE_DIR"
	fi
fi

RARCH_DIR=$BASE_DIR/dist
RARCH_DIST_DIR=$RARCH_DIR/ngc
FORMAT=_ngc
FORMAT_COMPILER_TARGET=ngc
FORMAT_COMPILER_TARGET_ALT=ngc
FORMAT_EXT=a
JOBS=7
MAKE=make

. "$BASE_DIR/libretro-build-common-gx.sh"
. "$BASE_DIR/libretro-build-common.sh"

if [ $1 ]; then
	$1
else
	build_libretro_bluemsx
	build_libretro_fmsx
	build_libretro_beetle_lynx
	build_libretro_beetle_gba
	build_libretro_beetle_ngp
	build_libretro_beetle_pce_fast
	build_libretro_beetle_supergrafx
	build_libretro_beetle_pcfx
	build_libretro_beetle_vb
	build_libretro_beetle_wswan
	build_libretro_beetle_bsnes
	build_libretro_snes9x_next
	build_libretro_genesis_plus_gx
	build_libretro_fba
	build_libretro_vba_next
	build_libretro_fceumm
	build_libretro_gambatte
	build_libretro_nx
	build_libretro_prboom
	build_libretro_quicknes
	build_libretro_nestopia
	build_libretro_tyrquake
	#build_libretro_yabause
fi
