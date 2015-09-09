# bonsai
Minimal Linux from Scratch package manager and repository. (WIP not really ready for use)

This project is born while I was building my first LFS-7.7-systemd system. Some of the packages are probably broken or incomplete they will be fixed you may still find it useful!
The program currently works after the first chroot or you can test it in any GNU/Linux system.
I'm planning to enable the build of /tools. I have some scripts for that but I still have to integrate in the pkg manager.

### LATEST NEWS!

 - Package tree repository has been created! {github.com/viralex/bonsai-pkgtree} , run "bonsai -S" to update the repository :D
 - Configuration file of bonsai is now */etc/bonsai/bonsai.conf*
 - All optional args were done (yeee)
 - We need to implement pkgs remove + fix bugs/correct something before get 0.1 :)

### WARNING:
These release are *NOT* for daily use!

This is development stage!

We will get a full-working release when 0.1 is reached!

*Make sure to run the sync command before starting to use bonsai.
Sync repo with this command:*
~~~
# bonsai -S
~~~
We will fix packages only after the package manager reaches daily-usage release! (High priority: 0.1)

### How to install/uninstall bonsai:
~~~
# make
~~~

Uninstall *ONLY* /usr/bin/bonsai...
~~~
# make uninstall
~~~

Uninstall deleting all directory with their files (/usr/bonsai,/etc/bonsai,/var/bonsai)
~~~
# make uninstall_all
~~~

### Features [0.0.8-3]:

Bonsai currently implemented options:

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
	- Confirm for install (-a/--ask: confirm before package install)

Features listed above are *Working*

===

Features that are going to be implemented:

	- [TODO]Remove (-R/--remove: removes installed packages)

Features listed above are *WIP*

### Bonsai directories:

Bonsai uses other code/configs to work great!

 - /usr/bin/bonsai : main
 - /usr/bonsai : contains pkgtree, shellscripts 
 - /var/bonsai : contains infos about packages
 - /etc/bonsai : contains config files

### Example:
~~~
root:/# bonsai -I dwm
Bonsai-0.0.8-3

* Installing: dwm --

* Setup:  dwm-6.0...

* Trying to fetch /usr/src/dwm-6.0
--2015-09-09 13:30:21--  http://dl.suckless.org/dwm/dwm-6.0.tar.gz
Resolving dl.suckless.org... 78.47.162.114
Connecting to dl.suckless.org|78.47.162.114|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 20810 (20K) [application/octet-stream]
Saving to: ‘/usr/src/dwm-6.0.tar.gz’

dwm-6.0.tar.gz                                              100%[===========================================================================================================================================>]  20.32K  --.-KB/s   in 0.08s  

2015-09-09 13:30:22 (239 KB/s) - ‘/usr/src/dwm-6.0.tar.gz’ saved [20810/20810]

* Unpacking sources...
mkdir: created directory ‘/var/tmp/dwm-src’
* Source configure phase...

* Source build phase...
~~~

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

### How to test a package:

~~~
root:/# bonsai -I package.pkg
~~~
