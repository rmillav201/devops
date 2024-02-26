FROM maven:3-alpine
WORKDIR /appmavenjenkins
ADD . /appmavenjenkins
COPY target/demo-0.0.1.jar /appmavenjenkins/app.jar

ENV NAME_DB ${DB_HOST:-jdbc:h2:file:./test}
ENV USERNAME_DB ${DB_USERNAME:-user}
ENV PASSWORD_DB ${DB_PASSWORD:-password}
ENV PORT=${SERVER_PORT:-8000}

EXPOSE $PORT
CMD java -jar /appmavenjenkins/app.jar

