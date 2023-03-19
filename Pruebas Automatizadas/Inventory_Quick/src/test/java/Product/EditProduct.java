package Product;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;
public class EditProduct {

    WebDriver chromeDriver;

    @Before
    public void abrirDriver() {  }

    @Test
    public void Edit() throws InterruptedException {

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

        //////////////////////////////EDIT PRODUCT/////////////////////////////////////7

        //Button Nav Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Product = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[3]/a"));
        highLighterMethod(chromeDriver, Product);
        Product.click();
        Thread.sleep(1500);

        //Button Number
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Number = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas_paginate\"]/ul/li[8]/a"));
        highLighterMethod(chromeDriver, Number);
        MovingWindow(chromeDriver);
        Thread.sleep(2000);
        Number.click();
        Thread.sleep(1500);

        //Button Edit Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement EditProduct = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[6]/td[10]/a[1]"));
        highLighterMethod(chromeDriver, EditProduct);
        EditProduct.click();
        Thread.sleep(1500);

        //Input Name Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement NameP = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver, NameP);
        NameP.clear();
        NameP.sendKeys("Jose");
        Thread.sleep(1500);


        //input subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement subcategory = chromeDriver.findElement(By.id("SUBCATEGORIA_SubcategoriaId"));
        highLighterMethod(chromeDriver,subcategory);
        subcategory.click();
        WebElement OptionS = chromeDriver.findElement((By.xpath("//*[@id=\"SUBCATEGORIA_SubcategoriaId\"]/option[5]")));
        OptionS.click();
        Thread.sleep(1500);

        //input brand
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement brand = chromeDriver.findElement(By.id("MARCA_MarcaId"));
        highLighterMethod(chromeDriver,brand);
        brand.click();
        WebElement OptionM = chromeDriver.findElement((By.xpath("//*[@id=\"MARCA_MarcaId\"]/option[6]")));
        OptionM.click();
        Thread.sleep(1500);
        MovingWindow(chromeDriver);



        //input StockMax
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement StockMax = chromeDriver.findElement(By.id("stockMaximo"));
        highLighterMethod(chromeDriver,StockMax);
        StockMax.clear();
        Thread.sleep(1500);
        StockMax.sendKeys("250");
        Thread.sleep(1500);

        //input StockMim
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement StockMim = chromeDriver.findElement(By.id("stockMinimo"));
        highLighterMethod(chromeDriver,StockMim);
        StockMim.clear();
        StockMim.sendKeys("50");
        Thread.sleep(1500);

        //Input Save
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement Save = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[9]/input"));
        highLighterMethod(chromeDriver, Save);
        MovingWindow(chromeDriver);
        Thread.sleep(2000);
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

    public void MovingWindow(WebDriver chromeDriver){
        JavascriptExecutor jse = (JavascriptExecutor)chromeDriver;
        jse.executeScript("scroll(0, 3000)");
    }

    public void highLighterMethod(WebDriver driver, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
