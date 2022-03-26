import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

import com.aventstack.extentreports.*;
import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;


public class SeleniumTestNGDemo {

    @Test
    public void sampleTestMethod() throws InterruptedException {
        ExtentReports extent = new ExtentReports();
        ExtentSparkReporter spark = new ExtentSparkReporter("target/Spark.html");
        spark.config().setTheme(Theme.DARK);
        spark.config().setDocumentTitle("Test Report");
        extent.attachReporter(spark);


        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        driver.get("http://demo.automationtesting.in");
        driver.findElement(By.id("email")).sendKeys("abcd@gmail.com"); //enter a random email ID in the text box
        driver.findElement(By.id("enterimg")).click(); //click on go button
        Thread.sleep(3001);
        driver.quit();

        ExtentTest test = extent.createTest("Login test");
        test.pass("Login successful");
        test.info("Details entered");
        test.pass("Logged in");

        extent.flush(); //Unless you call this method, report will not have logs
    }
}
