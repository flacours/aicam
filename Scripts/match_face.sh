#!/bin/bash
python picture.py -o tt.jpg
echo "Uploading to AWS..."
aws s3 cp tt.jpg s3://labcam > output
echo "Recognition...."
aws rekognition search-faces-by-image --collection-id "friends" --image "{\"S3Object\":{\"Bucket\":\"labcam\",\"Name\":\"tt.jpg\"}}"

