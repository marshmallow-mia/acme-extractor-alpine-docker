FROM alpine:latest

RUN apk add --no-cache jq coreutils 

COPY ./acme-extract.sh /acme-extract.sh

RUN chmod +x /acme-extract.sh

ENTRYPOINT ["/acme-extract.sh"]
