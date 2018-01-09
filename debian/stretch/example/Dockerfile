FROM debian:stretch
RUN apt-get update && \
    apt-get install -y libffi-dev libgmp-dev wget
ARG VERSION
ENV VERSION=${VERSION}
RUN wget https://github.com/ejconlon/idr-distribution/releases/download/v${VERSION}/idris_${VERSION}_amd64.deb && \
    dpkg -i idris_${VERSION}_amd64.deb
