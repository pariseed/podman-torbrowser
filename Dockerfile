FROM registry.fedoraproject.org/fedora:42

# Install Wayland and graphics libraries
RUN dnf update -y && \
    dnf install -y \
        wayland-devel \
        wayland-protocols-devel \
        libwayland-client \
        libwayland-server \
        libwayland-cursor \
        mesa-libGL \
        mesa-libEGL \
        mesa-libgbm \
        mesa-dri-drivers \
        mesa-vulkan-drivers \
        libxkbcommon \
        libxkbcommon-devel \
        fontconfig \
        freetype \
        libdrm \
        && dnf clean all

# Install additional useful packages
RUN dnf install -y \
        weston \
        foot \
        firefox \
        file \
        gtk4 \
        gtk3 \
        qt5-qtwayland \
        qt6-qtwayland \
        glibc-langpack-en \
        && dnf clean all

# Create a non-root user matching host user
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g ${GROUP_ID} wayland-user && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -m -s /bin/bash wayland-user

# Switch to non-root user
USER wayland-user
WORKDIR /home/wayland-user

# Set environment variables for Wayland
ENV XDG_RUNTIME_DIR=/run/user/1000
ENV WAYLAND_DISPLAY=wayland-0
ENV MOZ_ENABLE_WAYLAND=1
ENV QT_QPA_PLATFORM=wayland
ENV GDK_BACKEND=wayland


CMD curl -L -o tor.tar.xz "$(echo https://www.torproject.org/$(curl -s https://www.torproject.org/download/ | grep "Download for Linux" | grep -o '/.*xz'))"; tar -xf tor.tar.xz; cd tor-browser/; ./start-tor-browser.desktop --verbose


