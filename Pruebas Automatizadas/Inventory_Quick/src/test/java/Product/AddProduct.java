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

public class AddProduct {
    WebDriver chromeDriver;

    @Before
    public void abrirDriver() {  }

    @Test
    public void Product() throws InterruptedException {

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

        //////////////////////////////ADD PRODUCT/////////////////////////////////////

        //Button Nav Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Product = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[3]/a"));
        highLighterMethod(chromeDriver,Product);
        Product.click();
        Thread.sleep(1500);

        //Button Add Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement AddProduct = chromeDriver.findElement(By.xpath("/html/body/div/main/p/a"));
        highLighterMethod(chromeDriver,AddProduct);
        AddProduct.click();
        Thread.sleep(1500);

        //input Name Product
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Name = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver,Name);
        Name.sendKeys("Kevin");
        Thread.sleep(1500);

        //input Description
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Description = chromeDriver.findElement(By.id("Descripcion"));
        highLighterMethod(chromeDriver,Description);
        Description.sendKeys("Kevin");
        Thread.sleep(1500);

        //input subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement subcategory = chromeDriver.findElement(By.id("SUBCATEGORIA_SubcategoriaId"));
        highLighterMethod(chromeDriver,subcategory);
        subcategory.click();
        WebElement OptionS = chromeDriver.findElement((By.xpath("//*[@id=\"SUBCATEGORIA_SubcategoriaId\"]/option[3]")));
        OptionS.click();
        Thread.sleep(1500);

        //input brand
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement brand = chromeDriver.findElement(By.id("MARCA_MarcaId"));
        highLighterMethod(chromeDriver,brand);
        brand.click();
        WebElement OptionM = chromeDriver.findElement((By.xpath("//*[@id=\"MARCA_MarcaId\"]/option[3]")));
        OptionM.click();
        Thread.sleep(1500);

        //input quantity
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement quantity = chromeDriver.findElement(By.id("Cantidad"));
        highLighterMethod(chromeDriver,quantity);
        quantity.sendKeys("150");
        Thread.sleep(1500);

        //input StockMax
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement StockMax = chromeDriver.findElement(By.id("stockMaximo"));
        highLighterMethod(chromeDriver,StockMax);
        StockMax.sendKeys("250");
        Thread.sleep(1500);

        //input StockMim
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement StockMim = chromeDriver.findElement(By.id("stockMinimo"));
        highLighterMethod(chromeDriver,StockMim);
        StockMim.sendKeys("50");
        Thread.sleep(1500);

        //Button Status
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Status = chromeDriver.findElement(By.xpath("//*[@id=\"Estado\"]"));
        highLighterMethod(chromeDriver,Status);
        MovingWindow(chromeDriver);
        Thread.sleep(2000);
        Status.click();
        Thread.sleep(1500);

        //Button Add
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Add = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[9]/input"));
        highLighterMethod(chromeDriver,Add);
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
