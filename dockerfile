FROM eclipse-temurin:17.0.10_7-jdk-jammy

# Instalar Maven si es necesario (ver explicación a continuación)
#RUN apk add --no-cache maven  # Corregido para usar la forma adecuada de Alpine Linux

# Configuración de variables de entorno
ENV NAME_DB ${DB_HOST:-jdbc:h2:file:./test}
ENV USERNAME_DB ${DB_USERNAME:-user}
ENV PASSWORD_DB ${DB_PASSWORD:-password}
ENV PORT=${SERVER_PORT:-8000}

# Volumen para datos de H2
VOLUME /app/data.sql

COPY src/main/resources/data.sql /app/data.sql

#RUN mvn clean install

CMD ["mvnw", "spring-boot:run"]

EXPOSE $PORT