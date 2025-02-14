# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="true"
KFMIN=9999
QTMIN=6.8.1
inherit ecm fcaps flag-o-matic plasma.kde.org toolchain-funcs

DESCRIPTION="Task management and system monitoring library"

LICENSE="LGPL-2+"
SLOT="6/9"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/libnl:3
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kauth-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6[qml]
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/knewstuff-${KFMIN}:6
	>=kde-frameworks/kpackage-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/solid-${KFMIN}:6
	net-libs/libpcap
	sys-apps/lm-sensors:=
	sys-libs/zlib
"
RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6[qml]
"

# -m 0755 to avoid suid with USE="-filecaps"
FILECAPS=( -m 0755 cap_sys_nice=ep usr/libexec/ksysguard/ksgrd_network_helper )

src_configure() {
	# support std::jthread and std::stop_token is not enabled per default
	# in libc++ prior to version 20, need to add "-fexperimental-library"
	if tc-is-clang && [[ $(tc-get-cxx-stdlib) == libc++ ]] && [[ "$(clang-major-version)" -lt 20 ]]; then
		append-cxxflags "-fexperimental-library"
	fi

	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_Libcap=ON
	)
	ecm_src_configure
}

src_test() {
	# bugs 797898, 889942: flaky test
	local myctestargs=(
		-E "(sensortreemodeltest)"
	)
	LC_NUMERIC="C" ecm_src_test # bug 695514
}
