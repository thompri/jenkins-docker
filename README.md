# Introduction
Dockerfile to create a Jenkins container that has properly working docker client.  The containers that I tried from jenkinsci/ on dockerhub had "root" group owner on /var/run/docker.sock and the "jenkins" user account was not part of the "docker" group.  With these problems it felt cleaner to install docker fresh than use a partially configured unknown container.

# Pre-requisites
- Docker installed
- Access to the internet to use apt repositories and docker packages.

# Example use
### To create the image
set-location <project_repo_root>
docker build -t jenkins/jenkins-docker .

### To run the container
docker run --name jenk --rm -p 8080:8080 -v jenk_vol:/var/jenkins_home -v c:\code:/home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins-docker

- With the above example, ensure that the docker host firewall allows inbound access to port 8080 and c:\code exists on the docker host as a scratch area to map into the Jenkins container.

### To open a shell session to the jenkins container
docker exec -it jenk bash
