# g4s8-overlay
It's my Gentoo Portage Overlay

## Installation
Add to layman:
```shell
layman -o https://raw.githubusercontent.com/g4s8-overlay/layman/master/repositories.xml -f -a g4s8
```

or use `eselect` (make sure `app-eselect/eselect-repository` installed):
```shell
eselect repository add g4s8 git https://github.com/g4s8-overlay/layman.git
emerge --sync g4s8
```
