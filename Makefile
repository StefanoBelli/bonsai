install:
	mkdir -p /etc/bonsai && echo "* /etc/bonsai was created" || exit 1
	mkdir -p /var/bonsai && echo "* /var/bonsai was created" || exit 1
	mkdir -p /var/bonsai/installed && echo "* /var/bonsai/installed was created" || exit 1
	mkdir -p /usr/bonsai  && echo "* /usr/bonsai was created" || exit 1
	mkdir -p /usr/bonsai/pkgtree && echo "* /usr/bonsai/pkgtree was created" || exit 1
	cp src/_setup.sh src/_build.sh src/_functions.sh /usr/bonsai && echo "* Needed code copied to /usr/bonsai" || exit 1
	cp src/bonsai.conf /etc/bonsai/bonsai.conf && echo "* Config file -> /etc/bonsai/bonsai.conf" || exit 1
	cp src/bonsai /usr/bin/bonsai && echo "* Bonsai package manager was installed" || exit 1
	cp src/bonsai-update /usr/bin/bonsai-update && bash set_gitdir.sh || exit 1

uninstall_all:
	rm -r /etc/bonsai && echo "* /etc/bonsai deleted (and all its content)" || exit 1
	rm -r /usr/bonsai && echo "* /usr/bonsai deleted (and all its content)" || exit 1
	rm -r /var/bonsai && echo "* /var/bonsai deleted (and all its content)" || exit 1
	rm /usr/bin/bonsai && echo "* Bonsai package manager was uninstalled... Bye!" || exit 1
	rm /usr/bin/bonsai-update && echo "* Bonsai update tool uninstalled!" || exit 1

uninstall:
	echo "* Removing Bonsai package manager keeping /usr/bonsai,/var/bonsai and /etc/bonsai directories and all its files..." 
	rm /usr/bin/bonsai && echo "* Bonsai package manager was uninstalled, keeping /usr/bonsai , /var/bonsai, /etc/bonsai... Bye!" || exit 1

.PHONY:
	install,uninstall,uninstall_all

ifndef VERBOSE
.SILENT:
endif
