# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Local CDN HTTP proxy"
HOMEPAGE="https://github.com/g4s8/local-cdn"
SRC_URI="https://github.com/g4s8/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_compile() {
	go get github.com/elazarl/goproxy || die "failed get dependency 'elazarl/goproxy' (github.com/elazarl/goproxy)"
	go get github.com/bclicn/color || die "failed to get dependency 'bclicn/color' (github.com/bclicn/color)"
	go build -o ${PN} || die "Build failed"
}

src_install() {
	dobin ${PN} || die "'${PN} installation failed"
}

