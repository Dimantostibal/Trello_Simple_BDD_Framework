package pages;

import com.codeborne.selenide.SelenideElement;
import org.openqa.selenium.By;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$x;

@Name(value = "Вход в Trello")
public class TrelloLoginPage extends WebPage {

    @Name("логин")
    private SelenideElement login = $x("//a[contains(@class, 'js-login')]");

    @Name("почта")
    private SelenideElement email = $x("//input[contains(@placeholder, 'Укажите адрес электронной почты')]");

    @Name("atlassian")
    private SelenideElement atlassian = $x("//input[contains(@value, 'Войти с помощью Atlassian')]");

    @Name("пароль")
    private SelenideElement pass2 = $x("//input[contains(@name, 'password')]");

    @Name("войти")
    private SelenideElement comeIn2 = $(By.id("login-submit"));
}
