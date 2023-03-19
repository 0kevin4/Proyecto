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

public class AddPrice {
    WebDriver chromeDriver;

    @Before
    public void abrirDriver() {  }

    @Test
    public void preci() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver","C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().window().maximize();

        //Button Nav Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtAcc = chromeDriver.findElement(By.id("Acceder"));
        highLighterMethod(chromeDriver,txtAcc);
        txtAcc.click();
        Thread.sleep(1500);

        //input email
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Email = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver,Email);
        Email.sendKeys("kevin.moreno249@misena.edu.co");
        Thread.sleep(1500);

        //input Password
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Password = chromeDriver.findElement(By.id("Input_Password"));
        highLighterMethod(chromeDriver,Password);
        Password.sendKeys("Kevin2304@");
        Thread.sleep(1500);

        //Button Login
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement ButtonLogin = chromeDriver.findElement(By.id("login-submit"));
        highLighterMethod(chromeDriver,ButtonLogin);
        ButtonLogin.click();
        Thread.sleep(1500);

        //////////////////////////////ADD PRICE/////////////////////////////////////

        //Button Nav AddPrice
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Price = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[2]/a"));
        highLighterMethod(chromeDriver,Price);
        Price.click();
        Thread.sleep(1500);

        //Button Add AddPrice
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement AddPrice = chromeDriver.findElement(By.xpath("/html/body/div/main/p/a"));
        highLighterMethod(chromeDriver,AddPrice);
        AddPrice.click();
        Thread.sleep(1500);

        //input Price buys
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement buys = chromeDriver.findElement(By.id("PrecioCompra"));
        highLighterMethod(chromeDriver,buys);
        buys.sendKeys("40000");
        Thread.sleep(1500);

        //input Discount
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Discount = chromeDriver.findElement(By.id("Descuento"));
        highLighterMethod(chromeDriver,Discount);
        Discount.sendKeys("10000");
        Thread.sleep(1500);

        //initial sale Price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement initial = chromeDriver.findElement(By.id("PrecioVentaInicial"));
        highLighterMethod(chromeDriver,initial);
        initial.sendKeys("30000");
        Thread.sleep(1500);

        //final sale Price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Fin = chromeDriver.findElement(By.id("PrecioVentaFinal"));
        highLighterMethod(chromeDriver,Fin);
        Fin.sendKeys("25000");
        Thread.sleep(1500);

        //input product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement products = chromeDriver.findElement(By.id("PRODUCTO_ProductoId"));
        highLighterMethod(chromeDriver,products);
        products.click();
        WebElement OptionS = chromeDriver.findElement((By.xpath("//*[@id=\"PRODUCTO_ProductoId\"]/option[3]")));
        OptionS.click();
        Thread.sleep(1500);

        //input Add
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Add = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[7]/input"));
        highLighterMethod(chromeDriver,Add);
        MovingWindow(chromeDriver);
        Thread.sleep(1500);
        Add.click();
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
        jse.executeScript("scroll(0, 250)");
    }

    public void highLighterMethod(WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
