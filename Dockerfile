FROM fedora:38
RUN dnf install -y zenity kdialog xmessage gxmessage libXinerama.x86_64 cups-libs dbus-glib procps-ng xz
RUN groupadd -g 1000 tor; useradd -g 1000 -u 1000 -m tor 

USER tor


CMD cd /home/tor; curl -L -o tor.tar.xz "$(echo https://www.torproject.org/$(curl -s https://www.torproject.org/download/ | grep "Download for Linux" | grep -o '/.*xz'))"; tar -xf tor.tar.xz; cd tor-browser/; ./start-tor-browser.desktop --verbose
