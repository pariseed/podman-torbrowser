# podman-torbrowser
a container image to get and start every time the last version of torbrowser


## setup and build the image
cd podman-torbrowser/ && podman build -t tor .


## starting the container executing X11 forwarding with the non root user tor:
uid=1000; podman run --rm -e DISPLAY --net=host -v /tmp/.X11-unix:/tmp/.X11-unix  --uidmap $uid:0:1 --uidmap 0:1:$uid -it tor
