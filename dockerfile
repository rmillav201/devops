# Utiliza una imagen base que contenga Java 17 y Maven
FROM adoptopenjdk:17-jdk-hotspot AS build

# Crea un directorio de trabajo dentro de la imagen
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

# Ejecuta la aplicación Spring Boot
CMD ["./mvn", "spring-boot:run"]