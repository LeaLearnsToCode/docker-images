FROM ubuntu:latest

# Install pacakges
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade && \
    apt install -y sudo curl build-essential lld && \
    rm -rf /var/lib/apt/lists/*

# Setup circleci user
RUN groupadd --gid 3434 circleci \
  && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
  && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
  && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

USER circleci
RUN cd ~

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
ENV PATH="/home/circleci/.cargo/bin:${PATH}"
RUN rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy rustfmt

# Install Just (https://github.com/casey/just)
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /home/circleci/.cargo/bin

# Install sccache, I repurposed the Just install script for this.
ADD install-sccache.sh "/home/circleci/install-sccache.sh"
RUN bash $HOME/install-sccache.sh --to $HOME/.cargo/bin
