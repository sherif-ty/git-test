# Use OpenJDK as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Copy the test directory (including Java source and JARs) into the container
COPY test /app/test

# Set the appropriate permissions on the files in /app/test
RUN chmod -R 755 /app/test

# Check if JAR files are copied correctly
RUN ls -l /app/test

# Compile Java test file with the necessary classpath to include the Selenium JARs
RUN javac -cp "/app/test/selenium-java-4.13.0.jar:/app/test/selenium-api-4.13.0.jar" /app/test/TestSelenium.java

# Command to run the test
CMD ["java", "-cp", "/app/test/selenium-java-4.13.0.jar:/app/test/selenium-api-4.13.0.jar:/app/test", "test.TestSelenium"]
