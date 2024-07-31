# FROM openjdk:11-jdk-slim
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "/app.jar"]

FROM openjdk:11-jdk-slim

# Use a fixed name for the JAR file, assuming it's named 'app.jar'
COPY target/app.jar app.jar

# Expose the port on which the application will run
EXPOSE 8080

# Set the entry point to run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
