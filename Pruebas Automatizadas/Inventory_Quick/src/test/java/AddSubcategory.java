import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class AddSubcategory {
    WebDriver chromeDriver;

    @Test
    public void Subcategory() {

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

        //////////////////////////////ADD SUBCATEGORY/////////////////////////////////////

        //Button Nav Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonSubcategory = chromeDriver.findElement(By.xpath("/html/body/header/nav/div/div/ul[1]/li[4]/a"));
        highLighterMethod(chromeDriver, ButtonSubcategory);
        ButtonSubcategory.click();

        //Button Add Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonAddSubcategory = chromeDriver.findElement(By.xpath("/html/body/div/main/p/a"));
        highLighterMethod(chromeDriver, ButtonAddSubcategory);
        ButtonAddSubcategory.click();

        //Input Name Subcategory
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement inputnombre = chromeDriver.findElement(By.id("Nombre"));
        highLighterMethod(chromeDriver, inputnombre);
        inputnombre.sendKeys("harold");

        //Input Category
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement inputcategoria = chromeDriver.findElement(By.id("CATEGORIA_CategoriaId"));
        highLighterMethod(chromeDriver, inputcategoria);
        inputcategoria.click();
        WebElement option = chromeDriver.findElement(By.xpath("//*[@id=\"CATEGORIA_CategoriaId\"]/option[1]"));
        option.click();

        //Button Save
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        WebElement ButtonAdd = chromeDriver.findElement(By.xpath("/html/body/div/main/div/div/form/div[4]/input"));
        highLighterMethod(chromeDriver, ButtonAdd);
        ButtonAdd.click();

    }

    public void highLighterMethod(WebDriver driver, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}