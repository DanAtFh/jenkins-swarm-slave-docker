FROM java:7u65

MAINTAINER Carlos Sanchez <carlos@apache.org>

ENV VERSION 1.17
ENV HOME /home/jenkins-slave

VOLUME /home/jenkins-slave

RUN useradd -c "Jenkins Slave user" -d $HOME -m jenkins-slave
RUN curl -sSLo /usr/share/jenkins/swarm-client-$VERSION-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$VERSION/swarm-client-$VERSION-jar-with-dependencies.jar

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

USER jenkins-slave

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
