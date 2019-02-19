FROM jenkins/jenkins:lts

USER root
# RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.13.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
#   && chmod +x /usr/local/bin/kubectl

RUN curl -LO https://nodejs.org/dist/v11.10.0/node-v11.10.0-linux-x64.tar.xz \
  && tar xvf node-v11.10.0-linux-x64.tar.xz -C /usr/local/lib \
  && ln -s /usr/local/lib/node-v11.10.0-linux-x64/bin/node /usr/bin/node \
  && ln -s /usr/local/lib/node-v11.10.0-linux-x64/bin/npm /usr/bin/npm \
  && ln -s /usr/local/lib/node-v11.10.0-linux-x64/bin/npx /usr/bin/npx \
  && apt-get update && apt-get install --no-install-recommends -y yarn \
  && rm -f node-v11.10.0-linux-x64.tar.xz

# RUN apt-get update && apt-get install -y yarn

USER jenkins
