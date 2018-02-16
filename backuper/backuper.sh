#!/bin/bash

# Copyright (c) 2018 Rama estudiantil IEEE, Costa Rica
# Authors: Daniel Garcia Vaglio degv364@gmail.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Create a backup of input directory into output directory

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

OUTPUT_DIR="/tmp/backups/"

# Parse options
while getopts "hi:" opt; do
    case "$opt" in
	h)
	        echo -e "Usage: \n -i input directory \n-o output directory"
		exit 0
		;;
	i)  INPUT_DIR=$OPTARG
	    echo "INPUT_DIR $INPUT_DIR"
            ;;
    esac
done

if [ -d $INPUT_DIR ]; then
    echo 'Input exists'
else
    echo 'Error: input dir does not exists'
    exit 1
fi


if [ -d $OUTPUT_DIR ]; then
    echo "$OUTPUT_DIR exists"
else
    echo 'Creating $OUTPUT_DIR'
    mkdir $OUTPUT_DIR
fi

# Loop to create the daemon
while true; do
    echo 'Repeat'
    OF=backup-$(date +%Y%m%d%s).tgz
    tar -czf $OUTPUT_DIR$OF $INPUT_DIR
    sleep 5
done

   

