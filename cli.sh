#!/usr/bin/env bash
set -euo pipefail

# macOS-only quick installer for Google Cloud SDK (gcloud)

if ! [[ "$OSTYPE" == "darwin"* ]]; then
  echo "This script is for macOS only." >&2
  exit 1
fi

echo "Installing Google Cloud SDK (gcloud)..."

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew detected — installing via Homebrew cask"
  brew update
  brew install --cask google-cloud-cli
else
  echo "Homebrew not found — using official installer (non-interactive)"
  curl -fsSL https://sdk.cloud.google.com | bash -s -- --disable-prompts
  # The installer modifies shell profiles. Try to source common profiles:
  if [ -f "$HOME/.bashrc" ]; then source "$HOME/.bashrc"; fi
  if [ -f "$HOME/.zshrc" ]; then source "$HOME/.zshrc"; fi
  if [ -f "$HOME/.profile" ]; then source "$HOME/.profile"; fi
fi

# Ensure gcloud is on PATH for this session
if ! command -v gcloud >/dev/null 2>&1; then
  export PATH="$HOME/google-cloud-sdk/bin:$PATH"
fi

echo "gcloud version:"
gcloud --version || true

echo "Done. Run: gcloud init"