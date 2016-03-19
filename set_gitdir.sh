#!/bin/bash

if [ $UID -eq 0 ];
then
				if [ -d .git ];
				then
								sed -i "s:DEFAULT_GIT_REPO:$(pwd):" /etc/bonsai/bonsai.conf
								echo "* Done"
				fi
else
				printf "\033[31m*\033[0m You must be r00t.\n"
				exit 2
fi
