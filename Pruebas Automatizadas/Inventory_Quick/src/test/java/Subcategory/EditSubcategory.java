package Subcategory;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.experimental.theories.Theories;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class EditSubcategory {
    WebDriver chromeDriver;

    @Before
    public void abrirDriver() {  }

    @Test
    public void EditCategory() throws InterruptedException {

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

        //////////////////////////////EDIT SUBCATEGORY/////////////////////////////////////

        //Button Nav Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Subcategory = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[4]/a"));
        highLighterMethod(chromeDriver,Subcategory);
        Subcategory.click();
        Thread.sleep(1500);

        //Button Edit Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement EditSubcategory = chromeDriver.findElement(By.xpath("//*[@id=\"Tablas\"]/tbody/tr[1]/td[5]/a[1]"));
        highLighterMethod(chromeDriver,EditSubcategory);
        EditSubcategory.click();
        Thread.sleep(1500);

        //input Name
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Name = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver,Name);
        Name.clear();
        Name.sendKeys("EMOJIS");
        Thread.sleep(1500);

        //input Category
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Category = chromeDriver.findElement(By.id("CATEGORIA_CategoriaId"));
        highLighterMethod(chromeDriver,Category);
        Category.click();
        Thread.sleep(1500);
        WebElement Option = chromeDriver.findElement(By.xpath("//*[@id=\"CATEGORIA_CategoriaId\"]/option[3]"));
        Option.click();
        Thread.sleep(1500);

        //Button Status
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Status = chromeDriver.findElement(By.xpath("//*[@id=\"Estado\"]"));
        highLighterMethod(chromeDriver,Status);
        Status.click();
        Thread.sleep(1500);

        //Button Save
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement Add = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[4]/input"));
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

    public void highLighterMethod (WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
