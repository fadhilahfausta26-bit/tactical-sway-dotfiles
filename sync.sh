#!/usr/bin/env bash
REPO_DIR="$HOME/tactical-sway-dotfiles"
cd "$REPO_DIR" || exit 1

mkdir -p sway waybar foot fuzzel cava bin fastfetch mako swaylock
cp ~/.config/sway/config ./sway/config 2>/dev/null
cp -r ~/.config/waybar/* ./waybar/ 2>/dev/null
cp -r ~/.config/foot/* ./foot/ 2>/dev/null
cp -r ~/.config/fuzzel/* ./fuzzel/ 2>/dev/null
cp -r ~/.config/fastfetch/* ./fastfetch/ 2>/dev/null
cp -r ~/.config/mako/* ./mako/ 2>/dev/null
cp -r ~/.config/swaylock/* ./swaylock/ 2>/dev/null
cp ~/.config/starship.toml ./starship.toml 2>/dev/null
cp ~/.config/cava/config ./cava/config 2>/dev/null
cp ~/musik.sh ./bin/musik.sh 2>/dev/null
cp ~/.local/bin/{musik,putar-lagu,lirik-loop,stop-musik,toggle-scratch} ./bin/ 2>/dev/null

# Ekstrak keybinding terbaru ke bagian bawah README.md jika header ditemukan
sed -i '/## Daftar Keybinding Aktif/,$d' ./README.md
{
  echo "## Daftar Keybinding Aktif (Ekstraksi Otomatis dari \`sway/config\`)"
  echo ""
  echo '```swayconfig'
  grep -E '^[[:space:]]*bindsym ' ~/.config/sway/config | sed 's/^[[:space:]]*bindsym //'
  echo '```'
  echo ""
  echo "---"
  echo ""
  echo "## Cara Memperbarui Repositori Saat Ada Kustomisasi Baru"
  echo ""
  echo '```bash'
  echo '~/tactical-sway-dotfiles/sync.sh "deskripsi perubahan"'
  echo '```'
} >> ./README.md

PESAN="${1:-chore: sinkronisasi konfigurasi Sway & update daftar keybinding}"
git add .
git commit -m "$PESAN"
git push -u origin main
