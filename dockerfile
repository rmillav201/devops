# Definir la imagen base para la capa de Maven
FROM maven:3.8.6-jdk-17 AS maven

# Compilar las dependencias de Maven y crear el archivo JAR
RUN mvn clean install

FROM eclipse-temurin:17.0.10_7-jdk-jammy

# Configuración de variables de entorno
ENV NAME_DB ${DB_HOST:-jdbc:h2:file:./test}
ENV USERNAME_DB ${DB_USERNAME:-user}
ENV PASSWORD_DB ${DB_PASSWORD:-password}
ENV PORT=${SERVER_PORT:-8000}

# Volumen para datos de H2
#VOLUME /app/data.sql

#COPY src/main/resources/data.sql /app/data.sql

RUN mvn clean install

CMD ["mvnw", "spring-boot:run"]

EXPOSE $PORT