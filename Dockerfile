FROM openjdk:8-jre-alpine
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

ENV TEAMCITY_VERSION="2017.1.4" \
    TEAMCITY_DATA_PATH="/app/data"

RUN apk add --no-cache --virtual .trash wget \
    && apk add --no-cache git \
    && wget https://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz -O TeamCity.tar.gz \
    && mkdir /app \
    && tar -xvzf TeamCity.tar.gz -C /app \
    && rm TeamCity.tar.gz \
    && apk del .trash

EXPOSE 8111

CMD ["/bin/ash", "-c", "/app/TeamCity/bin/teamcity-server.sh run"]
