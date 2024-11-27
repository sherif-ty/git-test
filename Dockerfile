# Use OpenJDK (Debian-based) as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Copy the 'test' directory (including the Java source file and JARs) into the container
COPY test /app/test

# Compile the Java test file with updated classpath
RUN javac -cp ".:/app/test/selenium-java-4.13.0.jar:/app/test/selenium-api-4.13.0.jar" /app/test/TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:/app/test/selenium-java-4.13.0.jar:/app/test/selenium-api-4.13.0.jar", "test.TestSelenium"]
