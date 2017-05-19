import com.vaadin.annotations {
    theme
}
import com.vaadin.cdi {
    CDIViewProvider,
    cdiui
}
import com.vaadin.navigator {
    Navigator
}
import com.vaadin.server {
    Page,
    VaadinRequest
}
import com.vaadin.ui {
    UI,
    VerticalLayout
}

import javax.inject {
    inject
}

cdiui ("jaas")
theme ("jaasexampletheme")
shared inject class JaasExampleUI(viewProvider) extends UI() {

    CDIViewProvider viewProvider;

    function isUserAuthenticated(VaadinRequest vaadinRequest)
            => vaadinRequest.userPrincipal exists;

    shared actual void init(VaadinRequest vaadinRequest) {
        value contentArea = VerticalLayout();
        contentArea.setMargin(false);
        setContent(contentArea);
        value navigator = Navigator(this, contentArea);
        navigator.addProvider(viewProvider);
        navigator.setErrorView(`InaccessibleErrorView`);
        value defaultView = 
                if (exists view = Page.current.uriFragment,
                    !view.trimmed.empty) 
                then view else SecureView.viewName;
        navigator.navigateTo(
            isUserAuthenticated(vaadinRequest) 
                then defaultView
                else LoginView.viewName + "/" + defaultView);
    }

}
