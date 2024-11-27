import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.MalformedURLException;
import java.net.URL;

public class TestSelenium {
    public static void main(String[] args) {
        try {
            // Set up RemoteWebDriver to connect to the Selenium Hub
            URL seleniumHubUrl = new URL("http://selenium-hub:4444/wd/hub");

            // Use ChromeOptions in Selenium 4
            ChromeOptions options = new ChromeOptions();
            WebDriver driver = new RemoteWebDriver(seleniumHubUrl, options);

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
