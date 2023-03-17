package Prices;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class Editprice {

    WebDriver chromeDriver;

    @Test
    public void Edit() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "C:\\WebDriver\\chromedriver.exe");
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

        //////////////////////////////EDIT PRICE/////////////////////////////////////7

        //Button  price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement preci = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[2]/a"));
        highLighterMethod(chromeDriver,preci);
        preci.click();

        //Edit Price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Edit = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[1]/td[8]/a[1]"));
        highLighterMethod(chromeDriver,Edit);
        Edit.click();



        //Button price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Date = chromeDriver.findElement(By.id("FechaIngreso"));
        highLighterMethod(chromeDriver,Date);
        Date.sendKeys("26/03/2023");


        //Edit price buys
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement buys = chromeDriver.findElement(By.id("PrecioCompra"));
        highLighterMethod(chromeDriver,buys);
        buys.clear();
        buys.sendKeys("80000");



        //Edit Discount
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Discount = chromeDriver.findElement(By.id("Descuento"));
        highLighterMethod(chromeDriver,Discount);
        Discount.clear();
        Discount.sendKeys("20000");



        //Edit initial sale price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement initial = chromeDriver.findElement(By.id("PrecioVentaInicial"));
        highLighterMethod(chromeDriver,initial);
        initial.clear();
        initial.sendKeys("50000");

        //Edit final sale price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement finall = chromeDriver.findElement(By.id("PrecioVentaFinal"));
        highLighterMethod(chromeDriver,finall);
        finall.clear();
        finall.sendKeys("35000");


        //Edit product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement products = chromeDriver.findElement(By.id("PRODUCTO_ProductoId"));
        highLighterMethod(chromeDriver,products);
        products.click();
        WebElement OptionS = chromeDriver.findElement((By.xpath("//*[@id=\"PRODUCTO_ProductoId\"]/option[17]")));


        //Guardar
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Guardar = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[7]/input"));
        highLighterMethod(chromeDriver,Guardar);
        MovingWindow(chromeDriver);
        Thread.sleep(1500);
        Guardar.click();



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
