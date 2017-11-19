from time import sleep
from picamera import PiCamera
import argparse
import logging

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('-o',type=str, default="tt.jpg", help='output picutre')
    args = parser.parse_args()
    FORMAT = '%(asctime)-15s %(message)s'
    logging.basicConfig(level=logging.INFO, format=FORMAT)
    camera = PiCamera()
    camera.resolution = (1024, 768)
    camera.start_preview()
    # Camera warm-up time
    sleep(1)
    logging.info('Capturing to : ' + args.o)
    camera.capture(args.o)
    logging.info('Done')
