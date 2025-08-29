FROM alpine:3.20
RUN apk --no-cache add openssl curl jq
COPY /scripts /scripts
CMD ["/scripts/app"]