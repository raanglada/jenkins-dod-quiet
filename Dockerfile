FROM raanglada/jenkins-dod:latest

LABEL author="anglada.alex@gmail.com"

# Installing plugins we need
# in /usr/local/bin/ you have some bash scripts to help you to automate several task in jenkins
COPY plugins /usr/share/jenkins/plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins

# Setting up jenkins admin user
ENV JENKINS_USER=admin \
    JENKINS_PASS=admin      

#create first admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

#enable csrf protection
COPY csrf.groovy /usr/share/jenkins/ref/init.groovy.d/

#enable access control for slaves
COPY acces-control-for-slaves.groovy /usr/share/jenkins/ref/init.groovy.d/

#configure authorize-project
COPY configure-authorize-project-plugin.groovy /usr/share/jenkins/ref/init.groovy.d/
