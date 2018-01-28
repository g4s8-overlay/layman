# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Local CDN HTTP proxy"
HOMEPAGE="https://github.com/g4s8/local-cdn"
SRC_URI="https://github.com/g4s8/local-cdn/archive/0.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	go get github.com/elazarl/goproxy
	go get github.com/bclicn/color
	go build .
}

src_install() {
	cp -v local-cdn-0.1 ${D}/local-cdn
}

