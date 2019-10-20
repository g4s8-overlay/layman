# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module bash-completion-r1

EGO_PN="github.com/g4s8/hugo"
GIT_COMMIT="e5194ddedf51ecb3a0c63cf5f5aa82a3be21c8cf"
KEYWORDS="~amd64"

DESCRIPTION="The world's fastest framework for building websites"
HOMEPAGE="https://gohugo.io https://github.com/gohugoio/hugo"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="+sass"

RESTRICT="test"

src_compile() {
	mkdir -pv bin || die
	go build -ldflags \
		"-X ${EGO_PN}/hugolib.CommitHash=${GIT_COMMIT}" \
		$(usex sass "-tags extended" "") -o "${S}/bin/hugo" || die
	bin/hugo gen man || die
	bin/hugo gen autocomplete --completionfile hugo || die
}

src_install() {
	dobin bin/*
	dobashcomp hugo || die
	doman man/*
	dodoc README.md
}
