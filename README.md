# Tactical Sway Dotfiles

Konfigurasi lingkungan desktop **Fedora Linux + Sway Wayland** yang dioptimalkan untuk efisiensi memori (ASUS E410K / 4 GB RAM + zram), alur kerja berbasis keyboard, dan komunikasi terminal.

![OS](https://img.shields.io/badge/OS-Fedora_Linux-51A2DA?style=flat-square&logo=fedora&logoColor=white)
![WM](https://img.shields.io/badge/WM-Sway_Wayland-2E3440?style=flat-square&logo=wayland&logoColor=white)
![Terminal](https://img.shields.io/badge/Terminal-foot-E5C76B?style=flat-square)
![Theme](https://img.shields.io/badge/Theme-Tactical_Amber-E57474?style=flat-square)

---

## Spesifikasi Lingkungan & Optimasi

| Komponen | Detail |
| :--- | :--- |
| **Distro & Display** | Fedora Linux (Sway Wayland) |
| **Window Manager** | Sway + Swaylock + Mako |
| **Bar & Launcher** | Waybar + Fuzzel |
| **Terminal & Shell** | Foot + Starship + Yazi |
| **Komunikasi & Audio** | `nchat` (WhatsApp TUI) + PipeWire + `mpv` + `sptlrx` + Cava |
| **Optimasi Memori** | Kompresi `zram` & alur kerja TUI ringan untuk perangkat 4 GB RAM |

---

## Palet Warna Tema

| Peran | Nama | Hex | Pratinjau |
| :--- | :--- | :--- | :--- |
| Background Utama | Tactical Dark | `#141B1E` | ![#141B1E](https://placehold.co/15x15/141B1E/141B1E.png) |
| Surface / Panel | Slate Charcoal | `#232A2D` | ![#232A2D](https://placehold.co/15x15/232A2D/232A2D.png) |
| Aksen Utama | Tactical Amber | `#E5C76B` | ![#E5C76B](https://placehold.co/15x15/E5C76B/E5C76B.png) |
| Aksen Sekunder | Warm Copper | `#E57474` | ![#E57474](https://placehold.co/15x15/E57474/E57474.png) |
| Teks Utama | Off White | `#DADADA` | ![#DADADA](https://placehold.co/15x15/DADADA/DADADA.png) |

---

## Komponen Utama & Konfigurasi

| Direktori / File | Komponen | Keterangan |
| :--- | :--- | :--- |
| `sway/` | **Sway WM** | Konfigurasi window manager, autostart, dan skrip pendukung |
| `waybar/` | **Waybar** | Status bar modular beserta varian tema (`gruvbox`, `minimal`) |
| `foot/` | **Foot Terminal** | Emulator terminal Wayland ringan dengan tema warna taktis |
| `fuzzel/` | **Fuzzel** | App launcher berbasis Wayland dengan tema selaras |
| `nchat/` | **nchat (WhatsApp)** | Kustomisasi keybinding dan tampilan klien WhatsApp TUI |
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

## Sinkronisasi Otomatis

Jalankan skrip berikut setiap kali ada perubahan konfigurasi lokal di `~/.config/` untuk menyalin file terbaru dan mengunggahnya ke GitHub:

```bash
~/Documents/GitHub/tactical-sway-dotfiles/sync.sh "deskripsi perubahan"
```
