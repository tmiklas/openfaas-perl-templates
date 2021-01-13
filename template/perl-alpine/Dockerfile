FROM ghcr.io/openfaas/classic-watchdog:0.1.4 as watchdog
FROM alpine:3.12.3

# deploy watchdog
COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

WORKDIR /home/app
COPY main.pl .
COPY function function

RUN apk --no-cache add perl build-base perl-app-cpanminus wget perl-dev openssl openssl-dev perl-net-ssleay \
    && cpanm --installdeps ./function \
    && apk --no-cache del build-base perl-app-cpanminus wget perl-dev openssl-dev \
    && rm -rf /root/.cpanm

RUN adduser -D app
RUN chown app:app -R /home/app
USER app

ENV fprocess="perl main.pl"

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
CMD ["fwatchdog"]
