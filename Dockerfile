# Use OpenJDK as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Copy test files and Selenium JARs into the container
COPY test /app/test

# Set the appropriate permissions on the files in /app/test
RUN chmod -R 755 /app/test

# Verify the files are copied
RUN ls -l /app/test

# Compile the Java test file with the correct classpath including the Selenium JARs
RUN javac -cp ".:/app/test/selenium-java-4.13.0.jar:/app/test/selenium-api-4.13.0.jar" /app/test/TestSelenium.java

# Command to run the test, ensuring classpath is set correctly
CMD ["java", "-cp", ".:/app/test/selenium-java-4.13.0.jar:/app/test/selenium-api-4.13.0.jar", "test.TestSelenium"]
