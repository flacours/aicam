#!/bin/bash

usage()
{
    echo "usage: take_picfture.sh [[[-o picture.jpg ] ]] | [-h]]"
}

filename=
while [ "$1" != "" ]; do
    case $1 in
	-o )                    shift
				filename=$1
				;;
	-h | --help )           usage
				exit
				;;
	* )                     usage
				exit 1
    esac
    shift
done
echo "File nane : " $filename
raspistill -o $filename

