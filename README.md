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

<!-- KEYBINDINGS_START -->
## Daftar Lengkap Keybinding

### 1. Sway Window Manager (`sway/config`)
| Pintasan | Perintah / Aksi |
| :--- | :--- |
| `Super+Return` | `exec $term` |
| `Super+Shift+q` | `kill` |
| `Super+Shift+c` | `reload` |
| `Super+Escape` | `exec ~/.local/bin/tactical-powermenu` |
| `Super+Left` | `focus left` |
| `Super+Down` | `focus down` |
| `Super+Up` | `focus up` |
| `Super+Right` | `focus right` |
| `Super+Left` | `focus left` |
| `Super+Down` | `focus down` |
| `Super+Up` | `focus up` |
| `Super+Right` | `focus right` |
| `Super+Shift+Left` | `move left` |
| `Super+Shift+Down` | `move down` |
| `Super+Shift+Up` | `move up` |
| `Super+Shift+Right` | `move right` |
| `Super+Shift+Left` | `move left` |
| `Super+Shift+Down` | `move down` |
| `Super+Shift+Up` | `move up` |
| `Super+Shift+Right` | `move right` |
| `Super+1` | `workspace number 1` |
| `Super+2` | `workspace number 2` |
| `Super+3` | `workspace number 3` |
| `Super+4` | `workspace number 4` |
| `Super+5` | `workspace number 5` |
| `Super+6` | `workspace number 6` |
| `Super+7` | `workspace number 7` |
| `Super+8` | `workspace number 8` |
| `Super+9` | `workspace number 9` |
| `Super+0` | `workspace number 10` |
| `Super+Shift+1` | `move container to workspace number 1` |
| `Super+Shift+2` | `move container to workspace number 2` |
| `Super+Shift+3` | `move container to workspace number 3` |
| `Super+Shift+4` | `move container to workspace number 4` |
| `Super+Shift+5` | `move container to workspace number 5` |
| `Super+Shift+6` | `move container to workspace number 6` |
| `Super+Shift+7` | `move container to workspace number 7` |
| `Super+Shift+8` | `move container to workspace number 8` |
| `Super+Shift+9` | `move container to workspace number 9` |
| `Super+Shift+0` | `move container to workspace number 10` |
| `Super+b` | `splith` |
| `Super+v` | `splitv` |
| `Super+s` | `layout stacking` |
| `Super+w` | `layout tabbed` |
| `Super+e` | `layout toggle split` |
| `Super+f` | `fullscreen` |
| `Super+Shift+space` | `floating toggle` |
| `Super+space` | `focus mode_toggle` |
| `Super+a` | `focus parent` |
| `Super+Shift+minus` | `move scratchpad` |
| `Super+minus` | `scratchpad show` |
| `Left` | `resize shrink width 10px` |
| `Down` | `resize grow height 10px` |
| `Up` | `resize shrink height 10px` |
| `Right` | `resize grow width 10px` |
| `Left` | `resize shrink width 10px` |
| `Down` | `resize grow height 10px` |
| `Up` | `resize shrink height 10px` |
| `Right` | `resize grow width 10px` |
| `Return` | `mode "default"` |
| `Escape` | `mode "default"` |
| `Super+r` | `mode "resize"` |
| `XF86AudioMute` | `exec pactl set-sink-mute \@DEFAULT_SINK@ toggle` |
| `XF86AudioLowerVolume` | `exec pactl set-sink-volume \@DEFAULT_SINK@ -5%` |
| `XF86AudioRaiseVolume` | `exec pactl set-sink-volume \@DEFAULT_SINK@ +5%` |
| `XF86AudioMicMute` | `exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle` |
| `XF86MonBrightnessDown` | `exec brightnessctl set 5%-` |
| `XF86MonBrightnessUp` | `exec brightnessctl set 5%+` |
| `Ctrl+Print` | `exec grim - \| wl-copy` |
| `Ctrl+Shift+Print` | `exec slurp \| grim -g - - \| wl-copy` |
| `Mod4+e` | `exec thunar` |
| `Mod4+Shift+w` | `exec zen-browser` |
| `Mod1+Tab` | `focus next` |
| `Mod1+Shift+Tab` | `focus prev` |
| `XF86AudioRaiseVolume` | `exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+` |
| `XF86AudioLowerVolume` | `exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-` |
| `XF86AudioMute` | `exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle` |
| `XF86MonBrightnessUp` | `exec brightnessctl set +10%` |
| `XF86MonBrightnessDown` | `exec brightnessctl set 10%-` |
| `Mod4+Shift+x` | `exec swaylock -c 000000` |
| `Mod4+Shift+BackSpace` | `exec systemctl poweroff` |
| `Mod4+Shift+r` | `exec systemctl reboot` |
| `Super+Ctrl+Escape` | `exec foot btop` |
| `Super+n` | `exec swaync-client -t -sw` |
| `Super+Control+Left` | `floating enable, resize set 50 ppt 100 ppt, move position 0 0` |
| `Super+Control+Right` | `floating enable, resize set 50 ppt 100 ppt, move position 50 ppt 0` |
| `Super+Control+Up` | `floating enable, resize set 100 ppt 100 ppt, move position 0 0` |
| `Super+Control+Down` | `floating enable, resize set 35 ppt 40 ppt, move position 63 ppt 56 ppt` |
| `Mod4+d` | `exec env GTK_THEME=Adwaita:dark fuzzel` |
| `Mod4+Ctrl+l` | `exec swaylock -f` |
| `Super+Shift+v` | `exec cliphist list \| fuzzel --dmenu --prompt="CLIPBOARD > " \| cliphist decode \| wl-copy` |
| `XF86AudioPlay` | `exec playerctl play-pause` |
| `XF86AudioNext` | `exec playerctl next` |
| `XF86AudioPrev` | `exec playerctl previous` |
| `Super+grave` | `exec ~/.local/bin/toggle-scratch` |
| `Super+m` | `exec ~/.local/bin/musik.sh` |
| `Print` | `exec grim ~/Pictures/Screenshots/ss_$(date +'%Y-%m-%d_%H-%M-%S').png && wl-copy < $(ls -t ~/Pictures/Screenshots/ss_*.png \| head -n1)` |
| `Super+Shift+s` | `exec FILE=~/Pictures/Screenshots/ss_$(date +'%Y-%m-%d_%H-%M-%S').png && grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE"` |

---

### 2. nchat WhatsApp TUI (`nchat/key.conf`)
| Pintasan | Fungsi |
| :--- | :--- |
| `Ctrl + B` | `archive_chat` |
| `\33\151` | `auto_compose` |
| `KEY_BACKSPACE` | `backspace` |
| `KEY_ALT_BACKSPACE` | `backspace_alt` |
| `\33\177` | `backward_kill_word` |
| `\4001040` | `backward_word` |
| `Ctrl + A` | `begin_line` |
| `Ctrl + C` | `cancel` |
| `Ctrl + C` | `clear` |
| `\33\143` | `copy` |
| `\33\170` | `cut` |
| `\33\54` | `decrease_list_width` |
| `KEY_DC` | `delete` |
| `\33\144` | `delete_chat` |
| `Ctrl + K` | `delete_line_after_cursor` |
| `Ctrl + U` | `delete_line_before_cursor` |
| `Ctrl + D` | `delete_msg` |
| `KEY_DOWN` | `down` |
| `Ctrl + Z` | `edit_msg` |
| `KEY_END` | `end` |
| `Ctrl + E` | `end_line` |
| `\33\164` | `ext_call` |
| `\33\145` | `ext_edit` |
| `\33\57` | `find` |
| `\33\77` | `find_next` |
| `\33\162` | `forward_msg` |
| `\4001057` | `forward_word` |
| `Ctrl + N` | `goto_chat` |
| `KEY_HOME` | `home` |
| `\33\56` | `increase_list_width` |
| `Ctrl + P` | `jump_pinned` |
| `\33\161` | `jump_quoted` |
| `\4001006` | `kill_word` |
| `KEY_LEFT` | `left` |
| `KEY_RETURN` | `linebreak` |
| `KEY_TAB` | `next_chat` |
| `KEY_NPAGE` | `next_page` |
| `KEY_RETURN` | `ok` |
| `Ctrl + V` | `open` |
| `Ctrl + W` | `open_link` |
| `\33\167` | `open_msg` |
| `Ctrl + G` | `other_commands_help` |
| `\33\166` | `paste` |
| `\33\160` | `pin` |
| `KEY_BTAB` | `prev_chat` |
| `KEY_PPAGE` | `prev_page` |
| `Ctrl + Q` | `quit` |
| `\33\163` | `react` |
| `KEY_RIGHT` | `right` |
| `Ctrl + R` | `save` |
| `\33\156` | `select_contact` |
| `Ctrl + S` | `select_emoji` |
| `\33\62` | `select_mention` |
| `Ctrl + X` | `send_msg` |
| `\33\44` | `spell` |
| `\33\11` | `tab` |
| `KEY_FOCUS_IN` | `terminal_focus_in` |
| `KEY_FOCUS_OUT` | `terminal_focus_out` |
| `KEY_RESIZE` | `terminal_resize` |
| `Ctrl + Y` | `toggle_emoji` |
| `Ctrl + G` | `toggle_help` |
| `Ctrl + L` | `toggle_list` |
| `KEY_NONE` | `toggle_top` |
| `Ctrl + T` | `transfer` |
| `Ctrl + F` | `unread_chat` |
| `KEY_UP` | `up` |

<!-- KEYBINDINGS_END -->
