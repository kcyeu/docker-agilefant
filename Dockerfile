FROM tomcat:8-jre8
MAINTAINER Kuo-Cheng Yeu <kmd@mikuru.tw>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -qqy install \ 
    vim-tiny ttf-dejavu \
&& rm -rf /var/lib/apt/lists/*

ENV AF_UNZIP    /tmp/agilefant
ENV AF_UNWAR    $AF_UNZIP/agilefant
ENV AF_CONFIG   $AF_UNWAR/WEB-INF/agilefant.conf
ENV DESTINATION /usr/local/tomcat/webapps/agilefant

RUN mkdir -p /tmp /opt
ADD http://sourceforge.net/projects/agilefant/files/latest/download /tmp/agilefant.zip
ADD assets/entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/entrypoint.sh \
&& cd /tmp \
&& unzip -d "$AF_UNZIP" agilefant.zip \
&& cd "$AF_UNZIP" \
&& unzip -d "$AF_UNWAR" agilefant.war \
&& cd "$AF_UNWAR" \
&& sed -i -e"s/localhost/db/" "$AF_CONFIG" \
&& cp -r "$AF_UNWAR" "$DESTINATION"

EXPOSE 8080

#CMD /opt/entrypoint.sh && echo "Wait 10 sec for database to be ready" && sleep 10 && catalina.sh run
#CMD /opt/entrypoint.sh && catalina.sh run

ENTRYPOINT /opt/entrypoint.sh

