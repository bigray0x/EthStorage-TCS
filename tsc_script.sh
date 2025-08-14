#!/bin/bash

set -e

echo "=== Detecting operating system ==="
OS="$(uname -s)"
case "$OS" in
    Linux*)
        if grep -qi microsoft /proc/version 2>/dev/null; then
            PLATFORM="WSL"
            echo "Running on WSL (screen won't survive terminal close)"
        else
            PLATFORM="Linux"
            echo "Running on Linux VPS"
        fi
        ;;
    Darwin*)
        PLATFORM="Mac"
        echo "Running on macOS"
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

echo "=== Installing dependencies ==="
if [ "$PLATFORM" = "Linux" ] || [ "$PLATFORM" = "WSL" ]; then
    for i in 1 2 3; do
        sudo apt-get update && sudo apt-get upgrade -y && break || sleep 5
    done
    sudo apt install -y curl iptables build-essential git wget lz4 jq make gcc nano \
    automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev \
    libleveldb-dev tar clang bsdmainutils ncdu unzip ca-certificates screen
elif [ "$PLATFORM" = "Mac" ]; then
    if ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update
    brew install curl git wget jq make gcc nano tmux htop pkg-config \
                 openssl leveldb llvm ncdu unzip
    # screen is already included on macOS by default
fi

echo "=== Installing NVM ==="
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    echo "NVM already installed. Skipping."
fi

# Load NVM immediately for this script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "=== Installing Node.js 18 and setting as default ==="
if ! nvm ls 18 &>/dev/null; then
    nvm install 18
fi
nvm use 18
nvm alias default 18

echo "=== Installing Phase2 CLI ==="
if ! command -v phase2cli &>/dev/null; then
    npm install -g @p0tion/phase2cli
else
    echo "Phase2 CLI already installed. Skipping."
fi

echo "=== Authenticating with GitHub ==="
echo "Follow the instructions to complete login in your browser..."
phase2cli auth

echo "=== Authentication complete ==="
read -p "Do you want to contribute to the ceremony now? (y/n): " contribute_now

if [[ "$contribute_now" =~ ^[Yy]$ ]]; then
    if [ "$PLATFORM" = "Linux" ]; then
        echo "Starting contribution inside a screen session named 'ceremony'..."
        screen -S ceremony bash -c "phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony"
    else
        echo "Running ceremony directly (keep this terminal open)..."
        phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony
    fi
else
    echo "You can contribute later by running:"
    echo "  phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony"
fi

echo "=== Setup complete ==="
