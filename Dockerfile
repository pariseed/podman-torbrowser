FROM fedora
RUN dnf install -y torbrowser-launcher zenity kdialog xmessage gxmessage libXinerama.x86_64 cups-libs dbus-glib
RUN groupadd -g 1000 tor; useradd -g 1000 -u 1000 -m tor 

USER tor


CMD /usr/bin/torbrowser-launcher; kill -9 $(ps aux | grep -i torbrowser | awk '{print $2}' | tr '\n' ' '); /home/tor/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser --verbose 
