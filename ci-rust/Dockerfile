FROM ubuntu:latest

# Install pacakges
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade && \
    apt install -y sudo curl build-essential lld && \
    rm -rf /var/lib/apt/lists/*

# Setup circleci user
# RUN groupadd --gid 3434 circleci \
#   && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
#   && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
#   && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

# USER circleci

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
ENV PATH="${HOME}/.cargo/bin:${PATH}"
RUN rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy rustfmt

# Install Just (https://github.com/casey/just)
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /root/.cargo/bin

CMD [ "/bin/bash" ]
