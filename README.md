# bonsai
Minimal Linux from Scratch package manager and repository. (WIP not really ready for use)

This project is born while I was building my first LFS-7.7-systemd system. Some of the packages are probably broken or incomplete they will be fixed you may still find it useful!
The program currently works after the first chroot.
I'm planning to enable the build of /tools. I have some scripts for that but I still have to integrate in the pkg manager.

### Features:

bonsai -I pkgname -> install          [DONE]
bonsai -R pkgname -> remove           [TODO]
bonsai -Q pattern -> search           [TODO]
bonsai -L         -> list installed.  [TODO]
bonsai -U         -> update system    [TODO]
bonsai -S         -> sync files.      [TODO]

--pretend / -p                        [DONE]
--quiet / -q no compiling output      [TODO]
--version / -v show version           [DONE]
--help / -h  show help                [DONE]
--noclean / -n do not run clean       [DONE]
--check / -c run checks after build.  [DONE]


### Example:

root:/# bonsai -I gzip
Bonsai-0.0.3
Installing: gzip --

setup gzip-1.6...

unpacking src...
mkdir: created directory '/var/tmp/gzip-src'
configure phase
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
