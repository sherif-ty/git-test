import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.MalformedURLException;
import java.net.URL;

public class TestSelenium {
    public static void main(String[] args) {
        try {
            // Set up RemoteWebDriver to connect to the Selenium Hub
            URL seleniumHubUrl = new URL("http://selenium-hub:4444/wd/hub");
            DesiredCapabilities capabilities = DesiredCapabilities.chrome();
            WebDriver driver = new RemoteWebDriver(seleniumHubUrl, capabilities);

            // Run the test
            driver.get("https://www.google.com");
            System.out.println("Page title is: " + driver.getTitle());

            // Quit the browser
            driver.quit();
        } catch (MalformedURLException e) {
            System.out.println("Error connecting to Selenium Hub: " + e.getMessage());
        }
    }
}

