FROM crashvb/supervisord:202201080446@sha256:8fe6a411bea68df4b4c6c611db63c22f32c4a455254fa322f381d72340ea7226
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:8fe6a411bea68df4b4c6c611db63c22f32c4a455254fa322f381d72340ea7226" \
	org.opencontainers.image.base.name="crashvb/supervisord:202201080446" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="Image containing HPAs TFTP Server." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/tftpd-hpa-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/tftpd-hpa" \
	org.opencontainers.image.url="https://github.com/crashvb/tftpd-hpa-docker"

# Install packages, download files ...
RUN docker-apt tftpd-hpa

# Configure: tftpd-hpa
ENV TFTP_DIRECTORY=/var/lib/tftpboot TFTP_USERNAME=tftp TFTP_GROUP=tftp

# Configure: supervisor
COPY supervisord.tftpd-hpa.conf /etc/supervisor/conf.d/tftpd-hpa.conf

# Configure: entrypoint
COPY entrypoint.tftpd-hpa /etc/entrypoint.d/tftpd-hpa

# Configure: healthcheck
COPY healthcheck.tftpd-hpa /etc/healthcheck.d/tftpd-hpa

EXPOSE 69/udp

VOLUME ${TFTP_DIRECTORY}
