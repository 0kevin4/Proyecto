package Brand;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class DeleteBrand {

    WebDriver chromeDriver;

    @Test
    public void EditBrand() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().window().maximize();

        //Button Nav Login.Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement txtAcc = chromeDriver.findElement(By.id("Acceder"));
        highLighterMethod(chromeDriver, txtAcc);
        txtAcc.click();
        Thread.sleep(1500);

        //input email
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Email = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver, Email);
        Email.sendKeys("kevin.moreno249@misena.edu.co");
        Thread.sleep(1500);

        //input Password
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Password = chromeDriver.findElement(By.id("Input_Password"));
        highLighterMethod(chromeDriver, Password);
        Password.sendKeys("Kevin2304@");
        Thread.sleep(1500);

        //Button Login.Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonLogin = chromeDriver.findElement(By.id("login-submit"));
        highLighterMethod(chromeDriver, ButtonLogin);
        ButtonLogin.click();
        Thread.sleep(1500);

        //////////////////////////////DELETE BRAND/////////////////////////////////////

        //Button Nav Brand
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Brand = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[5]/a"));
        highLighterMethod(chromeDriver, Brand);
        Brand.click();
        Thread.sleep(1500);

        //Button Delete Brand
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement BDelete = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[1]/td[4]/a[3]"));
        highLighterMethod(chromeDriver, BDelete);
        BDelete.click();
        Thread.sleep(1500);

        //Button Delete Brand
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Delete = chromeDriver.findElement(By.xpath("/html/body/div/main/div/form/input[2]"));
        highLighterMethod(chromeDriver, Delete);
        Delete.click();

    }

    public void highLighterMethod (WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }

}

