# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit pam

DESCRIPTION="Allows PAM-aware unix systems to authenticate against web servers"
HOMEPAGE="https://fedorahosted.org/pam_url"

SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.bz2"

DEPEND="virtual/pam
		net-misc/curl
		dev-libs/libconfig"
RDEPEND="${DEPEND}"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"

IUSE=""

src_compile() {
	append-flags "-std=gnu99"
	emake
}

src_install() {
	dopammod pam_url.so

	insinto /etc
	doins examples/pam_url.conf

	dodoc README
}
