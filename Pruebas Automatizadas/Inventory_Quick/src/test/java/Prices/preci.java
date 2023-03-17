package Prices;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class preci {
    WebDriver chromeDriver;

    @Test
    public void preci() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver","C:\\WebDriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        //Button Nav Login
        WebElement txtAcc = chromeDriver.findElement(By.id("Acceder"));
        highLighterMethod(chromeDriver,txtAcc);
        txtAcc.click();

        //input email
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Email = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver,Email);
        Email.sendKeys("kevin.moreno249@misena.edu.co");

        //input Password
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Password = chromeDriver.findElement(By.id("Input_Password"));
        highLighterMethod(chromeDriver,Password);
        Password.sendKeys("Kevin2304@");

        //Button Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement ButtonLogin = chromeDriver.findElement(By.id("login-submit"));
        highLighterMethod(chromeDriver,ButtonLogin);
        ButtonLogin.click();

        //////////////////////////////PRICE/////////////////////////////////////

        //Button Nav preci
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement preci = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[2]/a"));
        highLighterMethod(chromeDriver,preci);
        preci.click();

        //Button Add preci
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Addpreci = chromeDriver.findElement(By.xpath("/html/body/div/main/p/a"));
        highLighterMethod(chromeDriver,Addpreci);
        Addpreci.click();

        //input Date Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Date = chromeDriver.findElement(By.id("FechaIngreso"));
        highLighterMethod(chromeDriver,Date);
        Date.sendKeys("25/03/2023","10:25 P.M");





        //input preci buys
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement buys = chromeDriver.findElement(By.id("PrecioCompra"));
        highLighterMethod(chromeDriver,buys);
        buys.sendKeys("40000");

        //input Discount
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Discount = chromeDriver.findElement(By.id("Descuento"));
        highLighterMethod(chromeDriver,Discount);
        Discount.sendKeys("10000");



        //initial sale price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement initial = chromeDriver.findElement(By.id("PrecioVentaInicial"));
        highLighterMethod(chromeDriver,initial);
        initial.sendKeys("30000");

        //final sale price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement finall = chromeDriver.findElement(By.id("PrecioVentaFinal"));
        highLighterMethod(chromeDriver,finall);
        finall.sendKeys("25000");


        //input product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement products = chromeDriver.findElement(By.id("PRODUCTO_ProductoId"));
        highLighterMethod(chromeDriver,products);
        products.click();
        WebElement OptionS = chromeDriver.findElement((By.xpath("//*[@id=\"PRODUCTO_ProductoId\"]/option[3]")));
        OptionS.click();

        //input Agregar
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Agregar = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[7]/input"));
        highLighterMethod(chromeDriver,Agregar);
        Agregar.click();


    }

    public void MovingWindow(WebDriver chromeDriver){
        JavascriptExecutor jse = (JavascriptExecutor)chromeDriver;
        jse.executeScript("scroll(0, 250)");
    }


    public void highLighterMethod(WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
