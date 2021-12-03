package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "главная страница")
public class TrelloMainPage extends WebPage {

    @Name("доска KanbanTool")
    private SelenideElement card = $x("//div[contains(@title, 'KanbanTool')]");
}
