# tftpd-hpa-docker

[![version)](https://img.shields.io/docker/v/crashvb/tftpd-hpa/latest)](https://hub.docker.com/repository/docker/crashvb/tftpd-hpa)
[![image size](https://img.shields.io/docker/image-size/crashvb/tftpd-hpa/latest)](https://hub.docker.com/repository/docker/crashvb/tftpd-hpa)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/tftpd-hpa-docker.svg)](https://github.com/crashvb/tftpd-hpa-docker/blob/master/LICENSE.md)

## Overview

This docker image contains [HPAs TFTP Server](https://github.com/asciiprod/tftp-hpa).

## Entrypoint Scripts

### tftpd-hpa

The embedded entrypoint script is located at `/etc/entrypoint.d/tftpd-hpa` and performs the following actions:

1. A new tftp-hpa configuration is generated using the following environment variables:

 | Variable | Default Value | Description |
 | -------- | ------------- | ----------- |
 | TFTP\_DIRECTORY | /var/lib/tftpboot | tftp-hpa data directory. |
 | TFTP\_GROUP | tftp | Group ID of the tftp-hpa user. |
 | TFTP\_USERNAME | tftp | User ID of the tftp-hpa user. |

## Healthcheck Scripts

### tftpd-hpa

The embedded healthcheck script is located at `/etc/healthcheck.d/tftpd-hpa` and performs the following actions:

1. Verifies that all tftpd-hpa services are operational.

## Standard Configuration

### Container Layout

```
/
├─ etc/
│  ├─ entrypoint.d/
│  │  └─ tftpd-hpa
│  └─ healthcheck.d/
│     └─ tftpd-hpa
└─ var/
   └─ lib/
      └─ tftpboot/
```

### Exposed Ports

* `69/udp` - TFTPD listening port.

### Volumes

* `/var/lib/tftpboot` - tftpd-hpa data directory.

## Development

[Source Control](https://github.com/crashvb/tftpd-hpa-docker)

