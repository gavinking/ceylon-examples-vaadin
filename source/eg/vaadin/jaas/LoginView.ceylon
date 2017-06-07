import com.vaadin.cdi {
    cdiView
}
import com.vaadin.cdi.access {
    JaasAccessControl
}
import com.vaadin.navigator {
    View,
    ViewChangeListener {
        ViewChangeEvent
    }
}
import com.vaadin.ui {
    LoginForm,
    Notification {
        Type
    }
}

//import java.util.logging {
//    Logger
//}

import javax.servlet {
    ServletException
}

cdiView ("login")
shared class LoginView
        extends LoginForm
        satisfies View {

    shared static String viewName = "login";
//    static value logger = Logger.getLogger(`class LoginView`.name);

    shared new () extends LoginForm() {}

    enter(ViewChangeEvent viewChangeEvent)
            => addLoginListener((loginEvent)
                => onLogin(loginEvent, viewChangeEvent.parameters));

    void onLogin(LoginEvent loginEvent, String? parameters) {
        value username = loginEvent.getLoginParameter("username");
        value password = loginEvent.getLoginParameter("password");
        try {
            JaasAccessControl.login(username, password);
            Notification.show("Login successful");
            value nextView = parameters else SecureView.viewName;
            ui.navigator.navigateTo(nextView);
        }
        catch (ServletException e) {
            Notification.show("Login failed", Type.errorMessage);
//            logger.warning(e.string);
        }
    }

}
