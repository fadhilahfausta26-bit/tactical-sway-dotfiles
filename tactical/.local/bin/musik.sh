#!/usr/bin/env bash
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"

pkill -f "foot --app-id=musik-" 2>/dev/null
sleep 0.2

swaymsg 'workspace 9'

# 1. Panel Kiri: Daftar Lagu
foot --app-id="musik-list" -e "$HOME/.local/bin/musik" >/dev/null 2>&1 &
sleep 0.6

# 2. Panel Kanan Atas: Visualizer Cava
swaymsg '[app_id="musik-list"] focus; splith'
foot --app-id="musik-cava" -e cava >/dev/null 2>&1 &
sleep 0.6

# 3. Panel Kanan Bawah: Lirik Sinkron
swaymsg '[app_id="musik-cava"] focus; splitv'
foot --app-id="musik-lyric" -e "$HOME/.local/bin/lirik-loop" >/dev/null 2>&1 &
sleep 0.5

# Kembalikan fokus kursor ke daftar lagu
swaymsg '[app_id="musik-list"] focus'
