FROM maven:3.6.0-jdk-11-slim AS build
COPY src /Users/dharanianimireddy/final/src
COPY pom.xml /Users/dharanianimireddy/final
RUN mvn -f /Users/dharanianimireddy/final/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /Users/dharanianimireddy/final/target/gs-spring-boot-docker-0.1.0.jar /usr/local/lib/final.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/usr/local/lib/final.jar"]
