FROM gcc:9.3 as base

FROM base as builder

RUN curl -sSfO https://download.build2.org/0.12.0/build2-install-0.12.0.sh

RUN sh build2-install-0.12.0.sh --no-check --yes --trust 86:BA:D4:DE:2C:87:1A:EE:38:C7:F1:64:7F:65:77:02:15:79:F3:C4:83:C0:AB:5A:EA:F4:F7:8C:1D:63:30:C6

FROM base

LABEL maintainer="Alexander Fedorov <fedorov7@gmail.com>"
LABEL name="build2"
LABEL summary="Build2 C++ build toolchain in Docker"
LABEL version="0.12.0"

# Install buildable exucutables
COPY --from=builder /usr/local /usr/local
