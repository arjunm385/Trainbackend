FROM openjdk:11
COPY ./target/revature-railways-backend.jar revature-railways-backend.jar
CMD ["java","-jar","revature-railways-backend.jar"]
