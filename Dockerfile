FROM ubuntu:latest 

RUN apt-get update
RUN apt-get install -y git 

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]