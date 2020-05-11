FROM tomcat:9
EXPOSE 8080
COPY target/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
