#!/bin/bash
python picture.py -o tt.jpg
aws s3 cp tt.jpg s3://labcam > output
aws rekognition detect-faces --attributes "ALL" --image "{\"S3Object\":{\"Bucket\":\"labcam\",\"Name\":\"tt.jpg\"}}"
