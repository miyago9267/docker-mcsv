ARG JAVA_VERSION
FROM openjdk:${JAVA_VERSION}

WORKDIR /app

RUN apt-get update && apt-get upgrade -y
RUN apt autoclean && apt clean

CMD ["./start_server.sh"]