# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdesdk"
inherit kde4-meta

DESCRIPTION="KAppTemplate - A shell script to create the necessary framework to develop KDE applications."
KEYWORDS="~alpha ~amd64 ~ia64 ~x86"
IUSE="debug doc"

# Fails, checked revision 810882.
RESTRICT="test"
