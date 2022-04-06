FROM ao/alpine:3

COPY sshd_config /tmp

RUN set -xe ; \
	#
	# install git prerequired packages 
	apk add openrc openjdk11-jre-headless; \
	#
	# add sshd as service
	mv /tmp/sshd_config /etc/ssh/ ; \
	rc-update add sshd; \
	# 
	# test java
	java --version; 

# the global folder for all appications
VOLUME /apps

# change ssh port
EXPOSE 8022

CMD bash

