# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
EGO_PN="github.com/go-delve/delve"

if [[ ${PV} == *9999 ]]; then
	inherit golang-vcs
else
	DELVE_SHA="a3e884e"
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	inherit golang-vcs-snapshot
fi

DESCRIPTION="A source-level debugger for the Go programming language"
HOMEPAGE="https://github.com/go-delve/delve"

LICENSE="MIT"
SLOT="0"

RESTRICT="test"

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${S}" go build -v -ldflags="-X main.Build=${DELVE_SHA}" -o "${S}/dlv" ./cmd/dlv || die
	cp -v README.md CHANGELOG.md -t "${S}" || die
	popd || die
}

src_install() {
	dodoc README.md CHANGELOG.md
	dobin dlv
}
