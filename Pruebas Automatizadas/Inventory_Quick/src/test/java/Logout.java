import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class Logout {
    WebDriver chromeDriver;

    @Test
    public void Logout(){

        System.setProperty("webdriver.chrome.driver","C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        //Boton Acceder
        WebElement txtReg = chromeDriver.findElement(By.id("Acceder"));
        highLighterMethod(chromeDriver,txtReg);
        txtReg.click();

        //imput email
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtCorreo = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver,txtCorreo);
        txtCorreo.sendKeys("juan.lancheros662@misena.edu.co");

        //imput contraseña
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtContra = chromeDriver.findElement(By.id("Input_Password"));
        highLighterMethod(chromeDriver,txtContra);
        txtContra.sendKeys("Juan9810@");

        //boton registrar
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement btnIngresar = chromeDriver.findElement(By.id("login-submit"));
        highLighterMethod(chromeDriver,btnIngresar);
        btnIngresar.click();

        //Boton cerrar sesion
        WebElement logout = chromeDriver.findElement(By.id("logout"));
        highLighterMethod(chromeDriver,logout);
        logout.click();


    }

    public void highLighterMethod(WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
