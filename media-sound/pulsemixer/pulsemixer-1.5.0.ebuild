# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )
inherit distutils-r1

DESCRIPTION="CLI and curses mixer for PulseAudio"
HOMEPAGE="https://github.com/GeorgeFilipkin/pulsemixer"
SRC_URI="https://github.com/GeorgeFilipkin/pulsemixer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${RDEPEND}"
DEPEND="${RDEPEND} dev-python/setuptools[${PYTHON_USEDEP}]"

src_install() {
	distutils-r1_src_install
	dobin pulsemixer
}
