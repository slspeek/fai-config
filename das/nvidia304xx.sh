#!/bin/bash
rm /etc/X11/xorg.conf
set -e
aptitude update
aptitude -r install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') nvidia-legacy-304xx-kernel-dkms
mkdir -p /etc/X11/xorg.conf.d
echo -e 'Section "Device"\n\tIdentifier "My GPU"\n\tDriver "nvidia"\nEndSection' > /etc/X11/xorg.conf.d/20-nvidia.conf

