#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/

useradd -s /bin/zsh -m -G wheel -p '$6$0Jldhwdm$uW908PN22oYIEzgcBtIgHUKAXBFVJWoEJwtuHv8go2Z/ERKd8EGRyTLYP1GX2aKe4Ffh9Mbfba1b/oFLdyrU0/' jreese

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/g_wheel

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target
systemctl enable NetworkManager.service
