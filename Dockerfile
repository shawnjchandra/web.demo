# Stage 1: Build
FROM ubuntu:latest AS build
RUN apt-get update && apt-get install -y openjdk-21-jdk curl unzip

WORKDIR /app
COPY . .

# Give execution permission to Gradle wrapper
RUN chmod +x gradlew

# Build the application
RUN ./gradlew clean build bootJar --no-daemon

# Stage 2: Run
FROM openjdk:21-jdk-slim

# Add a user and group for running the application
RUN addgroup --system spring && adduser --system --ingroup spring spring
USER spring:spring

# Copy the application JAR from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the application port
EXPOSE 9000 

# Define the entry point
ENTRYPOINT ["java", "-jar", "app.jar"]
