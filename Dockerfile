# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install openjdk-11-jre-headless git -y
RUN adduser --disabled-password --home /home/container container
RUN cd /home/container && git clone --depth=1 https://github.com/w4123/mirai-dice-release-noextra dice && sudo chmod -R container:container dice

USER container
ENV  USER=container HOME=/home/container LANG=C.UTF-8

WORKDIR /home/container/dice

CMD ["/bin/bash", "./LaunchMiraiWithAutomaticSolver.sh"]
