# Image official of java 8
FROM java:8

MAINTAINER Baldissera <guilhermebaldissera@hotmail.com>

ENV GRAILS_VERSION 3.1.1

# Update
RUN apt-get update

# Need for novosga
RUN apt-get install -y mysql-server

# Install grails 3.1.1
RUN curl -s get.sdkman.io | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"
RUN sdk install grails $GRAILS_VERSION

# Install git extensions
RUN apt-get install -y git