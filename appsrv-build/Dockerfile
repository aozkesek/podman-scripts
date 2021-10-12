FROM alpine:3

RUN set -xe ; \
	#
	# install git prerequired packages 
	apk add coreutils xz bash openjdk11-jre-headless; \
	# 
	# test java
	java --version; 
	
VOLUME /apps

CMD bash

