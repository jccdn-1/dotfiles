FROM node:22-trixie

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
    git \
    ripgrep \
    zsh \
    ca-certificates \
    curl \
    tar \
    gzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh -o /tmp/rtk-install.sh \
    && RTK_INSTALL_DIR=/usr/local/bin sh /tmp/rtk-install.sh \
    && rm /tmp/rtk-install.sh

RUN npm install -g @anthropic-ai/claude-code

WORKDIR /workspace

CMD ["zsh"]
