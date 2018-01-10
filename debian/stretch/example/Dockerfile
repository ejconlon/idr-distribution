FROM debian:stretch
RUN apt-get update && \
    apt-get install -y libffi-dev libgmp-dev wget
ARG VERSION
ENV VERSION=${VERSION}
ARG RELEASE
ENV RELEASE=${RELEASE}
RUN wget https://github.com/ejconlon/idr-distribution/releases/download/${VERSION}-${RELEASE}/idris_${VERSION}-${RELEASE}_amd64.deb && \
    dpkg -i idris_${VERSION}-${RELEASE}_amd64.deb
