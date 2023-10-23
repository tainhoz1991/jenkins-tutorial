FROM maven:3.8.7-eclipse-temurin-11-alpine as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM adoptopenjdk/openjdk11
WORKDIR /app
COPY --from=build /app/target/jenkins-0.0.1-SNAPSHOT.jar /apps/
EXPOSE 8088
CMD [ "java", "-jar", "jenkins-0.0.1-SNAPSHOT.jar"]