FROM openshift/jenkins-slave-base-fedora

MAINTAINER Gabe Montero <gmontero@redhat.com>

ENV NODEJS_VERSION=8 \
    NPM_CONFIG_PREFIX=$HOME/.npm-global \
    PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$PATH \
    BASH_ENV=/usr/local/bin/scl_enable \
    ENV=/usr/local/bin/scl_enable \
    PROMPT_COMMAND=". /usr/local/bin/scl_enable"

COPY contrib/bin/scl_enable /usr/local/bin/scl_enable

# Install NodeJS
RUN INSTALL_PKGS="nodejs npm make gcc-c++" && \
    dnf install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    npm install -g nodemon && \
    rpm -V $INSTALL_PKGS && \
    dnf clean all -y

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
