#!/bin/bash

BT="bluez_output.F8_4E_17_2F_8F_CF.1"
HDMI="alsa_output.pci-0000_03_00.1.hdmi-stereo-extra1"

CURRENT=$(pactl get-default-sink)

if [ "$CURRENT" = "$BT" ]; then
  pactl set-default-sink "$HDMI"
  hyprctl notify 1 5000 "rgb(40a02b)" "Switched to [HDMI] output"
else
  pactl set-default-sink "$BT"
  hyprctl notify 1 5000 "rgb(40a02b)" "Switched to [BLUETOOTH] output"
fi

for i in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input $i $(pactl get-default-sink)
done
