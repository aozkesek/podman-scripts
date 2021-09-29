FROM ao/devop:alpine3

ENV BUILD_HOME="/var/gocd"
ENV SERVER="/opt/go-server"
ENV AGENT="/opt/go-agent"
ENV PATH="$SERVER/bin:$AGENT/bin:$PATH"

COPY go-server.tar.xz /tmp
COPY go-agent.tar.xz /tmp

RUN set -xe ; \
	#
	# extract gocd
	tar xvf /tmp/go-server.tar.xz -C /opt; \
	tar xvf /tmp/go-agent.tar.xz -C /opt; \
	chown -R root /opt; \
	chgrp -R root /opt; \
	#
	# make sure they are executable again
	chmod +x /opt/go-server/bin/go-server; \
	chmod +x /opt/go-agent/bin/go-agent;
	#

VOLUME [ "$BUILD_HOME" ]

WORKDIR "$BUILD_HOME"

EXPOSE 8010

CMD /bin/sh
