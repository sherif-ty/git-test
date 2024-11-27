# Use OpenJDK with Alpine as the base image
FROM openjdk:11-jdk-alpine

# Set working directory
WORKDIR /app

# Ensure DNS resolution works
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Install necessary tools for downloading files and compiling Java
RUN apk update && apk add --no-cache curl bash

# Download Selenium Java JARs
RUN curl -O https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-java/4.13.0/selenium-java-4.13.0.jar
RUN curl -O https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-api/4.13.0/selenium-api-4.13.0.jar

# Copy test file
COPY TestSelenium.java .

# Compile Java test file
RUN javac -cp ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar" TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar", "TestSelenium"]
