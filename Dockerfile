FROM bitnami/minideb:bookworm

RUN apt-get clean && \
    apt-get update && \
	apt-get install -y \
        rspamd

RUN mkdir -m 755 -p /run/rspamd && chown _rspamd:_rspamd /run/rspamd

EXPOSE 11332 11333 11334

CMD ["rspamd", "-c", "/etc/rspamd/rspamd.conf", "-u", "_rspamd", "-g", "_rspamd", "--no-fork"]

