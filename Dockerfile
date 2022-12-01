FROM ubuntu as lvl_1
COPY ./my-app/source /source
RUN mvn -B package

FROM openjdk:8-jdk-alpine
COPY --from=lvl_1 /target/my-app-example.jar
RUN useradd -m newuser && passwd -d newuser
RUN chown newuser /target/my-app-*
USER newuser
CMD java -jar /target/my-app-*

