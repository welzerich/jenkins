FROM jenkins/jenkins
 
USER root

COPY zscaler-root.pem /etc/ssl/certs/zscaler-root.pem
 
RUN update-ca-certificates && \
    mkdir -p $JENKINS_HOME/keystore && \
    cp $JAVA_HOME/lib/security/cacerts $JENKINS_HOME/keystore/ && \
    $JAVA_HOME/bin/keytool -import -alias zscaler -file /etc/ssl/certs/zscaler-root.pem -keystore $JENKINS_HOME/keystore/cacerts -storepass changeit -noprompt
 
USER jenkins

