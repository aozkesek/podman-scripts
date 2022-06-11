FROM alpine:3

ENV PGDATA=/var/lib/postgresql/data
VOLUME /var/lib/postgresql/data
EXPOSE 5432

COPY pg-entry.sh /

RUN set -xe ; \
	#
	# install pre-required packages
	apk add coreutils bash xz musl-locales postgresql postgresql-client; \
	mkdir /run/postgresql; \
	chown postgres /run/postgresql; \
	chmod +x /pg-entry.sh; \
	# check some of them
	postgres --version;

CMD bash

