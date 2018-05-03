FROM maven:3-alpine
COPY my-app-1.0-SNAPSHOT.jar  my-app.jar

ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar", "my-app.jar"]

