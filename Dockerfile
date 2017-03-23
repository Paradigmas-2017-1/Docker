# Image official of java 8
FROM java:8

MAINTAINER Baldissera <guilhermebaldissera@hotmail.com>

ENV GRAILS_VERSION 3.1.1

# Update
RUN apt-get update

# Need for novosga
RUN apt-get install debconf-utils
RUN echo 'mysql-server mysql-server/root_password password root' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections
RUN apt-get -y install mysql-server

# Install grails 3.1.1
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

# Install git extensions
RUN apt-get install -y git
RUN mkdir project
WORKDIR /usr/lib/jvm/project
CMD grails run-app
