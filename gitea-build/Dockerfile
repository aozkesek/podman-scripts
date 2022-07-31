FROM ao/alpine:3

ENV GITREPO=/var/gitrepo

COPY gitea-1.16.9-linux-amd64 /usr/bin

RUN set -xe ; \
	#
	# extract the gitea
	chown root /usr/bin/gitea-1.16.9-linux-amd64; \
	chgrp root /usr/bin/gitea-1.16.9-linux-amd64; \
	chmod +x /usr/bin/gitea-1.16.9-linux-amd64; \
	ln -s /usr/bin/gitea-1.16.9-linux-amd64 /usr/bin/gitea; \
	#
	# do basic tests
	gitea --version; 

VOLUME $GITREPO
WORKDIR $GITREPO
EXPOSE 8081
USER 1000:1000

CMD gitea \
	--config $GITREPO/custom/conf/app.ini \
	--custom-path $GITREPO/custom \
	--work-path $GITREPO \
	--port 8081 \
	web \
	--install-port 8081 
