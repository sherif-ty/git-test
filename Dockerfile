# Use OpenJDK as the base image
FROM openjdk:11

# Set the working directory
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy pom.xml and selenium JARs
COPY pom.xml /app/pom.xml
COPY selenium-java-4.13.0.jar /app/selenium-java-4.13.0.jar
COPY selenium-api-4.13.0.jar /app/selenium-api-4.13.0.jar

# Copy the source code
COPY test /app/test

# Run Maven to install dependencies and build the project
RUN mvn clean install

# Command to run the test
CMD ["java", "-cp", ".:/app/selenium-java-4.13.0.jar:/app/selenium-api-4.13.0.jar", "test.TestSelenium"]
