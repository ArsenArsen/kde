# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.4
inherit ecm kde.org

DESCRIPTION="Digital camera raw image library wrapper"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=media-libs/libraw-0.16:=
"
RDEPEND="${DEPEND}"
