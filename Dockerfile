FROM ubuntu:18.04
RUN apt-get update && apt-get install -y -f wget apt-transport-https ca-certificates curl software-properties-common git build-essential rsync
RUN wget --no-check-certificate -qO - https://download.docker.com/linux/ubuntu/gpg | apt-key add
RUN wget --no-check-certificate -qO - https://baltocdn.com/helm/signing.asc | apt-key add
RUN apt-get update
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
RUN apt-get update
RUN apt install -y docker-ce helm
RUN apt install -y vim
RUN curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
ENV KUBECTL_VERSION v1.18.8
RUN curl -L --output /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && chmod +x /usr/local/bin/kubectl

