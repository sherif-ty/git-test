# Stage 1: Build the Maven project
FROM maven:3.8.6-openjdk-11-slim as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files (pom.xml and test directory)
COPY pom.xml /app/
COPY test /app/test/

# Install dependencies and build the project (skip tests for faster build)
RUN mvn clean install -DskipTests


# Copy the compiled .jar file from the builder image to the new image
COPY --from=builder /app/target/java-selenium-project-1.0-SNAPSHOT.jar /app/java-selenium-project.jar

# Set the entry point to run the application
ENTRYPOINT ["java", "-jar", "java-selenium-project.jar"]
