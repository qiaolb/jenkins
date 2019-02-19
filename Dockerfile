FROM jenkins/jenkins:lts

USER root
# RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.13.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
#   && chmod +x /usr/local/bin/kubectl

RUN curl -LO https://nodejs.org/dist/v10.15.1/node-v10.15.1-linux-x64.tar.xz \
  && tar xvf node-v10.15.1-linux-x64.tar.xz -C /usr/local/lib \
  && ln -s /usr/local/lib/node-v10.15.1-linux-x64/bin/node /usr/bin/node \
  && ln -s /usr/local/lib/node-v10.15.1-linux-x64/bin/npm /usr/bin/npm \
  && ln -s /usr/local/lib/node-v10.15.1-linux-x64/bin/npx /usr/bin/npx \
  && apt-get update && apt-get install -y apt-transport-https ca-certificates  \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install --no-install-recommends -y yarn \
  && rm -f node-v10.15.1-linux-x64.tar.xz

# RUN apt-get update && apt-get install -y yarn

USER jenkins
