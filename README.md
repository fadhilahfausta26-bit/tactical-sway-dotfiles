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

## Pintasan Penting (Highlight)

### Sway & Screenshot
| Pintasan | Aksi |
| :--- | :--- |
| `Super + Shift + S` | Screenshot area pilihan (simpan ke `~/Pictures/Screenshots/` & salin ke clipboard) |
| `Print` | Screenshot layar penuh (simpan ke `~/Pictures/Screenshots/` & salin ke clipboard) |
| `Super + Escape` | Buka menu daya (`tactical-powermenu`) |

### nchat (`foot` Terminal)
| Pintasan | Aksi |
| :--- | :--- |
| `Ctrl + T` | Kirim file / gambar / screenshot (`SendFile`) |
| `Ctrl + B` | Arsipkan / sembunyikan chat aktif (`ArchiveChat`) |
| `Ctrl + L` | Sembunyikan / tampilkan panel daftar kontak kiri |
| `Ctrl + G` | Buka menu perintah tambahan (`OtherCmd`) |
| `Ctrl + N` | Cari dan lompat ke kontak / grup (`GotoChat`) |

---

## Sinkronisasi Otomatis

Jalankan skrip berikut setiap kali ada perubahan konfigurasi lokal di `~/.config/` untuk menyalin file terbaru, memperbarui daftar keybinding di bawah, dan mengunggahnya ke GitHub:

```bash
~/Documents/GitHub/tactical-sway-dotfiles/sync.sh "deskripsi perubahan"
```

---

<!-- KEYBINDINGS_START -->
## Daftar Lengkap Keybinding Sway

<details>
<summary>Klik untuk melihat seluruh daftar <code>bindsym</code> aktif dari <code>sway/config</code></summary>



</details>
<!-- KEYBINDINGS_END -->
