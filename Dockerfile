FROM ubuntu
RUN apt-get update && apt-get -y install openjdk-8-jdk wget nano unzip iputils-ping curl jq
RUN wget -q `curl -s https://api.github.com/repos/adamhancock/portx/releases/latest | jq -r '.assets[] | select(.name == "portx-linux") |.browser_download_url'` -O /tmp/portx && chmod +x /tmp/portx && mv /tmp/portx /usr/local/bin/portx
RUN wget http://pub.nxfilter.org/nxfilter-4.3.7.3.deb
RUN dpkg -i nxfilter-4.3.7.3.deb
RUN mkdir /nxfilter/guipack
RUN wget http://pub.nxfilter.org/sandwatch-0.9.6.zip && unzip sandwatch-0.9.6.zip -d /nxfilter/guipack
RUN cp -r /nxfilter/conf /nxfilter/conf-default
EXPOSE 53/UDP 80/TCP
VOLUME /nxfilter/conf
VOLUME /nxfilter/db
# COPY cfg.properties /nxfilter/conf/cfg.properties
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/nxfilter/bin/startup.sh" ]
