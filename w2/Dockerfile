FROM --platform=linux/amd64 debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
  clang \
  binutils \
  gdb \
  file \
  watch

RUN echo "alias ll='ls -lah'" >> /root/.bashrc

WORKDIR /hw
