FROM jenkins/jenkins:lts

USER root
# RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.13.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
#   && chmod +x /usr/local/bin/kubectl

ARG NODE_VERSION=v11.10.0
ARG DISTRO=linux-x64

RUN curl -LO https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${DISTRO}.tar.xz \
  && tar xzvf node-${NODE_VERSION}-${DISTRO}.tar.xz -C /usr/local/lib/nodejs \
  && ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-${DISTRO}/bin/node /usr/bin/node \
  && ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-${DISTRO}/bin/npm /usr/bin/npm \
  && ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-${DISTRO}/bin/npx /usr/bin/npx \
  && apt-get install --no-install-recommends yarn \
  && rm -f node-$NODE_VERSION-$DISTRO.tar.xz

USER jenkins
