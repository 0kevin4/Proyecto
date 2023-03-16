import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;
public class EditProduct {

    WebDriver chromeDriver;

    @Test
    public void Edit() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        //Button Nav Login
        WebElement txtAcc = chromeDriver.findElement(By.id("Acceder"));
        highLighterMethod(chromeDriver, txtAcc);
        txtAcc.click();

        //input email
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Email = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver, Email);
        Email.sendKeys("kevin.moreno249@misena.edu.co");

        //input Password
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Password = chromeDriver.findElement(By.id("Input_Password"));
        highLighterMethod(chromeDriver, Password);
        Password.sendKeys("Kevin2304@");

        //Button Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonLogin = chromeDriver.findElement(By.id("login-submit"));
        highLighterMethod(chromeDriver, ButtonLogin);
        ButtonLogin.click();

        //////////////////////////////EDIT PRODUCT/////////////////////////////////////7

        //Button Nav Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Product = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[3]/a"));
        highLighterMethod(chromeDriver, Product);
        Product.click();

        //Button Number
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Number = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas_paginate\"]/ul/li[8]/a"));
        highLighterMethod(chromeDriver, Number);
        MovingWindow(chromeDriver);
        Thread.sleep(2000);
        Number.click();

        //Button Edit Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement EditProduct = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[6]/td[10]/a[1]"));
        highLighterMethod(chromeDriver, EditProduct);
        EditProduct.click();

        //Input Name Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement NameP = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver, NameP);
        NameP.clear();
        NameP.sendKeys("loco");

        //Input Save
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Save = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[9]/input"));
        highLighterMethod(chromeDriver, Save);
        MovingWindow(chromeDriver);
        Thread.sleep(2000);
        Save.click();

    }

    public void MovingWindow(WebDriver chromeDriver){
        JavascriptExecutor jse = (JavascriptExecutor)chromeDriver;
        jse.executeScript("scroll(0, 3000)");
    }

    public void highLighterMethod(WebDriver driver, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
