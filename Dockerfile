# FROM openjdk:11-jdk-slim
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "/app.jar"]
# Stage 1: Build the JAR
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /workspace
COPY . /workspace/
RUN mvn clean compile

# Stage 2: Copy JAR into final image
FROM openjdk:11-jdk-slim
WORKDIR /app
COPY --from=build /workspace/target/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]




