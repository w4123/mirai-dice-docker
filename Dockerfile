# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install openjdk-11-jre-headless unzip -y
RUN adduser --disabled-password --home /home/container container
RUN cd /home/container && wget -O dice.zip "https://drive.kokona.tech/s/pLM4wFPbGemcsJ4/download" && unzip dice.zip && rm dice.zip 

USER container
ENV  USER=container HOME=/home/container LANG=C.UTF-8

WORKDIR /home/container

CMD ["/usr/bin/java", "-Dmirai.slider.captcha.supported", "-jar", "mcl.jar"]
