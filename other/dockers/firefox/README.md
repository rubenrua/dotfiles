http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/


docker build -t firefox .
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox


Note: xhost +