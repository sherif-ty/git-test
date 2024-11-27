# Use an official Gradle image as the base image
FROM gradle:7.6-jdk11 as builder

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper and build files
COPY gradlew /app/gradlew
COPY gradle /app/gradle
COPY build.gradle /app/build.gradle
COPY settings.gradle /app/settings.gradle
COPY src /app/src

# Give execution permissions to gradlew
RUN chmod +x /app/gradlew

# Run Gradle build
RUN ./gradlew clean build --no-daemon

# Use a smaller image to run the application
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the compiled build from the builder image
COPY --from=builder /app/build/libs/java-selenium-project-1.0-SNAPSHOT.jar /app/java-selenium-project.jar

# Set the entry point
ENTRYPOINT ["java", "-jar", "java-selenium-project.jar"]
