FROM alpine:3.6 as downloader
ARG SCANNER_VERSION=3.1.0.1141-linux
ENV SCANNER_URL=https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SCANNER_VERSION}.zip SCANNER_FILE=sonar-scanner-cli-${SCANNER_VERSION}
RUN apk add --no-cache wget ca-certificates unzip libarchive-tools
WORKDIR /usr/local
RUN wget -q ${SCANNER_URL} && \
    bsdtar -xf ${SCANNER_FILE}.zip -s'|[^/]*/||' && \ 
    rm ${SCANNER_FILE}.zip

FROM openjdk:8-slim
COPY --from=downloader /usr/local/bin/sonar-scanner /usr/bin/
COPY --from=downloader /usr/local/bin/sonar-scanner-debug /usr/bin/
COPY --from=downloader /usr/local/lib/sonar-scanner-cli-3.1.0.1141.jar /usr/lib/
RUN mkdir -p /usr/jre/bin && \ 
    ln -s /usr/bin/java /usr/jre/bin/java
CMD ["/usr/bin/sonar-scanner"]
