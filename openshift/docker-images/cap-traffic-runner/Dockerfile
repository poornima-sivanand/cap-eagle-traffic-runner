FROM openjdk:8-jdk-alpine

RUN apk update && \
    apk upgrade

RUN apk --no-cache add --update bash screen ca-certificates openssl wget && update-ca-certificates



RUN mkdir -p /runner
WORKDIR /runner/

COPY  ./run-traffic.sh .

RUN chown -R 1001:0 /runner && \
    chmod -R ug+rwx /runner && \
    chmod 777 /runner/run-traffic.sh

USER 1001

ENTRYPOINT [ "sh", "/runner/run-traffic.sh" ]