=FROM gradle:7.6-jdk11 as builder

# Set the working directory
WORKDIR /app

# Copy Gradle wrapper files and build files
COPY gradlew /app/gradlew
COPY gradle /app/gradle
COPY build.gradle /app/build.gradle
COPY settings.gradle /app/settings.gradle
COPY src /app/src  # Ensure 'src' exists in your local directory

RUN chmod +x /app/gradlew

RUN ./gradlew clean build --no-daemon

FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the compiled build from the builder image
COPY --from=builder /app/build/libs/java-selenium-project-1.0-SNAPSHOT.jar /app/java-selenium-project.jar

# Set the entry point
ENTRYPOINT ["java", "-jar", "java-selenium-project.jar"]
