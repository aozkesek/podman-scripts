FROM ao/devops:alpine

COPY jenkins.war /tmp

RUN set -xe ; \
	#
	# create jenkins folder
	mkdir -p /var/www/jenkins; \
	# extract war
	mv /tmp/jenkins.war /var/www; \
	chown root /var/www/jenkins.war; \
	chgrp root /var/www/jenkins.war; \
	#
	# install required packages for jenkins
	apk add freetype font-xfree86-type1; \
	#
	# do basic tests
	java -jar /var/www/jenkins.war --usage ;

ENV JENKINS_HOME=/var/www/jenkins

VOLUME /var/www/jenkins
VOLUME /apps

WORKDIR /var/www/

EXPOSE 8080

CMD java -jar jenkins.war
