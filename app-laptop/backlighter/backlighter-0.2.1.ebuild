# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )
inherit distutils-r1

DESCRIPTION="Backlight brightness control daemon and client"
HOMEPAGE="https://github.com/g4s8/"
SRC_URI="https://github.com/g4s8-overlay/backlighter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="test"


RDEPEND="${RDEPEND}"
DEPEND="${RDEPEND} dev-python/setuptools[${PYTHON_USEDEP}]"

pkg_setup() {
	enewgroup backlighter
}

src_install() {
	distutils-r1_src_install
	dobin bin/backlighter
	newinitd backlighter.initd backlighter
}
