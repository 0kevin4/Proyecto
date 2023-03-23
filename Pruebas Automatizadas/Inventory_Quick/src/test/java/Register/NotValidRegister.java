package Register;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class NotValidRegister {

    WebDriver chromeDriver;

    @Before
    public void abrirDriver() {  }

    @Test
    public void Notregister() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver","C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().window().maximize();

        //Button Nav Register.Register
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Register = chromeDriver.findElement(By.id("registrarse"));
        highLighterMethod(chromeDriver,Register);
        Register.click();
        Thread.sleep(1500);

        //Input Email
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Email = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver,Email);
        Email.sendKeys("juan.lancheros662@misena.edu.co");
        Thread.sleep(1500);

        //Input Password
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Password = chromeDriver.findElement(By.xpath("//*[@id=\"Input_Password\"]"));
        highLighterMethod(chromeDriver,Password);
        Password.sendKeys("Juan98");
        Thread.sleep(1500);

        //Input Confirm Password
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement ConfirmP = chromeDriver.findElement(By.id("Input_ConfirmPassword"));
        highLighterMethod(chromeDriver,ConfirmP);
        ConfirmP.sendKeys("Juan98");
        Thread.sleep(1500);

        //Input Register.Register
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Accept = chromeDriver.findElement(By.id("registerSubmit"));
        highLighterMethod(chromeDriver,Accept);
        Accept.click();
        Thread.sleep(1500);

    }

    @After
    public void cerrarDriver() {

        chromeDriver.quit();
    }

    public void highLighterMethod(WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }

}
