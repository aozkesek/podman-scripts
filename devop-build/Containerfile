FROM ao/alpine3

ENV GRADLE_HOME="/opt/gradle"
ENV PATH="$GRADLE_HOME/bin:$PATH"

COPY gradle.tar.xz /tmp

RUN set -xe ; \
	#
	# install some utility packages
	apk add gcc make linux-headers openjdk11 python3;\
	#
	# extract gradle
	tar xvf /tmp/gradle.tar.xz -C /opt; \
	chown -R root $GRADLE_HOME; \
	chgrp -R root $GRADLE_HOME; \
	chmod +x $GRADLE_HOME/bin/gradle; \
	#
	# do some test
	gcc --version; \
	git --version; \
	javac -version; \
	gradle -version;

CMD bash

