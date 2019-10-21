FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
  apt-get install --no-install-recommends -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
  apt-get update && \
  apt-get install --no-install-recommends -y docker-ce-cli && \
  addgroup --gid 999 docker && \
  usermod -aG docker jenkins
 USER jenkins