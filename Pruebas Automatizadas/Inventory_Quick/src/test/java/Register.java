import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class Register {
    WebDriver chromeDriver;

    @Test
    public void Register(){

        System.setProperty("webdriver.chrome.driver","C:\\chromedriver\\chromedriver.exe");
        chromeDriver = new ChromeDriver();
        chromeDriver.get("http://20.119.35.194:8080/\n");
        System.out.println(chromeDriver.getTitle());
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtReg = chromeDriver.findElement(By.id("registrarse"));
        highLighterMethod(chromeDriver,txtReg);
        txtReg.click();

        //Imput Correo
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtCorreo = chromeDriver.findElement(By.id("Input_Email"));
        highLighterMethod(chromeDriver,txtCorreo);
        txtCorreo.sendKeys("juan.lancheros662@misena.edu.co");

        //Imput Contraseña
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtContra = chromeDriver.findElement(By.xpath("//*[@id=\"Input_Password\"]"));
        highLighterMethod(chromeDriver,txtContra);
        txtContra.sendKeys("Juan9810@");

        //Imput Confirmar COntraseña
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement txtContraConf = chromeDriver.findElement(By.id("Input_ConfirmPassword"));
        highLighterMethod(chromeDriver,txtContraConf);
        txtContraConf.sendKeys("Juan9810@");

        //Imput Registrarse
        chromeDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS) ;
        WebElement btnAceptar = chromeDriver.findElement(By.id("registerSubmit"));
        highLighterMethod(chromeDriver,btnAceptar);
        btnAceptar.click();

        //Confirmar Correo
        WebElement btnRegistrar = chromeDriver.findElement(By.id("confirm-link"));
        highLighterMethod(chromeDriver,btnRegistrar);
        btnRegistrar.click();

    }

    public void highLighterMethod(WebDriver driver, WebElement element){
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }
}
