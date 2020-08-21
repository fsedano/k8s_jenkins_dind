FROM ubuntu:18.04
RUN apt-get update && apt-get install -y -f wget apt-transport-https ca-certificates curl software-properties-common git
RUN wget --no-check-certificate -qO - https://download.docker.com/linux/ubuntu/gpg | apt-key add
RUN apt-get update
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt install -y docker-ce