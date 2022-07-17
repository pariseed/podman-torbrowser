# podman-torbrowser
a container image to get and start every time the last version of torbrowser


## prerequisites
> in order to use this container you have to use a system with a Xorg server running, wayland is not supported
 

## setup and build the image
> cd podman-torbrowser/ && podman build -t tor .


## starting the container executing X11 forwarding with the non root user tor:
> uid=1000; podman run --rm -e DISPLAY --net=host -v /tmp/.X11-unix:/tmp/.X11-unix  --uidmap $uid:0:1 --uidmap 0:1:$uid -it tor
