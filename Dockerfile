FROM tomcat:9

WORKDIR /usr/local/tomcat/webapps
RUN apt-get update && apt-get install -y awscli
RUN aws configure set aws_access_key_id AKIARGDMACZHQQYWZ4FG && \
    aws configure set aws_secret_access_key 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 && \
    aws configure set default.region us-east-1
ARG S3_BUCKET=mybucket-20242501
ARG WAR_FILE=studentapp-2.5-SNAPSHOT.war
RUN aws s3 cp s3://$S3_BUCKET/$WAR_FILE .
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mv $WAR_FILE ROOT.war

EXPOSE 8081
CMD ["catalina.sh", "run"]
