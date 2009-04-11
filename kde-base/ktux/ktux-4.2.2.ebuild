# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdetoys"
inherit kde4-meta

DESCRIPTION="KDE: screensaver featuring the Space-Faring Tux"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE="debug"

# libkworkspace - only as a stub to provide KDE4Workspace config
DEPEND="
	>=kde-base/kscreensaver-${PV}:${SLOT}[kdeprefix=]
	>=kde-base/libkworkspace-${PV}:${SLOT}[kdeprefix=]
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e's/${KDE4WORKSPACE_KSCREENSAVER_LIBRARY}/kscreensaver/' \
		"${PN}"/CMakeLists.txt || die "Failed to patch CMakeLists.txt"

	kde4-meta_src_prepare
}
