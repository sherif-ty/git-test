# Use OpenJDK (Debian-based) as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Copy the selenium JAR files into the container
COPY selenium-java-4.13.0.jar /app/selenium-java-4.13.0.jar
COPY selenium-api-4.13.0.jar /app/selenium-api-4.13.0.jar

# Copy the test files into the container
COPY test /app/test

# Compile Java test files
RUN javac -cp ".:/app/selenium-java-4.13.0.jar:/app/selenium-api-4.13.0.jar" /app/test/TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:/app/selenium-java-4.13.0.jar:/app/selenium-api-4.13.0.jar", "test.TestSelenium"]
