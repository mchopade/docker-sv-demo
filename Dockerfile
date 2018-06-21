FROM 127.0.0.1:5001/docker-sv-demo:latest

# Add Maven dependencies (not shaded into the artifact; Docker-cached)

ADD target/docker-demo.war /usr/local/tomcat/webapps/docker-demo.war

EXPOSE 80