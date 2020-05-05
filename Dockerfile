FROM gcc:9.3 as base

FROM base as builder

RUN curl -sSfO https://download.build2.org/0.12.0/build2-install-0.12.0.sh

RUN sh build2-install-0.12.0.sh --no-check --yes --local /build2

RUN rm -r /build2/share

FROM base

LABEL maintainer="Alexander Fedorov <fedorov7@gmail.com>"
LABEL name="build2"
LABEL summary="Build2 C++ build toolchain in Docker"
LABEL version="0.12.0"

# Install buildable executables
COPY --from=builder /build2 /usr
