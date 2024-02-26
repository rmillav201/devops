FROM adoptopenjdk/openjdk17:alpine-jre

# Instalar Maven si es necesario (ver explicación a continuación)
RUN apk add --no-cache maven  # Corregido para usar la forma adecuada de Alpine Linux

COPY . /app

WORKDIR /app

# Compilación de la aplicación (adapta si la compilación ya se realiza externamente)
RUN mvn clean install

# Configuración de variables de entorno
ENV NAME_DB ${DB_HOST:-jdbc:h2:file:./test}
ENV USERNAME_DB ${DB_USERNAME:-user}
ENV PASSWORD_DB ${DB_PASSWORD:-password}
ENV PORT=${SERVER_PORT:-8000}

# Volumen para datos de H2
VOLUME /app/data.sql

COPY src/main/resources/data.sql /app/data.sql

# Ejecución de la aplicación
CMD ["mvnw", "spring-boot:run"]

EXPOSE $PORT