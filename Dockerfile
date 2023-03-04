FROM crashvb/supervisord:202303031721@sha256:6ff97eeb4fbabda4238c8182076fdbd8302f4df15174216c8f9483f70f163b68
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:6ff97eeb4fbabda4238c8182076fdbd8302f4df15174216c8f9483f70f163b68" \
	org.opencontainers.image.base.name="crashvb/supervisord:202303031721" \
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
ENV TFTP_DIRECTORY=/var/lib/tftpboot TFTP_UNAME=tftp TFTP_GNAME=tftp

# Configure: supervisor
COPY supervisord.tftpd-hpa.conf /etc/supervisor/conf.d/tftpd-hpa.conf

# Configure: entrypoint
COPY entrypoint.tftpd-hpa /etc/entrypoint.d/tftpd-hpa

# Configure: healthcheck
COPY healthcheck.tftpd-hpa /etc/healthcheck.d/tftpd-hpa

EXPOSE 69/udp

VOLUME ${TFTP_DIRECTORY}
