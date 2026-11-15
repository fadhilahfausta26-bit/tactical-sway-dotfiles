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
$mod+Return exec $term
$mod+Shift+q kill
$mod+Shift+c reload
$mod+Escape exec ~/.local/bin/tactical-powermenu
$mod+$left focus left
$mod+$down focus down
$mod+$up focus up
$mod+$right focus right
$mod+Left focus left
$mod+Down focus down
$mod+Up focus up
$mod+Right focus right
$mod+Shift+$left move left
$mod+Shift+$down move down
$mod+Shift+$up move up
$mod+Shift+$right move right
$mod+Shift+Left move left
$mod+Shift+Down move down
$mod+Shift+Up move up
$mod+Shift+Right move right
$mod+1 workspace number 1
$mod+2 workspace number 2
$mod+3 workspace number 3
$mod+4 workspace number 4
$mod+5 workspace number 5
$mod+6 workspace number 6
$mod+7 workspace number 7
$mod+8 workspace number 8
$mod+9 workspace number 9
$mod+0 workspace number 10
$mod+Shift+1 move container to workspace number 1
$mod+Shift+2 move container to workspace number 2
$mod+Shift+3 move container to workspace number 3
$mod+Shift+4 move container to workspace number 4
$mod+Shift+5 move container to workspace number 5
$mod+Shift+6 move container to workspace number 6
$mod+Shift+7 move container to workspace number 7
$mod+Shift+8 move container to workspace number 8
$mod+Shift+9 move container to workspace number 9
$mod+Shift+0 move container to workspace number 10
$mod+b splith
$mod+v splitv
$mod+s layout stacking
$mod+w layout tabbed
$mod+e layout toggle split
$mod+f fullscreen
$mod+Shift+space floating toggle
$mod+space focus mode_toggle
$mod+a focus parent
$mod+Shift+minus move scratchpad
$mod+minus scratchpad show
$left resize shrink width 10px
$down resize grow height 10px
$up resize shrink height 10px
$right resize grow width 10px
Left resize shrink width 10px
Down resize grow height 10px
Up resize shrink height 10px
Right resize grow width 10px
Return mode "default"
Escape mode "default"
$mod+r mode "resize"
--locked XF86AudioMute exec pactl set-sink-mute \@DEFAULT_SINK@ toggle
--locked XF86AudioLowerVolume exec pactl set-sink-volume \@DEFAULT_SINK@ -5%
--locked XF86AudioRaiseVolume exec pactl set-sink-volume \@DEFAULT_SINK@ +5%
--locked XF86AudioMicMute exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle
--locked XF86MonBrightnessDown exec brightnessctl set 5%-
--locked XF86MonBrightnessUp exec brightnessctl set 5%+
--to-code Ctrl+Print exec grim - | wl-copy
--to-code Ctrl+Shift+Print exec slurp | grim -g - - | wl-copy
--to-code Mod4+e exec thunar
--to-code Mod4+Shift+w exec zen-browser
Mod1+Tab focus next
Mod1+Shift+Tab focus prev
XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
XF86MonBrightnessUp exec brightnessctl set +10%
XF86MonBrightnessDown exec brightnessctl set 10%-
Mod4+Shift+x exec swaylock -c 000000
Mod4+Shift+BackSpace exec systemctl poweroff
Mod4+Shift+r exec systemctl reboot
$mod+Ctrl+Escape exec foot btop
$mod+n exec swaync-client -t -sw
$mod+Control+Left floating enable, resize set 50 ppt 100 ppt, move position 0 0
$mod+Control+Right floating enable, resize set 50 ppt 100 ppt, move position 50 ppt 0
$mod+Control+Up floating enable, resize set 100 ppt 100 ppt, move position 0 0
$mod+Control+Down floating enable, resize set 35 ppt 40 ppt, move position 63 ppt 56 ppt
Mod4+d exec env GTK_THEME=Adwaita:dark fuzzel
Mod4+Ctrl+l exec swaylock -f
$mod+Shift+v exec cliphist list | fuzzel --dmenu --prompt="CLIPBOARD > " | cliphist decode | wl-copy
XF86AudioPlay exec playerctl play-pause
XF86AudioNext exec playerctl next
XF86AudioPrev exec playerctl previous
$mod+grave exec ~/.local/bin/toggle-scratch
$mod+m exec ~/musik.sh
~/tactical-sway-dotfiles/sync.sh "deskripsi perubahan"
PESAN="${1:-docs: tambahkan README.md menyeluruh & script sync otomatis}"
git add .
git commit -m "$PESAN"
git push -u origin main
