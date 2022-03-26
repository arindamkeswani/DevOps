import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class SeleniumTestNGDemo {

    @Test
    public void sampleTestMethod() throws InterruptedException {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        driver.get("http://demo.automationtesting.in");
        driver.findElement(By.id("email")).sendKeys("abcd@gmail.com"); //enter a random email ID in the text box
        driver.findElement(By.id("enterimg")).click(); //click on go button
        Thread.sleep(3001);
        driver.quit();
    }
}
