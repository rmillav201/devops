# Utiliza una imagen base que contenga Java 17 y Maven
FROM openjdk:17.0.3-jdk

# Crea un directorio de trabajo dentro de la imagen
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

RUN mvn clean install

# Configura las variables de entorno
ENV NAME_DB=${DB_HOST:jdbc:h2:file:./test}
ENV USERNAME_DB=${DB_USERNAME:user}
ENV PASSWORD_DB=${DB_PASSWORD:password}
ENV PORT=${SERVER_PORT:8000}

CMD ["mvnw", "spring-boot:run"]

EXPOSE 8080