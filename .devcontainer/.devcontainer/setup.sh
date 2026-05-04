#!/bin/bash
# ============================================================
#  Claude Code + Gemini Free — Codespaces Auto Setup
#  By Veltrix Solutions
# ============================================================

set -e

echo ""
echo "====================================="
echo "  Claude Code x Gemini Free Setup"
echo "====================================="
echo ""

# ---------- Install Node.js ----------
echo "[1/4] Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - > /dev/null 2>&1
sudo apt-get install -y nodejs > /dev/null 2>&1
echo "  Node.js $(node -v) installed."

# ---------- Install Claude Code ----------
echo "[2/4] Installing Claude Code..."
npm install -g @anthropic-ai/claude-code > /dev/null 2>&1
echo "  Claude Code installed."

# ---------- Set env vars permanently ----------
echo "[3/4] Setting environment variables..."

# Write to ~/.bashrc so they persist across sessions
grep -qxF 'export ANTHROPIC_BASE_URL="https://generativelanguage.googleapis.com/v1beta/openai"' ~/.bashrc \
  || echo 'export ANTHROPIC_BASE_URL="https://generativelanguage.googleapis.com/v1beta/openai"' >> ~/.bashrc

grep -qxF 'export ANTHROPIC_API_KEY="AIzaSyBVlrzxN0SzLOMSFCPB4pG2Q57nWhRLAtE"' ~/.bashrc \
  || echo 'export ANTHROPIC_API_KEY="AIzaSyBVlrzxN0SzLOMSFCPB4pG2Q57nWhRLAtE"' >> ~/.bashrc

echo "  Env vars saved to ~/.bashrc"

# ---------- Done ----------
echo "[4/4] Setup complete!"
echo ""
echo "====================================="
echo "  NEXT STEP:"
echo "  1. Open ~/.bashrc and replace"
echo "     PASTE_YOUR_GEMINI_KEY_HERE"
echo "     with your actual Gemini API key"
echo ""
echo "  2. Run: source ~/.bashrc"
echo ""
echo "  3. Run: claude --model gemini-2.0-flash"
echo "====================================="
echo ""
