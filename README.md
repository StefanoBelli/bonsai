# bonsai
Minimal Linux from Scratch package manager and repository. (WIP not really ready for use)

This project is born while I was building my first LFS-7.7-systemd system. Some of the packages are probably broken or incomplete they will be fixed you may still find it useful!
The program currently works after the first chroot.
I'm planning to enable the build of /tools. I have some scripts for that but I still have to integrate in the pkg manager.

### How to install/uninstall bonsai:
~~~
root@machine:~/Devel/Shellscript/bonsai # make -s
~~~

Uninstall...
~~~
root@machine:~/Devel/Shellscript/bonsai # make uninstall -s
~~~

Uninstall keeping directory (/usr/bonsai)
~~~
root@machine:~/Devel/Shellscript/bonsai # make uninstall_keep_dir -s 
~~~

The '*-s*' make option doesn't show instruction (already echoing)

### Features [0.0.4]:

Bonsai has a bit working options:
  
	- Install(-I/--install: get source,extract,configure,compile,(check),(extras),clean)
	- Query(-Q/--query: search for availible pkgs)
	- Description(-D/--desc: search for a package and shows details)

Other arguments:
  
	- Pretend (--pretend)
	- Version (--version: shows bonsai version)
	- Help (--help: shows bonsai help [more detailed])
	- Nocheck (--nocheck: skips compiled-packages checks)
	- Packages (--packages: shows availible packages) 

Features listed above are *Working*

Features that are going to be implemented:
	
	- Remove (-R/--remove: removes installed packages)
	- Installed (-L: lists installed packages)
	- Update system (-U: updates your system)
	- Sync pkgtree (-S: sync package tree)

Features listed above are *WIP*

### Example:
~~~
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
~~~

### Added packages:

 - DWM (06/09/2015) [DD/MM/YYYY]

### How to add a package file:
~~~
DESCRIPTION="" 
HOMEPAGE=""
LICENSE=""
VERSION=""
SRC_URL="" #this contain direct link to package
REPO=""
HASH=""

configure()
{
	# Configure source instructions here, if package does not need or whatever reason leave ':'
}

build()
{
	# Compile build instructions here
}

check()
{
	# Checks instructions, if package does not need or whatever reason leave ':'
}

merge()
{
	# Merging to system instructions
}
~~~
