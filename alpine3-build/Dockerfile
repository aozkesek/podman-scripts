FROM alpine:3

RUN set -xe ; \
	#
	# install pre-required packages
	apk add sqlite coreutils bash xz git openssh; \
	# check some of them
	git --version; \
	sqlite3 -version;

CMD bash

