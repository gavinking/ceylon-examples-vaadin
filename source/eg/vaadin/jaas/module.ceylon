native ("jvm")
module eg.vaadin.jaas "1.0.0" {
    shared import javax.javaeeapi "7.0";
//    shared import maven:com.vaadin:"vaadin-bom" "8.0.0";
    shared import maven:com.vaadin:"vaadin-shared" "8.0.0";
    shared import maven:com.vaadin:"vaadin-server" "8.0.0";
    shared import maven:com.vaadin:"vaadin-cdi" "2.0.0";
    shared import maven:com.vaadin:"vaadin-client-compiled" "8.0.0";
    shared import maven:com.vaadin:"vaadin-themes" "8.0.0";
    shared import java.base "8";
    import java.logging "8";
}
