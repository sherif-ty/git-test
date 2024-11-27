# Use OpenJDK (Debian-based) as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Install necessary tools
#RUN apt-get update && apt-get install -y curl bash

# Download Selenium Java JARs
#RUN curl -O https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-java/4.13.0/selenium-java-4.13.0.jar
#RUN curl -O https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-api/4.13.0/selenium-api-4.13.0.jar

# Copy test file
COPY test .

# Compile Java test file
RUN javac -cp ".:test/selenium-java-4.13.0.jar:selenium-api-4.13.0.jar" test/TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:test/selenium-java-4.13.0.jar:selenium-api-4.13.0.jar", "test/TestSelenium"]
