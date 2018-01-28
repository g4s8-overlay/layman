# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Power watch dog"
HOMEPAGE="https://github.com/g4s8-overlay/powerdog"
SRC_URI="https://github.com/g4s8-overlay/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_compile() {
	go build -o ${PN} || die "Build failed"
}

src_install() {
	dobin ${PN} || die "'${PN} installation failed"
	newinitd scripts/init ${PN}
}

