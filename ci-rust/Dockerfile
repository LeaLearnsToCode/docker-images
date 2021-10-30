FROM ubuntu:latest

# Install pacakges
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade && \
    apt install -y curl build-essential lld && \
    rm -rf /var/lib/apt/lists/*

# switch to non-privledged user
# RUN useradd --create-home --shell /bin/bash lealearnstocode
# USER lealearnstocode
# WORKDIR /home/lealearnstocode

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy rustfmt

# Install Rust tools
RUN cargo install just

