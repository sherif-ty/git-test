# Use OpenJDK as the base image
FROM openjdk:11-slim

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && apt-get install -y wget unzip

# Download Selenium Java JARs
RUN wget -q https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-java/4.13.0/selenium-java-4.13.0.jar
RUN wget -q https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-api/4.13.0/selenium-api-4.13.0.jar

# Download and configure ChromeDriver
RUN wget -q https://chromedriver.storage.googleapis.com/116.0.5845.96/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip && mv chromedriver /usr/bin/chromedriver && chmod +x /usr/bin/chromedriver && rm chromedriver_linux64.zip

# Copy test file
COPY TestSelenium.java .

# Compile Java test file
RUN javac -cp ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar" TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar", "TestSelenium"]

