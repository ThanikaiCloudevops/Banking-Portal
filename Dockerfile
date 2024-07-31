# FROM openjdk:11-jdk-slim
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "/app.jar"]

FROM openjdk:11-jdk-slim

WORKDIR /app

# Copy everything from target/ directory to /app
COPY target/ /app/

# Rename or move files inside the container if needed
RUN mv /app/my-application.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]



