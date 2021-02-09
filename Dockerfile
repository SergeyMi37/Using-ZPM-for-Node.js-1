ARG IMAGE=intersystemsdc/iris-ml-community:2020.3.0.302.0-zpm
FROM $IMAGE
USER root   

RUN \
  apt-get update && \
  apt-get -y install nano  && \
  apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_10.x  | bash -

RUN apt-get -y install nodejs

COPY api /usr/irissys/lib/js

RUN  cd /usr/irissys/lib/js  && \
   npm install intersystems-iris-native && \
   npm install websocket

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp && \
    chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /usr/irissys/lib/js

USER ${ISC_PACKAGE_MGRUSER}

COPY  src src 
COPY  module.xml module.xml
COPY  iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
