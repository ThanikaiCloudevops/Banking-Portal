# FROM openjdk:11-jdk-slim
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "/app.jar"]
# Stage 1: Build the JAR
# FROM maven:3.8.4-openjdk-11 AS build
# WORKDIR /workspace
# COPY . /workspace/
# RUN mvn clean compile -X

# # Stage 2: Copy JAR into final image
# FROM openjdk:11-jdk-slim
# WORKDIR /app
# COPY --from=build /workspace/target/app.jar app.jar

# EXPOSE 8080

# ENTRYPOINT ["java", "-jar", "app.jar"]
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project into the container
COPY . /app/

# Install Maven (optional, if not using a Maven image)
RUN apt-get update && apt-get install -y maven

# Compile and package the application
RUN mvn clean package

# Copy the JAR file into the container
COPY target/app.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]





