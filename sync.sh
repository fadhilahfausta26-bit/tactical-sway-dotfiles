#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/tactical-sway-dotfiles"
cd "$REPO_DIR"

# 1. Pastikan seluruh direktori konfigurasi tersedia
mkdir -p sway waybar foot fuzzel cava bin fastfetch mako swaylock

# 2. Sinkronkan seluruh konfigurasi aktif dari sistem ke repo
cp ~/.config/sway/config ./sway/config
cp -r ~/.config/waybar/* ./waybar/ 2>/dev/null || true
cp -r ~/.config/foot/* ./foot/ 2>/dev/null || true
cp -r ~/.config/fuzzel/* ./fuzzel/ 2>/dev/null || true
cp -r ~/.config/fastfetch/* ./fastfetch/ 2>/dev/null || true
cp -r ~/.config/mako/* ./mako/ 2>/dev/null || true
cp -r ~/.config/swaylock/* ./swaylock/ 2>/dev/null || true
cp ~/.config/starship.toml ./starship.toml 2>/dev/null || true
cp ~/.config/cava/config ./cava/config 2>/dev/null || true

cp ~/musik.sh ./bin/musik.sh 2>/dev/null || true
cp ~/.local/bin/{musik,putar-lagu,lirik-loop,stop-musik,toggle-scratch} ./bin/ 2>/dev/null || true

# 3. Ekstrak seluruh keybinding aktif dari ~/.config/sway/config
KEYBINDS_RAW=$(grep -E '^[[:space:]]*bindsym ' ~/.config/sway/config | sed 's/^[[:space:]]*bindsym //')

# 4. Generate README.md menyeluruh mencakup seluruh komponen rice
cat << 'DOC' > ./README.md
# Tactical Sway Dotfiles (Fedora Linux + Wayland)

Repositori ini menyimpan seluruh konfigurasi lingkungan desktop berbasis **Fedora Linux** dan **Sway Window Manager** dengan estetika *tactical dark/amber*, navigasi berbasis keyboard penuh, optimalisasi konsumsi RAM (dengan `zram` pada laptop 4 GB RAM), serta ekosistem utilitas terminal/TUI.

> **Living Repository:** Dokumentasi, struktur direktori, dan daftar *keybinding* di bawah ini akan **terus diperbarui secara dinamis** setiap kali ada penambahan kustomisasi baru melalui `./sync.sh`.

---

## Arsitektur Sistem & Komponen Utama

| Lapisan Sistem | Paket / Komponen | Peran & Kustomisasi |
| :--- | :--- | :--- |
| **Window Manager** | Sway (Wayland) + `autotiling` | Compositor tiling dinamis dengan manajemen fokus, split otomatis, dan aturan jendela floating |
| **Status Bar / Dock** | Waybar | *Vertical Tactical Dock* (Workspace, CPU, RAM, Suhu, Volume, Brightness, Network, Jam) |
| **Terminal & Prompt** | `foot` + `starship` (`starship.toml`) | Terminal Wayland ringan (termasuk mode *floating scratchpad*) dengan prompt shell kustom |
| **System Fetch** | `fastfetch` | Informasi sistem terminal bertema taktis |
| **Notification Daemon** | `mako` | Notifikasi desktop Wayland minimalis |
| **App Launcher & Clipboard** | `fuzzel` + `cliphist` + `wl-clipboard` | Peluncur aplikasi cepat & riwayat salinan teks/gambar terintegrasi |
| **Screen Locking & Idle** | `swaylock` + `swayidle` | Penguncian layar kustom (10 menit idle) & manajemen daya layar otomatis (15 menit idle) |
| **Tema, Ikon & Kursor** | `Bibata-Modern-Amber` + `Adwaita:dark` + `icons/` | Kursor taktis ukuran 24px, ikon kustom, dan tema gelap GTK global untuk Thunar/GUI |
| **TUI Music Suite** | `fzf` + `mpv` + `cava` + `sptlrx` + `socat` | Pemutar musik 3-panel di Workspace 9 (Daftar lagu, Audio Visualizer PipeWire, Lirik sinkron) |

---

## Struktur Direktori Repositori

```text
tactical-sway-dotfiles/
├── sway/
│   └── config              # Konfigurasi utama Sway (input/output, tema, aturan jendela, autostart, keybindings)
├── waybar/                 # Konfigurasi & styling CSS untuk Vertical Tactical Dock
├── foot/                   # Konfigurasi font, skema warna, dan transparansi terminal foot
├── fuzzel/                 # Konfigurasi tema dan tampilan menu fuzzel
├── fastfetch/              # Konfigurasi & logo informasi sistem fastfetch
├── mako/                   # Konfigurasi tampilan notifikasi mako
├── swaylock/               # Konfigurasi layar kunci swaylock
├── cava/
│   └── config              # Konfigurasi frekuensi & gradien warna visualizer audio
├── icons/                  # Aset ikon kustom untuk dock/panel
├── tactical/               # Aset & skrip pendukung tema taktis
├── starship.toml           # Konfigurasi prompt shell Starship
├── bin/
│   ├── toggle-scratch      # Pengecek window tree Sway untuk Tactical Scratchpad Terminal
│   ├── musik.sh            # Entrypoint pembuka layout 3-panel TUI Music di Workspace 9
│   ├── musik               # Antarmuka pencarian & kontrol playlist berbasis fzf
│   ├── putar-lagu          # Eksekutor mpv dengan auto-shuffle & socket IPC
│   ├── lirik-loop          # Pembungkus sptlrx agar panel lirik tetap aktif saat pergantian lagu
│   └── stop-musik          # Pembersih proses mpv dan jendela TUI musik
├── sync.sh                 # Script sinkronisasi otomatis config lokal + pembaruan README ke GitHub
└── README.md               # Dokumentasi menyeluruh seluruh sistem (auto-updated)
DOC

echo "$KEYBINDS_RAW" >> ./README.md

cat << 'DOC' >> ./README.md
~/tactical-sway-dotfiles/sync.sh "deskripsi perubahan"
PESAN="${1:-docs: tambahkan README.md menyeluruh & script sync otomatis}"
git add .
git commit -m "$PESAN"
git push -u origin main
