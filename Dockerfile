FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    cmake \
    git \
    lld \
    ninja-build \
    p7zip-full \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Arguments
ARG BUILD_TYPE=Release
ARG LLVM_VERSION=main

# Build LLVM
COPY build_llvm.sh /
RUN chmod +x /build_llvm.sh
RUN /build_llvm.sh
