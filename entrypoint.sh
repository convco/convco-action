#!/bin/sh

set -e

os=$(echo "$RUNNER_OS" | tr '[:upper:]' '[:lower:]')
convco_version="$3"

case "$os" in
  macos)
    wget https://github.com/convco/convco/releases/download/$convco_version/convco-macos.zip -O convco.zip
    unzip convco.zip
    rm convco.zip
    mv convco ./
    chmod +x ./convco
    ;;
  windows)
    wget https://github.com/convco/convco/releases/download/$convco_version/convco-windows.zip -O convco.zip
    unzip convco.zip
    rm convco.zip
    mv convco.exe ./convco.exe
    ;;
  *)
    wget https://github.com/convco/convco/releases/download/$convco_version/convco-ubuntu.zip -O convco.zip
    unzip convco.zip
    rm convco.zip
    mv convco ./convco
    chmod +x ./convco
    ;;
esac

./convco "$1" "$2"