#!/bin/bash

usage()
{
    echo "usage: add_friend.sh [[[-i picture.jpg ] [-f name]] | [-h]]"
}

filename=
friend=
while [ "$1" != "" ]; do
    case $1 in
	-i )                    shift
				filename=$1
				;;
	-f )                    shift
				friend=$1
				;;
	-h | --help )           usage
				exit
				;;
	* )                     usage
				exit 1
    esac
    shift
done
echo "File name : " $filename
echo "Friend    : " $friend

echo "s3 upload"
aws s3 cp $filename s3://labcam

echo "rekognition index"
aws rekognition index-faces \
    --image "{\"S3Object\":{\"Bucket\":\"labcam\",\"Name\":\"$filename\"}}" \
    --collection-id "friends" --detection-attributes "ALL" \
    --external-image-id "$friend"
