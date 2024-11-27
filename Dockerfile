# Use OpenJDK as the base image
FROM openjdk:11-jdk-alpine

# Set working directory
WORKDIR /app

# Install necessary tools
#RUN  apt-get update && apt-get install -y curl
 

# Download Selenium Java JARs
RUN curl https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-java/4.13.0/selenium-java-4.13.0.jar
RUN curl https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-api/4.13.0/selenium-api-4.13.0.jar

# Copy test file
COPY TestSelenium.java .

# Compile Java test file
RUN javac -cp ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar" TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar", "TestSelenium"]

