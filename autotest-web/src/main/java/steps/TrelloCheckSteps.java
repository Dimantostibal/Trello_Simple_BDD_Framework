package steps;

import actions.WebChecks;
import com.codeborne.selenide.SelenideElement;
import io.cucumber.java.ru.Когда;
import ru.lanit.at.web.pagecontext.PageManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TrelloCheckSteps {

    private PageManager pageManager;
    private static final Logger LOGGER = LoggerFactory.getLogger(TrelloCheckSteps.class);

    public TrelloCheckSteps(PageManager pageManager) {
        this.pageManager = pageManager;
    }

    @Когда("удостовериться, что карточка находится {string}")
    public void elementAppearOnThePage(String elementName) {
        SelenideElement element = pageManager
                .getCurrentPage()
                .getElement(elementName);
        WebChecks.elementVisibleOnPage(element, null);
        LOGGER.info("Удостовериться, что карточка находится {}", elementName);
    }

    @Когда("удостовериться, что {string} выполнен")
    public void CheckboxCheck(String elementName) {
        SelenideElement element = pageManager
                .getCurrentPage()
                .getElement(elementName);
        WebChecks.elementVisibleOnPage(element, null);
        LOGGER.info("на '{}' '{}' выполнен", pageManager.getCurrentPage().name(), elementName);
    }
}
