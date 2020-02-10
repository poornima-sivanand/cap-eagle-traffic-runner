FROM openjdk:8-jdk-alpine

RUN apk update && \
    apk upgrade

RUN apk --no-cache add --update bash ca-certificates openssl wget && update-ca-certificates

RUN mkdir -p /runner
WORKDIR /runner/

RUN chown -R 1001:0 /runner && \
    chmod -R ug+rwx /runner

USER 1001
