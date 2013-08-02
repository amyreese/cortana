#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/

useradd -s /bin/zsh -m -G wheel -p '$6$JCGVeMa8$stdvt1VdcfyAjZbKFR52rwy9rOmCxhT98iKZfi8VzZHK8Kjwn5OsR66UGTqaTfx9QrDJV2rsNxeVa8ZuHVUOO.' jreese

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/g_wheel

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

curl http://pub.noswap.com/arch/noswap-repo.sh | sh

sed -i -e 's|\(Driver "evdev"\)|\1\n\tOption "XkbLayout" "dvorak"\n\tOption "XkbOptions" "ctrl:nocaps,compose:menu,terminate:ctrl_alt_bksp"|' /etc/X11/xorg.conf.d/10-evdev.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
systemctl enable home.mount swap.swap NetworkManager.service
