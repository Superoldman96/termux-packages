TERMUX_PKG_HOMEPAGE=https://wiki.debian.org/Debootstrap
TERMUX_PKG_DESCRIPTION="Bootstrap a basic Debian system"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="debian/copyright"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.0.141"
TERMUX_PKG_SRCURL=https://deb.debian.org/debian/pool/main/d/debootstrap/debootstrap_${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=232ec755f4b1f445f829996885846abba6f1b6fd55d049476ab26ddd8c4b4e1b
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="binutils | binutils-is-llvm, perl, proot, sed, wget"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make() {
	:
}

termux_step_make_install() {
	find ${TERMUX_PKG_SRCDIR}/.. -name "*.orig" -delete

	local VERSION=$(sed 's/.*(\(.*\)).*/\1/; q' debian/changelog)
	mkdir -p ${TERMUX_PREFIX}/share/debootstrap/scripts
	cp -a scripts/* ${TERMUX_PREFIX}/share/debootstrap/scripts/
	install -m 0644 functions ${TERMUX_PREFIX}/share/debootstrap/
	sed "s/@VERSION@/${VERSION}/g" debootstrap > ${TERMUX_PREFIX}/bin/debootstrap
	chmod 0755 ${TERMUX_PREFIX}/bin/debootstrap

	mkdir -p ${TERMUX_PREFIX}/share/man/man8/
	install ${TERMUX_PKG_SRCDIR}/debootstrap.8 ${TERMUX_PREFIX}/share/man/man8/
}
