#!/bin/sh
#
# Jump to the nearest ancestor directory contains the specified file.
#
# Author: EungJun, Yi <semtlenori@gmail.com>
# 
# Usage:
#     $ . ./jcd.sh
#     $ jcd <filename>

function jcd() {
	target=$1
	container=`dirname $1`
	realpath=`readlink -f $container`

	while [ "$realpath" != '/' ] ;
	do
		if [ -e $target ]
		then
			if [ -d $target ]
			then
				cd $target
				return $?
			else
				cd $container
				return $?
			fi
		fi

		target=../$target
		container=`dirname $target`
		realpath=`readlink -f $container`
	done
}
