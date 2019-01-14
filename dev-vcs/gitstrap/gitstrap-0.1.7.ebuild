# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

REPO="github.com/g4s8/${PN}"
DESCRIPTION="Command line tool to bootstrap Github repository"
HOMEPAGE="https://github.com/g4s8/gitstrap"
SRC_URI="https://${REPO}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="dev-vcs/git"

_go_get() {
	local name=$1
	elog "installing dependency: $name"
	go get -v -u $name || die "'go get' failed to get $name"
}

src_prepare() {
	default
	elog "creating directory structure"
	mkdir -pv $HOME/go/src/github.com/g4s8 || die
	ln -snv $PWD $HOME/go/src/github.com/g4s8/gitstrap || die
	elog "installing go dependencies"
	_go_get github.com/google/go-github/github
	_go_get golang.org/x/oauth2
	_go_get gopkg.in/yaml.v2
}

src_compile() {
	go build -v -o ${PN} ./cmd/gitstrap || die "Build failed"
}

src_test() {
	go test . || die
	elog "tests passed"
}

src_install() {
	dobin ${PN} || die "'${PN} installation failed"
}

