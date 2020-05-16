# jenkins-dod-quiet

## How to get plugins from some jenkins

curl -s -k "https://user:pass@jenkins-domain.com/pluginManager/api/json?depth=1"  | jq -r '.plugins[].shortName' | tee plugins > plugins

## How to build

$ docker build --pull -t raanglada/jenkins-dod-quiet:0.0.1 .

## How to use

Create a folder for jenkins home 
```
$ mkdir jenkins_home
```

```
docker run --name jenkins-dod-quiet \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(pwd)/jenkins_home:/var/jenkins_home \
-v $(which docker):/usr/bin/docker \
-e JENKINS_USER=admin \
-e JENKINS_PASS=admin123** \
-e JAVA_OPTS="-Dhudson.footerURL=http://myjenkins.com:8080 -Djenkins.install.runSetupWizard=false" \
-p 8080:8080 -p 50000:50000 \
-d raanglada/jenkins-dod-quiet:0.0.1
```

note: change the value for JENKINS_USER and JENKINS_PASS environment variables

