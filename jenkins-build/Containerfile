FROM ao/devop:alpine3

ENV JENKINS_HOME="/var/www/jenkins" 

COPY jenkins.war.xz /tmp

RUN set -xe ; \
	#
	# create jenkins folder
	mkdir -p $JENKINS_HOME ; \
	#
	# extract war
	cd /var/www; \
	mv /tmp/jenkins.war.xz .; \
	xz -d jenkins.war.xz; \
	chown root /var/www/jenkins.war; \
	chgrp root /var/www/jenkins.war; \
	#
	# install required packages for jenkins
	apk add freetype font-xfree86-type1; \
	#
	# do basic tests
	java -jar /var/www/jenkins.war --usage ;

VOLUME [ "$JENKINS_HOME" ]

WORKDIR /var/www/

EXPOSE 8080

CMD java -jar jenkins.war