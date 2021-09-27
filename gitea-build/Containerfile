FROM ao/alpine3

ENV GITREPO=/var/gitrepo

COPY gitea.xz /usr/bin

RUN set -xe ; \
	#
	# extract, rename and make executable the gitea
	cd /usr/bin; \
	xz -d gitea.xz; \
	chown root /usr/bin/gitea; \
	chgrp root /usr/bin/gitea; \
	chmod +x /usr/bin/gitea; \
	#
	# do basic tests
	gitea --version; \
	git --version; 

VOLUME [ "$GITREPO" ]
WORKDIR "$GITREPO"
EXPOSE 8081

CMD gitea \
	--config $GITREPO/custom/conf/app.ini \
	--custom-path $GITREPO/custom \
	--work-path $GITREPO \
	--port 8081 \
	web \
	--install-port 8081 
