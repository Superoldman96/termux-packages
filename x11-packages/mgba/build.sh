TERMUX_PKG_HOMEPAGE=https://mgba.io/
TERMUX_PKG_DESCRIPTION="An emulator for running Game Boy Advance games"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.10.5"
TERMUX_PKG_SRCURL=https://github.com/mgba-emu/mgba/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=91d6fbd32abcbdf030d58d3f562de25ebbc9d56040d513ff8e5c19bee9dacf14
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="ffmpeg, libedit, libelf, liblua54, libpng, libsqlite, libzip, opengl, sdl2 | sdl2-compat, zlib"
TERMUX_PKG_ANTI_BUILD_DEPENDS="sdl2-compat"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DBUILD_GLES2=OFF
-DBUILD_GLES3=OFF
-DBUILD_QT=OFF
-DLUA_MATH_LIBRARY=m
-DUSE_EPOXY=OFF
-DUSE_LUA=5.4
-DUSE_MINIZIP=OFF
"

termux_step_pre_configure() {
	CPPFLAGS+=" -DHAVE_STRTOF_L"
}
