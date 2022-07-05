FROM ubuntu:18.04

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

ARG VERSION

RUN set -ex; \
    curl -L -o /root/vertcoind.tar.gz https://github.com/vertcoin-project/vertcoin-core/releases/download/$(VERSION}/vertcoin-$(VERSION}-x86_64-linux-gnu.tar.gz ; \
    cd /usr; \
    tar --strip-components=1 -xf /root/vertcoin.tar.gz; \
	rm /root/vertcoin.tar.gz

RUN useradd -m -u 1000 -s /bin/bash runner
USER runner

ENTRYPOINT ["vertcoind"]
