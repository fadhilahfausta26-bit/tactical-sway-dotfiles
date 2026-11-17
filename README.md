# Tactical Sway Dotfiles

A lightweight, keyboard-driven **Fedora Linux + Sway Wayland** desktop configuration tailored for low-memory hardware (4 GB RAM + `zram`) and a TUI-first workflow.

![OS](https://img.shields.io/badge/OS-Fedora_Linux-51A2DA?style=flat-square&logo=fedora&logoColor=white)
![WM](https://img.shields.io/badge/WM-Sway_Wayland-2E3440?style=flat-square&logo=wayland&logoColor=white)
![Terminal](https://img.shields.io/badge/Terminal-foot-E5C76B?style=flat-square)
![Theme](https://img.shields.io/badge/Theme-Tactical_Amber-E57474?style=flat-square)

---

## Desktop Preview

![Clean Desktop Overview](assets/desktop-clean.png)

| System Info (`fastfetch` + `btop`) | File Manager (`yazi`) | Music & Visualizer (`mpv` + `cava`) |
| :---: | :---: | :---: |
| ![Terminal Sysinfo](assets/terminal-sysinfo.png) | ![Yazi File Manager](assets/yazi.png) | ![Music & Cava](assets/musik-cava.png) |

---

## Environment & Optimization

| Component | Details |
| :--- | :--- |
| **OS & Display** | Fedora Linux (Sway Wayland) |
| **Window Manager** | Sway + Swaylock + Mako |
| **Bar & Launcher** | Waybar + Fuzzel |
| **Terminal & Shell** | Foot + Starship + Yazi |
| **Comms & Audio** | `nchat` (WhatsApp TUI) + PipeWire + `mpv` + `sptlrx` + Cava |
| **Memory Tuning** | `zram` compression & lightweight TUI workflow for 4 GB RAM |

---

## Color Palette

| Role | Name | Hex | Preview |
| :--- | :--- | :--- | :--- |
| Background | Tactical Dark | `#141B1E` | ![#141B1E](https://placehold.co/15x15/141B1E/141B1E.png) |
| Surface / Panel | Slate Charcoal | `#232A2D` | ![#232A2D](https://placehold.co/15x15/232A2D/232A2D.png) |
| Primary Accent | Tactical Amber | `#E5C76B` | ![#E5C76B](https://placehold.co/15x15/E5C76B/E5C76B.png) |
| Secondary Accent | Warm Copper | `#E57474` | ![#E57474](https://placehold.co/15x15/E57474/E57474.png) |
| Foreground | Off White | `#DADADA` | ![#DADADA](https://placehold.co/15x15/DADADA/DADADA.png) |

---

## Core Components

| Path | Component | Description |
| :--- | :--- | :--- |
| `sway/` | **Sway WM** | Window manager configuration, autostart, and helper scripts |
| `waybar/` | **Waybar** | Modular status bar with theme variants (`gruvbox`, `minimal`) |
| `foot/` | **Foot Terminal** | Lightweight Wayland terminal emulator with tactical color scheme |
| `fuzzel/` | **Fuzzel** | Wayland application launcher styled to match the desktop |
| `nchat/` | **nchat (WhatsApp)** | Custom keybindings and UI tweaks for terminal WhatsApp client |
| `btop/` | **btop++** | System resource monitor featuring custom `tactical-amber` theme |
| `yazi/` | **Yazi** | Fast terminal file manager with file previews |
| `mako/` | **Mako** | Wayland notification daemon |
| `swaylock/` | **Swaylock** | Custom lockscreen layout and assets |
| `fastfetch/` & `cava/` | **Aesthetics** | Custom system fetch info and terminal audio spectrum visualizer |
| `starship.toml` | **Starship Prompt** | Fast, minimal cross-shell prompt |
| `bin/` | **Custom Scripts** | Music player automation (`mpv` + `sptlrx`) and scratchpad utilities |

---

## Repository Structure

```text
tactical-sway-dotfiles/
├── assets/         # Desktop & TUI preview screenshots
├── sway/           # Sway WM config & helper scripts
├── waybar/         # Status bar config & stylesheets
├── foot/           # Terminal font, color scheme & behavior
├── fuzzel/         # Application launcher config
├── nchat/          # Terminal WhatsApp client keybindings & UI
├── btop/           # System monitor config & custom theme
├── yazi/           # TUI file manager config & keymaps
├── mako/           # Notification daemon config
├── swaylock/       # Lockscreen config & assets
├── fastfetch/      # System info fetch config & assets
├── cava/           # Audio spectrum visualizer config
├── icons/          # Bibata-Modern-Amber cursor theme
├── bin/            # Custom music & scratchpad automation scripts
├── starship.toml   # Shell prompt configuration
├── sync.sh         # Automated dotfiles sync script
└── README.md       # Repository documentation
```

---

## Automated Sync

Run the sync script whenever local changes in `~/.config/` are ready to be pushed to GitHub:

```bash
~/Documents/GitHub/tactical-sway-dotfiles/sync.sh "commit message"
```
