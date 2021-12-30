FROM bitnami/minideb:bullseye
#FROM ubuntu:19.10
# [dbp:12/30/2021] migrating to minideb stable

RUN apt-get update && apt-get install -y \
    rspamd

RUN mkdir -m 755 -p /run/rspamd && chown _rspamd:_rspamd /run/rspamd

EXPOSE 11332 11333 11334

CMD ["rspamd", "-c", "/etc/rspamd/rspamd.conf", "-u", "_rspamd", "-g", "_rspamd", "--no-fork"]

