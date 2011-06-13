# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="doctaweeks's audit script"
HOMEPAGE="http://danweeks.net"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://danweeks.net/dwAudit.git"
	SRC_URI=""
	inherit git
else
	SRC_URI="http://danweeks.net/pub/${PN}/${P}.tar.bz2"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/pyopenssl
	dev-python/pytz"
RDEPEND="${DEPEND}"

src_prepare() {
	distutils_src_prepare
}

src_install() {
	distutils_src_install --install-scripts="/usr/sbin"
}
