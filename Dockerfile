FROM tomcat:8

# Add Maven dependencies (not shaded into the artifact; Docker-cached)

ADD target/docker-demo.war /usr/local/tomcat/webapps/docker-demo.war

EXPOSE 80