package steps;

import com.codeborne.selenide.SelenideElement;
import io.cucumber.java.ru.Когда;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.lanit.at.web.pagecontext.PageManager;

public class TrelloActionSteps {

    private PageManager pageManager;
    private static final Logger LOGGER = LoggerFactory.getLogger(WebActionSteps.class);

    public TrelloActionSteps(PageManager manager) {
        this.pageManager = manager;
    }

    @Когда("ввести в {string} значение {string}")
    public void enterValue(String field, String value) {
        SelenideElement fieldElement = pageManager
                .getCurrentPage()
                .getElement(field);
        fieldElement.sendKeys(value + "\n");
        LOGGER.info("в '{}' изменено значение на '{}'", field, value);
    }
}
