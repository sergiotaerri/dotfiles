#!/usr/bin/env bash
set -euo pipefail

#How would i do this with stow? a Way to make stow symlink a file to a specific location, just like a shebang
sudo ln -s $PWD/95-monitor-hotplug.rules /etc/udev/rules.d/95-monitor-hotplug.rules
sudo ln -s $PWD/hot_plug.service /etc/systemd/system/hot_plug.service
