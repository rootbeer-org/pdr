# The Linux build toolchain, pinned so every job of a run shares one build environment even
# while GitHub rolls out a new runner image. Bump SNAPSHOT deliberately to update the toolchain.
FROM ubuntu:24.04@sha256:008173c23f95b170204355c12626cb5a965d779a7e1283b09e9cffbb1bf33ca3
ARG SNAPSHOT=20260929T000000Z
ENV DEBIAN_FRONTEND=noninteractive
# snapshot.ubuntu.com is HTTPS only, so certificates come from the live archive first.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && apt-get update --snapshot "$SNAPSHOT" \
    && apt-get install -y --no-install-recommends --snapshot "$SNAPSHOT" \
        build-essential file netbase patch perl xz-utils bzip2 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --uid 1001 --create-home runner
