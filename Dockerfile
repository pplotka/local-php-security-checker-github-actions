FROM alpine:latest

ARG EXECUTABLE_URL

LABEL "com.github.actions.name"="Local PHP Security Checker"
LABEL "com.github.actions.description"="Run local php security checker via GitHub Actions"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/pplotka/local-php-security-checker-github-actions"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Paweł Płotka <pawel@pplotka.pl>"

RUN echo "${EXECUTABLE_URL}"
RUN wget -O /security-checker ${EXECUTABLE_URL}

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /security-checker

WORKDIR /app

ENTRYPOINT [ "/entrypoint.sh" ]
