#!/bin/sh

# Determine the OS
OS=$(uname)
INSTALL_PATH="/usr/local/bin/meta"

echo "Starting installation process..."

if [ "$OS" = "Linux" ]; then
    echo "Detected Linux operating system."
    URL="https://github.com/UnitedSignals/Openstack_Metadata_Fetcher/releases/download/1.0.0/meta_linux"
elif [ "$OS" = "Darwin" ]; then
    echo "Detected macOS operating system."
    URL="https://github.com/UnitedSignals/Openstack_Metadata_Fetcher/releases/download/1.0.0/meta_darwin"
    INSTALL_PATH="/usr/local/bin/meta"
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

# Download the appropriate binary
echo "Downloading the binary from $URL..."
curl -L -o "$INSTALL_PATH" "$URL"

# Make the binary executable
echo "Making the binary executable..."
chmod +x "$INSTALL_PATH"

echo "Installation complete. You can now use the 'meta' command."
