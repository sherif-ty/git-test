# Use the official Maven image with OpenJDK 11 as the base image
FROM maven:3.8.6-openjdk-11-slim

# Set the working directory
WORKDIR /app

# Copy the pom.xml and the selenium JAR files
COPY pom.xml /app/pom.xml
COPY selenium-java-4.13.0.jar /app/selenium-java-4.13.0.jar
COPY selenium-api-4.13.0.jar /app/selenium-api-4.13.0.jar

# Copy the source code
COPY test /app/test

# Run Maven to install dependencies and build the project
RUN mvn clean install

# Command to run the test
CMD ["java", "-cp", ".:/app/selenium-java-4.13.0.jar:/app/selenium-api-4.13.0.jar", "test.TestSelenium"]
