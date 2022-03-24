package mavenproject;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class DemoMavenVsCode {

    public static void main(String[] args) throws InterruptedException{
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver(); //launch the browser

        driver.get("http://demo.automationtesting.in");

        Thread.sleep(3000);

        driver.quit();

    }
}
