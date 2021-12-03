package pages;

import com.codeborne.selenide.SelenideElement;
import org.openqa.selenium.By;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$x;

@Name(value = "открытая доска")
public class TrelloBoardsPage extends WebPage {

    @Name("карточка")
    private SelenideElement card = $x("//span[text()='Карточка для изучения API']");

    @Name("в колонке done")
    private SelenideElement done = $x("//a[text()='done']");

    @Name("пункт 'понять протокол http'")
    private SelenideElement checkboxElem1 = $x("//div[contains(@class, 'state-complete')][1]");

    @Name("пункт 'выучить методы запросов'")
    private SelenideElement checkboxElem2 = $x("//div[contains(@class, 'state-complete')][2]");

    @Name("обложка")
    private SelenideElement cover = $x("//a[contains(@class, 'window-cover-menu-button')]");

    @Name("зеленый")
    private SelenideElement green = $x("//div[contains(@class, 'YkrFKRFIBVAiVq')]//button[1]");

    @Name("закрыть")
    private SelenideElement close = $x("//a[contains(@class, 'js-close-window')]");

    @Name("в срок")
    private SelenideElement inTime = $x("//a[contains(@class, 'js-card-detail-due')]");

    @Name("меню")
    private SelenideElement menu = $x("//a[contains(@class, 'js-show-sidebar')]");

    @Name("смена фона")
    private SelenideElement BoardColor = $x("//a[contains(@class, 'js-change-background')]");

    @Name("цвета")
    private SelenideElement colors = $x("//div[contains(@class, 'board-backgrounds-colors-tile')]");

    @Name("цвет фона")
    private SelenideElement backgroundColor = $x("//div[contains(@style, 'background-color: rgb(81, 152, 57)')]");

    @Name("приватность")
    private SelenideElement permission = $(By.id("permission-level"));

    @Name("рабочее пространство")
    private SelenideElement workingSpace = $x("//a[contains(@name, 'org')]");

    @Name("навигация слева")
    private SelenideElement navigation = $x("//div[contains(@data-test-id, 'workspace-navigation-collapsed-container')]");

    @Name("настройки")
    private SelenideElement settings = $x("//p[text()='Настройки']/..");

    @Name("название доски")
    private SelenideElement pres = $x("//h1[text()='KanbanTool']");

    @Name("изменить название")
    private SelenideElement BoardName = $x("//input[contains(@class, 'board-name-input js-board-name-input')]");
}