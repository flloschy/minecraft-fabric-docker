FROM ubuntu:latest

COPY --chmod=755 ./start.sh /

RUN mkdir /app
RUN mkdir /backup
RUN apt-get update -y
RUN apt-get install default-jre curl zip -y 

EXPOSE 25565
CMD ["sh", "/start.sh"]
