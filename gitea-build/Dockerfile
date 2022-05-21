FROM ao/alpine:3

ENV GITREPO=/var/gitrepo

COPY gitea.xz /usr/bin

RUN set -xe ; \
	#
	# extract the gitea
	xz -d /usr/bin/gitea.xz; \
	chown root /usr/bin/gitea; \
	chgrp root /usr/bin/gitea; \
	chmod +x /usr/bin/gitea; \
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
