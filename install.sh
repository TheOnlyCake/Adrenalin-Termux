#!/data/data/com.termux/files/usr/bin/bash
set -eu
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="$HOME/.local/bin"
LIB="$HOME/.local/share/adrenalin-team"
CFG="$HOME/.config/adrenalin-team"
mkdir -p "$BIN" "$LIB" "$CFG"

if [[ ! -e "$CFG/bashrc.pre-install" && -f "$HOME/.bashrc" ]]; then
  cp "$HOME/.bashrc" "$CFG/bashrc.pre-install"
fi

for f in banner.sh clear-banner.sh ssh-custom.sh python-wrapper; do
  cp "$ROOT/$f" "$LIB/$f"
done
for f in adrenalin list; do cp "$ROOT/$f" "$BIN/$f"; done
for f in adrenalin-prompt.sh shell-commands.sh; do cp "$ROOT/$f" "$LIB/$f"; done
chmod +x "$BIN/adrenalin" "$BIN/list" "$LIB/"*.sh "$LIB/python-wrapper"

if ! grep -qF '# >>> ADRENALIN TEAM PATH >>>' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<'BASHRC'

# >>> ADRENALIN TEAM PATH >>>
export PATH="$HOME/.local/bin:$PATH"
# <<< ADRENALIN TEAM PATH <<<
BASHRC
fi
echo "Adrenalin Team instalado."
echo "Ejecuta: source ~/.bashrc"
echo "Después: adrenalin --on"
