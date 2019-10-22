# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
EGO_PN="github.com/g4s8/${PN}"
EGO_VENDOR=(
	"github.com/caarlos0/spin v1.1.0"
	"gopkg.in/yaml.v2 5420a8b6744d3b0345ab293f6fcba19c978f1183 github.com/go-yaml/yaml"
)
inherit golang-build golang-vcs-snapshot

DESCRIPTION="Zold WTS API cross-platform CLI tool"
HOMEPAGE="https://github.com/g4s8/${PN}"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz
	${EGO_VENDOR_URI}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="dev-lang/go"

src_compile() {
	pushd "src/${EGO_PN}" || die
	BUILDFLAGS="" GOPATH="${S}" \
		go build -v -x -o "${PN}" ./cmd/wts || die
	popd || die
}

src_install() {
	dobin src/${EGO_PN}/${PN}
}
