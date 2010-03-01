# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KDE_LINGUAS="pt_BR"
NEED_PYTHON="2.6"

inherit kde4-base python

DESCRIPTION="Graphical application for Portage's daily tasks"
HOMEPAGE="https://sourceforge.net/projects/kportagetray/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64"
SLOT="4"
IUSE=""

DEPEND="
	dev-python/PyQt4[svg,dbus]
	>=kde-base/pykde4-${KDE_MINIMAL}
"
RDEPEND="${DEPEND}
	app-portage/eix
	app-portage/genlop
	>=kde-base/kdesu-${KDE_MINIMAL}
	>=kde-base/knotify-${KDE_MINIMAL}
	>=kde-base/konsole-${KDE_MINIMAL}
"

pkg_postinst() {
	kde4-base_pkg_postinst
}
