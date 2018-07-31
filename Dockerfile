##############################################
# Build:
#   docker build -t gostint-kubectl .
#
# Run:

FROM lachlanevenson/k8s-kubectl:latest
COPY gostint-wrapper.sh /gostint-wrapper.sh
RUN \
  apk add -q --no-cache wget bash curl openssl && \
  wget -qO - \
    https://github.com/gbevan/yamlsh/releases/download/v0.1.2/yamlsh_0.1.2_linux_amd64.tar.gz \
    | tar zxv -C /usr/local/bin && \
  chmod 755 /gostint-wrapper.sh && \
  wget -qO - https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

WORKDIR /tmp
ENV YAMLSH_SHELL=/bin/sh
ENTRYPOINT ["/gostint-wrapper.sh"]
