FROM ubuntu:18.04

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		unzip \
	; \
	rm -rf /var/lib/apt/lists/*

ARG VERSION

RUN set -ex; \
	curl -L -o /root/vertcoind.zip https://github.com/vertcoin-project/vertcoin-core/releases/download/${VERSION}/vertcoind-v${VERSION}-linux-amd64.zip; \
	unzip -d /usr/bin /root/vertcoind.zip; \
	rm /root/vertcoind.zip

RUN useradd -m -u 1000 -s /bin/bash runner
USER runner

ENTRYPOINT ["vertcoind"]
