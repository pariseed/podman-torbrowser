podman run -it --rm \
    --name fedora-wayland \
    --security-opt label=disable \
    --userns keep-id \
    --device /dev/dri:/dev/dri \
    -v /run/user/$(id -u):/run/user/$(id -u):ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-0} \
    -e XDG_RUNTIME_DIR=/run/user/$(id -u) \
    -e DISPLAY=${DISPLAY:-:0} \
    -e USER=$(whoami) \
    --network host \
    --ipc host \
    tor
