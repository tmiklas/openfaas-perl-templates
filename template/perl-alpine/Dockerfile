FROM alpine:3.11

RUN apk --no-cache add curl \
    && echo "Pulling watchdog binary from Github." \
    && curl -sSL https://github.com/openfaas/faas/releases/download/0.13.0/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apk --no-cache del curl

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
