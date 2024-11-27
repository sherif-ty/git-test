# Use OpenJDK (Debian-based) as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Install curl and other necessary tools
RUN apt-get update && apt-get install -y curl

# Download the necessary Selenium JARs using curl
RUN curl -o /app/selenium-java-4.13.0.jar https://repo.maven.apache.org/maven2/org/seleniumhq/selenium/selenium-java/4.13.0/selenium-java-4.13.0.jar
RUN curl -o /app/selenium-api-4.13.0.jar https://repo.maven.apache.org/maven2/org/seleniumhq/selenium/selenium-api/4.13.0/selenium-api-4.13.0.jar

# Copy the test files into the container
COPY test /app/test

# Compile Java test files
RUN javac -cp ".:/app/selenium-java-4.13.0.jar:/app/selenium-api-4.13.0.jar" /app/test/TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:/app/selenium-java-4.13.0.jar:/app/selenium-api-4.13.0.jar", "test.TestSelenium"]
