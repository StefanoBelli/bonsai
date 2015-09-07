install:
	mkdir -p /etc/bonsai && echo "* /etc/bonsai was created" || exit 7
	mkdir -p /var/bonsai && echo "* /var/bonsai was created" || exit 2
	mkdir -p /var/bonsai/installed && echo "* /var/bonsai/installed was created" || exit 5
	mkdir -p /usr/bonsai  && echo "* /usr/bonsai was created" || exit 6
	mkdir -p /usr/bonsai/pkgtree && echo "* /usr/bonsai/pkgtree was created" || exit 1
	cp src/_setup.sh src/_build.sh src/_functions.sh /usr/bonsai && echo "* Needed code copied to /usr/bonsai" || exit 2
	cp src/bonsai.conf /etc/bonsai/bonsai.conf && echo "* Config file -> /etc/bonsai/bonsai.conf" || exit 8
	cp src/bonsai /usr/bin/bonsai && echo "* Bonsai package manager was installed" || exit 3

uninstall:
	rm -r /etc/bonsai && echo "* /etc/bonsai deleted (and all its content)" || exit 4
	rm -r /usr/bonsai && echo "* /usr/bonsai deleted (and all its content)" || exit 1
	rm -r /var/bonsai && echo "* /var/bonsai deleted (and all its content)" || exit 3
	rm /usr/bin/bonsai && echo "* Bonsai package manager was uninstalled... Bye!" || exit 2

uninstall_keep_dir:
	echo "* Removing Bonsai package manager keeping /usr/bonsai directory and all its files..." 
	rm /usr/bin/bonsai && echo "* Bonsai package manager was uninstalled, keeping /usr/bonsai & /var/bonsai... Bye!" || exit 2

.PHONY:
	install,uninstall,uninstall_keep_dir
