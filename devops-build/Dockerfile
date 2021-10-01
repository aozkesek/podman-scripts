FROM ao/alpine:3

ENV GRADLE_HOME="/opt/gradle"
ENV PATH="$GRADLE_HOME/bin:$PATH"

COPY gradle.tar.xz /tmp

RUN set -xe ; \
	#
	# extract gradle
	xz -d /tmp/gradle.tar.xz; \
	tar xf /tmp/gradle.tar -C /opt; \
	chown -R root $GRADLE_HOME; \
	chgrp -R root $GRADLE_HOME; \
	chmod +x $GRADLE_HOME/bin/gradle; \
	#
	# install some utility packages
	apk add gcc make linux-headers openjdk11 python3;\
	#
	# do some test
	gcc --version; \
	python3 --version; \
	javac -version; \
	gradle -version;

CMD bash

