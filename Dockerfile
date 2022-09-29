FROM bitnami/tomcat:9.0
COPY target/vprofile-v1.war /opt/bitnami/tomcat/webapps_default
