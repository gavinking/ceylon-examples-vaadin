# Vaadin JAAS example in Ceylon

This simple example demonstrates how to write a Java EE web
application using [Vaadin][] and JAAS in the Ceylon 
programming language. 

It is a port of [this example app][example].

[Vaadin]: https://vaadin.com/
[example]: https://github.com/mrts/vaadin-javaee-jaas-example

## Requirements

You'll need the following software to run the example:

- [Ceylon][] 1.3.3 command line tools, and
- [WildFly][] application server.

Note: Ceylon 1.3.3 is *not yet released!*

[Ceylon]: https://ceylon-lang.org/download/
[WildFly]: http://wildfly.org/downloads/

## Compiling and assembling

To compile the example, type

    ceylon compile

To assemble the example as a `.war` archive, type

    ceylon war -Rresource eg.vaadin.jaas/1.0.0

This will create the file `eg.vaadin.jaas-1.0.0.war`.

## Deploying and running

Create an 'Application User' belonging to the group `users`
by running

    $JBOSS_HOME/bin/add-user.sh

Now, copy the `.war` archive to your deployments directory

    cp eg.vaadin.jaas-1.0.0.war $JBOSS_HOME/standalone/deployments/

Start WildFly

    $JBOSS_HOME/bin/standalone.sh

Now go to <http://localhost:8080/eg.vaadin.jaas-1.0.0/>
and log in using the username and password you created.