package Subcategory;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class AddSubcategory {
    WebDriver chromeDriver;

    @Test
    public void Subcategory() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());

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

        //////////////////////////////ADD SUBCATEGORY/////////////////////////////////////

        //Button Nav Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonSubcategory = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[4]/a"));
        highLighterMethod(chromeDriver, ButtonSubcategory);
        ButtonSubcategory.click();
        Thread.sleep(1500);

        //Button Add Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonAddSubcategory = chromeDriver.findElement(By.xpath("/html/body/div/main/p/a"));
        highLighterMethod(chromeDriver, ButtonAddSubcategory);
        ButtonAddSubcategory.click();
        Thread.sleep(1500);

        //Input Name Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement inputName = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver, inputName);
        inputName.sendKeys("harold");
        Thread.sleep(1500);

        //Input Category
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Category = chromeDriver.findElement(By.id("CATEGORIA_CategoriaId"));
        highLighterMethod(chromeDriver, Category);
        Category.click();
        WebElement option = chromeDriver.findElement(By.xpath("//*[@id=\"CATEGORIA_CategoriaId\"]/option[1]"));
        option.click();
        Thread.sleep(1500);

        //Button Save
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonAdd = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[4]/input"));
        highLighterMethod(chromeDriver, ButtonAdd);
        ButtonAdd.click();
        Thread.sleep(1500);

        //button Logout.Logout
        WebElement logout = chromeDriver.findElement(By.id("logout"));
        highLighterMethod(chromeDriver,logout);
        logout.click();
    }

    public void highLighterMethod(WebDriver driver, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}