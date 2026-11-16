# Tactical Sway Dotfiles

Konfigurasi lingkungan desktop **Fedora Linux + Sway Wayland** yang dioptimalkan untuk efisiensi memori (4 GB RAM / zram), alur kerja berbasis keyboard, dan komunikasi terminal.

![OS](https://img.shields.io/badge/OS-Fedora_Linux_44-51A2DA?style=flat-square&logo=fedora&logoColor=white)
![WM](https://img.shields.io/badge/WM-Sway_Wayland-2E3440?style=flat-square&logo=wayland&logoColor=white)
![Terminal](https://img.shields.io/badge/Terminal-foot-EBCB8B?style=flat-square)
![Theme](https://img.shields.io/badge/Theme-Tactical_Amber-D08770?style=flat-square)

---

## Komponen Utama & Konfigurasi

| Direktori / File | Komponen | Keterangan |
| :--- | :--- | :--- |
| `sway/` | **Sway WM** | Konfigurasi window manager, autostart, dan shortcut screenshot |
| `waybar/` | **Waybar** | Status bar modular beserta varian tema (`gruvbox`, `minimal`) |
| `foot/` | **Foot Terminal** | Emulator terminal Wayland ringan dengan tema warna taktis |
| `fuzzel/` | **Fuzzel** | App launcher berbasis Wayland dengan tema selaras |
| `nchat/` | **nchat (WhatsApp)** | Kustomisasi keybinding (`Ctrl+B` arsip, `Ctrl+G` menu) dan UI |
| `btop/` | **btop++** | Pemantau resource sistem dengan tema `tactical-amber` |
| `yazi/` | **Yazi** | File manager terminal dengan pratinjau cepat |
| `mako/` | **Mako** | Daemon notifikasi Wayland |
| `swaylock/` | **Swaylock** | Konfigurasi layar kunci kustom |
| `fastfetch/` & `cava/` | **Aesthetics** | Fetch info sistem dan visualizer audio terminal |
| `starship.toml` | **Starship Prompt** | Prompt shell cepat dan informatif |
| `bin/` | **Skrip Kustom** | Utilitas pemutar musik (`mpv` + `sptlrx`) dan kontrol scratchpad |

---

## Struktur Direktori Repositori

```text
tactical-sway-dotfiles/
├── sway/           # Konfigurasi utama Sway & skrip pendukung
├── waybar/         # Konfigurasi & styling status bar
├── foot/           # Konfigurasi font, skema warna & terminal
├── fuzzel/         # Konfigurasi launcher aplikasi
├── nchat/          # Keybinding & tampilan klien WhatsApp TUI
├── btop/           # Konfigurasi & tema monitor sistem
├── yazi/           # Konfigurasi & keymap file manager TUI
├── mako/           # Konfigurasi daemon notifikasi
├── swaylock/       # Konfigurasi & aset layar kunci
├── fastfetch/      # Konfigurasi & aset info sistem
├── cava/           # Konfigurasi visualizer spektrum audio
├── icons/          # Tema kursor Bibata-Modern-Amber
├── bin/            # Skrip otomatisasi musik & scratchpad
├── starship.toml   # Konfigurasi prompt shell
├── sync.sh         # Skrip sinkronisasi otomatis ke GitHub
└── README.md       # Dokumentasi repositori
```

---
