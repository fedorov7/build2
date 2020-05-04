FROM gcc:9.3

FROM base as builder

RUN apt-get update \
 && apt-get install -y \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sSfO https://download.build2.org/0.12.0/build2-install-0.12.0.sh
RUN sh build2-install-0.12.0.sh

FROM base

LABEL maintainer="Alexander Fedorov <fedorov7@gmail.com>"
LABEL name="build2"
LABEL summary="Build2 C++ build toolchain in Docker"
LABEL version="0.12.0"

# Install buildable exucutables
COPY --from=builder /usr/local /usr/local
