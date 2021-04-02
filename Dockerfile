FROM openjdk:8-jdk-alpine

RUN apk update && \
    apk upgrade

RUN apk --no-cache add --update bash ca-certificates openssl wget screen && update-ca-certificates



RUN mkdir -p /runner
WORKDIR /runner/
COPY run-traffic.sh .

RUN chown -R 1001:0 /runner && \
    chmod -R ug+rwx /runner

