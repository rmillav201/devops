FROM openjdk:17-jdk

RUN apt-get update && apt-get install -y maven

COPY . /app

WORKDIR /app

RUN mvn clean install

# Configura las variables de entorno
ENV NAME_DB=${DB_HOST:=jdbc:h2:file:./test}
ENV USERNAME_DB=${DB_USERNAME:user}
ENV PASSWORD_DB=${DB_PASSWORD:password}
ENV PORT=${SERVER_PORT:8000}

# Copia el archivo data.sql
COPY src/main/resources/data.sql /app/data.sql

CMD ["mvnw", "spring-boot:run"]

EXPOSE $PORT