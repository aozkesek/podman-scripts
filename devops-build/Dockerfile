FROM ao/alpine:3

ENV PATH="/opt/gradle/bin:/opt/apache-maven/bin:$PATH"

COPY gradle.tar.xz /tmp
COPY apache-maven.tar.xz /tmp

RUN set -xe ; \
	#
	# extract gradle and maven
	xz -d /tmp/gradle.tar.xz; \
	xz -d /tmp/apache-maven.tar.xz; \
	tar xf /tmp/gradle.tar -C /opt; \
	tar xf /tmp/apache-maven.tar -C /opt; \
	rm /tmp/gradle.tar /tmp/apache-maven.tar; \
	chown -R root /opt/gradle /opt/apache-maven; \
	chgrp -R root /opt/gradle /opt/apache-maven; \
	chmod +x /opt/gradle/bin/gradle /opt/apache-maven/bin/mvn; \
	#
	# install some utility packages
	apk add build-base linux-headers openjdk11-jdk openjdk11-jre-headless python3;\
	#
	# do some test
	gcc --version; \
	make --version; \
	python3 --version; \
	javac -version; \
	gradle -version; \
	mvn --version;

CMD bash

