FROM debian:jessie

# base build container for macos binaries from
#  http://opensource.apple.com/

RUN apt-get update && apt-get install -y \
  curl \
  libbsd-dev \
  gcc \
  patch \
  && rm -rf /var/lib/apt/lists/*
