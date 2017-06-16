FROM openjdk:8-jdk-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

ENV TEAMCITY_VERSION=2017.1.2
ENV TEAMCITY_DATA_PATH /app/data

RUN apk add --update wget && \
    rm -rf /var/cahce/apk/* && \
    wget https://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz -O TeamCity.tar.gz && \
    mkdir /app && \
    tar -xvzf TeamCity.tar.gz -C /app && \
    rm TeamCity.tar.gz

EXPOSE 8111

CMD ["/bin/ash", "-c", "/app/TeamCity/bin/teamcity-server.sh run"]
