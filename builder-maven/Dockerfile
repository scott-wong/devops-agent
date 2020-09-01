FROM scottwong/builder-base:latest

# java
RUN yum install -y java-11-openjdk-devel

# maven
ENV MAVEN_VERSION 3.6.3
RUN curl -f -L http://central.maven.org/maven2/org/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -C /opt -xzv
ENV M2_HOME /opt/apache-maven-$MAVEN_VERSION
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

CMD ["mvn","-version"]