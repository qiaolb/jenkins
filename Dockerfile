FROM jenkins/jenkins:lts-alpine

USER root
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.13.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

// USER jenkins
