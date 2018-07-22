##############################################
# Build:
#   docker build -t goswim-kubectl .
#
# Run:

FROM lachlanevenson/k8s-kubectl:latest
COPY gswim-wrapper.sh /gswim-wrapper.sh
RUN \
  apk add -q --no-cache wget && \
  wget -qO - \
    https://github.com/gbevan/yamlsh/releases/download/v0.1.2/yamlsh_0.1.2_linux_amd64.tar.gz \
    | tar zxv -C /usr/local/bin && \
  chmod 755 /gswim-wrapper.sh
WORKDIR /tmp
ENV YAMLSH_SHELL=/bin/sh
ENTRYPOINT ["/gswim-wrapper.sh"]
