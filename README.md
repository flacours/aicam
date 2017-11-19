# aicam
Face recognition camera

based on this article : https://www.oreilly.com/ideas/build-a-talking-face-recognizing-doorbell-for-about-100

## setup AWS reckonition

This project work on python 3. I suggest you create a virtual
environment on python3 and install the following dependencies:

- awscli

to create
virtualenv -p /usr/bin/python3 py3env

to activate
source py3env/bin/activate

## AWS setup

* create a collection of friends
aws rekognition create-collection --collection-id friends

* create bucket
aws s3api create-bucket --bucket labcam

## Scripts

Scripts/take_picture.sh : to take a picture
Scripts/add_friend.sh : to add a friend to the labcam bucket


