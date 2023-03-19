package Brand;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class EditBrand {

    WebDriver chromeDriver;

    @Before
    public void abrirDriver() {  }

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

        //////////////////////////////EDIT BRAND/////////////////////////////////////

        //Button Nav Brand
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Brand = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[5]/a"));
        highLighterMethod(chromeDriver,Brand);
        Brand.click();
        Thread.sleep(1500);

        //Button Number
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Number = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas_paginate\"]/ul/li[4]/a"));
        highLighterMethod(chromeDriver,Number);
        MovingWindow(chromeDriver);
        Thread.sleep(1500);
        Number.click();
        Thread.sleep(1500);

        //Button Edit
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Edit = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[3]/td[4]/a[1]"));
        highLighterMethod(chromeDriver,Edit);
        Edit.click();
        Thread.sleep(1500);

        //Button Name
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Name = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver,Name);
        Name.clear();
        Name.sendKeys("Postobon");
        Thread.sleep(1500);

        //Button Status
        chromeDriver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
        WebElement Status = chromeDriver.findElement(By.xpath("//*[@id=\"Estado\"]"));
        highLighterMethod(chromeDriver, Status);
        Status.click();
        Thread.sleep(1500);

        //Button Save
        chromeDriver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
        WebElement Save = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[3]/input"));
        highLighterMethod(chromeDriver, Save);
        Save.click();
        Thread.sleep(1500);

        //button Logout.Logout
        WebElement logout = chromeDriver.findElement(By.id("logout"));
        highLighterMethod(chromeDriver,logout);
        logout.click();
        Thread.sleep(1500);

    }

    @After
    public void cerrarDriver() {

        chromeDriver.quit();
    }

    public void highLighterMethod (WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
    public void MovingWindow(WebDriver chromeDriver){
        JavascriptExecutor jse = (JavascriptExecutor)chromeDriver;
        jse.executeScript("scroll(0, 3000)");
    }
}
