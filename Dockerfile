FROM tomcat:latest
COPY ./var/lib/jenkins/workspace/task-1/target/studentapp-2.5-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["catalina.sh", "run"]
