#!/bin/bash
tmux kill server
tmux new -d
Xvfb :1 -screen 0 1920x1080x24 &
Xvfb :2 -screen 0 1920x1080x24 &
Xvfb :3 -screen 0 1920x1080x24 &
export DISPLAY=:1
x11vnc -display :1 -nopw -forever -shared --rfbport 5901&
x11vnc -display :2 -nopw -forever -shared --rfbport 5902&
x11vnc -display :3 -nopw -forever -shared --rfbport 5903&
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6081&
/usr/share/novnc/utils/launch.sh --vnc localhost:5902 --listen 6082&
/usr/share/novnc/utils/launch.sh --vnc localhost:5903 --listen 6083&

wait