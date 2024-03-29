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

public class EditPrice {

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

        //////////////////////////////EDIT PRICE/////////////////////////////////////7

        //Button  price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement preci = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[2]/a"));
        highLighterMethod(chromeDriver,preci);
        preci.click();
        Thread.sleep(1500);

        //Edit Price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Edit = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[1]/td[8]/a[1]"));
        highLighterMethod(chromeDriver,Edit);
        Edit.click();
        Thread.sleep(1500);

        //Edit price buys
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement buys = chromeDriver.findElement(By.id("PrecioCompra"));
        highLighterMethod(chromeDriver,buys);
        buys.clear();
        buys.sendKeys("80000");
        Thread.sleep(1500);

        //Edit Discount
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Discount = chromeDriver.findElement(By.id("Descuento"));
        highLighterMethod(chromeDriver,Discount);
        Discount.clear();
        Discount.sendKeys("20000");
        Thread.sleep(1500);

        //Edit initial sale price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement initial = chromeDriver.findElement(By.id("PrecioVentaInicial"));
        highLighterMethod(chromeDriver,initial);
        initial.clear();
        initial.sendKeys("50000");
        MovingWindow(chromeDriver);
        Thread.sleep(1500);

        //Edit final sale price
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement finall = chromeDriver.findElement(By.id("PrecioVentaFinal"));
        highLighterMethod(chromeDriver,finall);
        finall.clear();
        finall.sendKeys("35000");
        Thread.sleep(1500);

        //Edit product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement products = chromeDriver.findElement(By.id("PRODUCTO_ProductoId"));
        highLighterMethod(chromeDriver,products);
        Thread.sleep(1500);
        products.click();
        WebElement OptionS = chromeDriver.findElement((By.xpath("//*[@id=\"PRODUCTO_ProductoId\"]/option[17]")));

        //Save
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Save = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[7]/input"));
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

    public void MovingWindow(WebDriver chromeDriver){
        JavascriptExecutor jse = (JavascriptExecutor)chromeDriver;
        jse.executeScript("scroll(0, 3000)");
    }

    public void highLighterMethod(WebDriver driver, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }


}
