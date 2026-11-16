#!/usr/bin/env bash
REPO_DIR="$HOME/Documents/GitHub/tactical-sway-dotfiles"
cd "$REPO_DIR" || exit 1

mkdir -p sway waybar foot fuzzel cava bin fastfetch mako swaylock btop yazi nchat
cp -r ~/.config/sway/* ./sway/ 2>/dev/null
cp -r ~/.config/waybar/* ./waybar/ 2>/dev/null
cp -r ~/.config/foot/* ./foot/ 2>/dev/null
cp -r ~/.config/fuzzel/* ./fuzzel/ 2>/dev/null
cp -r ~/.config/fastfetch/* ./fastfetch/ 2>/dev/null
cp -r ~/.config/mako/* ./mako/ 2>/dev/null
cp -r ~/.config/swaylock/* ./swaylock/ 2>/dev/null
cp ~/.config/starship.toml ./starship.toml 2>/dev/null
cp ~/.config/cava/config ./cava/config 2>/dev/null
cp -r ~/.config/btop/* ./btop/ 2>/dev/null
cp -r ~/.config/yazi/* ./yazi/ 2>/dev/null
cp ~/.config/nchat/*.conf ./nchat/ 2>/dev/null
cp ~/musik.sh ./bin/musik.sh 2>/dev/null
cp ~/.local/bin/{musik,putar-lagu,lirik-loop,stop-musik,toggle-scratch} ./bin/ 2>/dev/null

PESAN="${1:-chore: sinkronisasi konfigurasi dotfiles}"
git add .
git commit -m "$PESAN"
git push -u origin main
