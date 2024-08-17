#!/bin/sh

set -e

os=$(echo "$RUNNER_OS" | tr '[:upper:]' '[:lower:]')
convco_version="$3"

if [ $convco_version = "latest" ]; then
    base_url="https://github.com/convco/convco/releases/latest/download"
else
    base_url="https://github.com/convco/convco/releases/download/$convco_version"
fi

case "$os" in
  macos)
    wget "$base_url/convco-macos.zip" -O convco.zip
    unzip convco.zip
    rm convco.zip
    mv convco ./
    chmod +x ./convco
    ;;
  windows)
    wget "$base_url/convco-windows.zip" -O convco.zip
    unzip convco.zip
    rm convco.zip
    mv convco.exe ./convco.exe
    ;;
  *)
    wget "$base_url/convco-ubuntu.zip" -O convco.zip
    unzip convco.zip
    rm convco.zip
    mv convco ./convco
    chmod +x ./convco
    ;;
esac

./convco "$1" "$2"