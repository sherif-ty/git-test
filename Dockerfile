FROM maven:3.8.6-openjdk-11-slim as builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files (pom.xml, src/)
COPY pom.xml /app/
COPY src /app/src

# Install dependencies and build the project
RUN mvn clean install -DskipTests

FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the compiled .jar file from the builder image
COPY --from=builder /app/target/java-selenium-project-1.0-SNAPSHOT.jar /app/java-selenium-project.jar

# Set the entry point to run the application
ENTRYPOINT ["java", "-jar", "java-selenium-project.jar"]
