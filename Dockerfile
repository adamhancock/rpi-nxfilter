FROM ubuntu
RUN apt-get update && apt-get -y install openjdk-8-jdk wget nano unzip
RUN wget http://pub.nxfilter.org/nxfilter-4.3.7.3.deb
RUN dpkg -i nxfilter-4.3.7.3.deb
RUN mkdir /nxfilter/guipack
RUN wget http://pub.nxfilter.org/sandwatch-0.9.6.zip && unzip sandwatch-0.9.6.zip -d /nxfilter/guipack
COPY cfg.properties /nxfilter/conf/cfg.properties
EXPOSE 53/UDP 80/TCP
CMD [ "/nxfilter/bin/startup.sh" ]
