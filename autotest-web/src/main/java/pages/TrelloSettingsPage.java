package pages;

import com.codeborne.selenide.SelenideElement;
import org.openqa.selenium.By;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$x;

@Name(value = "страница настроек")
public class TrelloSettingsPage extends WebPage {

    @Name("изменить информацию")
    private SelenideElement change = $x("//div[contains(@class, 'js-current-details')]/div/button");

    @Name("название")
    private SelenideElement name = $(By.id("displayName"));

    @Name("список типов")
    private SelenideElement typeOf = $x("//div[@class=' css-1kbu7vo']");

    @Name("образование")
    private SelenideElement education = $x("//li[text()='Образование']");

    @Name("сохранить")
    private SelenideElement save = $x("//button[text()='Сохранить']");

    @Name("доска KanbanTool")
    private SelenideElement kanban = $x("//a[contains(@title, 'KanbanTool')]");
}
