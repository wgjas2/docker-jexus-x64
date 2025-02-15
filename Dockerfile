FROM debian:buster-slim

LABEL MAINTAINER="NolyOh <wgjas2@qq.com>"

COPY src/bootstrap.sh /usr/bin/

# Install wget, download and install jexus, then cleanup
COPY src/install.sh /tmp/
RUN /tmp/install.sh

# Expost ports
EXPOSE 80 443
# Define volumes
VOLUME ["/usr/jexus/siteconf", "/var/www", "/usr/jexus/log"]
# Define workdir
WORKDIR /usr/jexus
# Define startup scripts;
ENTRYPOINT ["/usr/bin/bootstrap.sh"]
# Healthy check
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
  CMD curl -f http://127.0.0.1 || exit 1
