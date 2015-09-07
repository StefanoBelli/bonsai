install:
	mkdir -pv /usr/bonsai/pkgtree && echo "* /usr/bonsai/ was created" || exit 1
	cp _setup.sh _build.sh _config.sh _functions.sh /usr/bonsai && echo "* files copied to /usr/bonsai" || exit 2
	cp bonsai /usr/bin/bonsai && echo "* Bonsai package manager was installed" || exit 3

uninstall:
	rm -r /usr/bonsai && echo "* /usr/bonsai deleted (and all its content)" || exit 1
	rm /usr/bin/bonsai && echo "* Bonsai package manager was uninstalle d... Bye!" || exit 2

uninstall_keep_dir:
	echo "* Removing Bonsai package manager keeping /usr/bonsai directory and all its files..." 
	rm /usr/bin/bonsai && echo "* Bonsai package manager was uninstalled, keeping /usr/bonsai... Bye!" || exit 2

.PHONY:
	install,uninstall,uninstall_keep_dir
