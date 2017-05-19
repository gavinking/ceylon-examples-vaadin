import com.vaadin.cdi {
    cdiView
}
import com.vaadin.navigator {
    View,
    ViewChangeListener {
        ViewChangeEvent
    }
}
import com.vaadin.ui {
    Button,
    Label,
    TextField {
        text=\ivalue
    },
    VerticalLayout
}

import javax.annotation.security {
    rolesAllowed
}

cdiView ("secure")
rolesAllowed { "users" }
shared class SecureView 
        extends VerticalLayout 
        satisfies View {

    shared static String viewName = "secure";

    shared new () extends VerticalLayout() {}

    shared actual void enter(ViewChangeEvent viewChangeEvent) {
        value name = TextField();
        name.caption = "Type your name here:";
        value button = Button("Click Me");
        button.addClickListener((e) 
            => addComponent(Label("Thanks ``name.text``, it works!")));
        addComponents(name, button);
    }

}
