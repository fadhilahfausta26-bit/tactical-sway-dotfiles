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

python3 - << 'PY'
import re, os

with open("README.md", "r", encoding="utf-8") as f:
    readme = f.read()

# Hapus bagian Pintasan lama & KEYBINDINGS lama agar tidak duplikat
readme = re.split(r"## Pintasan Penting|<!-- KEYBINDINGS_START -->", readme)[0].rstrip()

def clean_sway_key(k):
    return (k.replace("$mod", "Super")
             .replace("$left", "Left")
             .replace("$right", "Right")
             .replace("$up", "Up")
             .replace("$down", "Down"))

# 1. Ekstrak seluruh bindsym dari sway/config
sway_rows = []
sway_cfg = os.path.expanduser("~/.config/sway/config")
if os.path.exists(sway_cfg):
    with open(sway_cfg, encoding="utf-8") as f:
        for line in f:
            s = line.strip()
            m = re.match(r"^bindsym\s+(?:--[a-z-]+\s+)*(\S+)\s+(.+)$", s)
            if m:
                key = clean_sway_key(m.group(1))
                cmd = m.group(2).replace("|", "\\|")
                sway_rows.append(f"| `{key}` | `{cmd}` |")

# 2. Ekstrak seluruh keybinding dari nchat/key.conf
nchat_rows = []
nchat_cfg = os.path.expanduser("~/.config/nchat/key.conf")
if os.path.exists(nchat_cfg):
    with open(nchat_cfg, encoding="utf-8") as f:
        for line in f:
            s = line.strip()
            if "=" in s and not s.startswith("#"):
                act, val = s.split("=", 1)
                val_clean = (val.replace("KEY_CTRL", "Ctrl + ")
                                .replace("\\33\\141", "Alt + A")
                                .replace("|", "\\|"))
                nchat_rows.append(f"| `{val_clean}` | `{act}` |")

# 3. Ekstrak custom keymap dari yazi/keymap.toml (jika ada)
yazi_rows = []
yazi_cfg = os.path.expanduser("~/.config/yazi/keymap.toml")
if os.path.exists(yazi_cfg):
    with open(yazi_cfg, encoding="utf-8") as f:
        cur_on = None
        for line in f:
            s = line.strip()
            m_on = re.match(r'^on\s*=\s*\[(.*?)\]', s)
            if m_on:
                keys = [x.strip().strip('"\'') for x in m_on.group(1).split(",") if x.strip()]
                cur_on = " + ".join(keys)
            m_run = re.match(r'^run\s*=\s*["\'](.+?)["\']', s)
            if m_run and cur_on:
                desc = m_run.group(1).replace("|", "\\|")
                yazi_rows.append(f"| `{cur_on}` | `{desc}` |")
                cur_on = None

# 4. Ekstrak custom keybindings dari foot/foot.ini (jika ada)
foot_rows = []
foot_cfg = os.path.expanduser("~/.config/foot/foot.ini")
if os.path.exists(foot_cfg):
    in_kb = False
    with open(foot_cfg, encoding="utf-8") as f:
        for line in f:
            s = line.strip()
            if s.startswith("["):
                in_kb = (s == "[key-bindings]")
                continue
            if in_kb and "=" in s and not s.startswith("#"):
                act, val = [x.strip() for x in s.split("=", 1)]
                foot_rows.append(f"| `{val.replace('|', '\\|')}` | `{act}` |")

sections = [
    readme,
    "",
    "<!-- KEYBINDINGS_START -->",
    "## Daftar Lengkap Keybinding",
    "",
    "### 1. Sway Window Manager (`sway/config`)",
    "| Pintasan | Perintah / Aksi |",
    "| :--- | :--- |",
    *(sway_rows or ["| `-` | Tidak ditemukan |"]),
    "",
    "---",
    "",
    "### 2. nchat WhatsApp TUI (`nchat/key.conf`)",
    "| Pintasan | Fungsi |",
    "| :--- | :--- |",
    *(nchat_rows or ["| `-` | Tidak ditemukan |"]),
]

if yazi_rows:
    sections += [
        "",
        "---",
        "",
        "### 3. Yazi File Manager (`yazi/keymap.toml`)",
        "| Pintasan | Aksi |",
        "| :--- | :--- |",
        *yazi_rows,
    ]

if foot_rows:
    sections += [
        "",
        "---",
        "",
        "### 4. Foot Terminal (`foot/foot.ini`)",
        "| Pintasan | Aksi |",
        "| :--- | :--- |",
        *foot_rows,
    ]

sections += ["", "<!-- KEYBINDINGS_END -->", ""]

with open("README.md", "w", encoding="utf-8") as f:
    f.write("\n".join(sections))
PY

PESAN="${1:-docs: tampilkan seluruh keybinding Sway, nchat, Yazi, dan Foot di README}"
git add .
git commit -m "$PESAN"
git push -u origin main
