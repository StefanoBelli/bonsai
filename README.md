# bonsai
Minimal Linux from Scratch package manager and repository. (WIP not really ready for use)

This project is born while I was building my first LFS-7.7-systemd system. Some of the packages are probably broken or incomplete they will be fixed you may still find it useful!
The program currently works after the first chroot.
I'm planning to enable the build of /tools. I have some scripts for that but I still have to integrate in the pkg manager.

### LATEST NEWS!
 
 - Package tree repository has created! { github.com/viralex/bonsai-pkgtree} , to keep updated run "bonsai -S" as root :D
 - Configuration file of bonsai is now */etc/bonsai/bonsai.conf*
 - All optional args were done (yeee)
 - We need to implement pkgs remove + fix bugs/correct something before get 0.1 :)

### WARNING:
These release are *NOT* for daily use!
This is development stage! 
We will get a full-working release when 0.1 is reached!
And... another thing... 
*IF YOU TRY TO INSTALL PACKAGES AFTER BONSAI INSTALL, YOU WILL FAIL! SO, BEFORE YOU START USING BONSAI, 
SYNC REPOSITORIES! WITH THIS COMMAND:*
~~~
root:/ # bonsai -S
~~~
We will fix packages only after the package manager reaches daily-usage release! (High priority: 0.1)

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

### Features [0.0.8]:

Bonsai has a bit working options:
  
	- Install(-I/--install: get source,extract,configure,compile,(check),(extras),clean)
	- Query(-Q/--query: search for availible pkgs)
	- Description(-D/--desc: search for a package and shows details)
	- List installed packages *BY BONSAI ONLY* (-L/--installed: installed packages from bonsai)
	- Repository syncing (-S: sync repository from git repo)
	- System upgrade (-U/--upgrade: upgrade system packages)

Other arguments:
  
	- Pretend (--pretend)
	- Version (--version: shows bonsai version)
	- Help (--help: shows bonsai help [more detailed])
	- Nocheck (--nocheck: skips compiled-packages checks)
	- Packages (--packages: shows availible packages) 
	- Quiet (-Q/--quiet: standard output will not be shown [useful if your hardware is slow])

Features listed above are *Working*

===

Features that are going to be implemented:
	
	- [TODO/NEXT]Remove (-R/--remove: removes installed packages)

Features listed above are *WIP*

### Bonsai directories:

Bonsai uses other code/configs to work great!

 - /usr/bin/bonsai : main
 - /usr/bonsai : contains pkgtree, shellscripts 
 - /var/bonsai : contains infos about packages
 - /etc/bonsai : contains config files

### Example[OLD-0.0.3]:
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
