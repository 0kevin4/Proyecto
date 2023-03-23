package Prices;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class DeletePrice {

    WebDriver chromeDriver;
    @Before
    public void abrirDriver() {  }

    @Test
    public void Delete() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().window().maximize();

        //Button Nav Login
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

        //Button Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonLogin = chromeDriver.findElement(By.id("login-submit"));
        highLighterMethod(chromeDriver, ButtonLogin);
        ButtonLogin.click();
        Thread.sleep(1500);

        //////////////////////////////DELETE PRICE/////////////////////////////////////7

        //Button  price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement preci = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[2]/a"));
        highLighterMethod(chromeDriver,preci);
        preci.click();
        Thread.sleep(1500);

        //pagina
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement pag = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas_paginate\"]/ul/li[8]/a"));
        highLighterMethod(chromeDriver,pag);
        MovingWindow(chromeDriver);
        Thread.sleep(1500);
        pag.click();
        Thread.sleep(1500);

        //Button Delete
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Button = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[5]/td[8]/a[3]"));
        highLighterMethod(chromeDriver,Button);
        MovingWindow(chromeDriver);
        Thread.sleep(1500);
        Button.click();
        Thread.sleep(1500);

        //DELETE
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Delete = chromeDriver.findElement(By.xpath("/html/body/div/main/div/form/input[2]"));
        highLighterMethod(chromeDriver,Delete);
        Delete.click();
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

    public void MovingWindow(WebDriver chromeDriver){
        JavascriptExecutor jse = (JavascriptExecutor)chromeDriver;
        jse.executeScript("scroll(0, 3000)");
    }

    public void highLighterMethod(WebDriver driver, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}