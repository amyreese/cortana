cortana
=======

This repository builds a custom Arch Linux live image, modified to my tastes
preferences.  It includes a full desktop install, a custom zsh and screen
profile, uses the dvorak keyboard layout by default, and is ready out of the
box to be used as either a rescue shell or a livable desktop environment for
foreign computing environments.  It also ignores the existence of 32-bit
machines to save space; who doesn't have a 64-bit CPU these days?


customize
---------

Overview of changes made from upstream Arch install images:

- Enable my custom [noswap][] package repository
- Install the following packages:

    - Many useful shell tools, including Vim, Git, SVN, Mercurial, screen/tmux,
      rsync, Tarsnap, Irssi, and Mosh (via [jreese-core][])
	- Full Gnome 3 desktop, including Firefox, Chromium, Thunderbird, Xchat,
      VLC, Gimp, Gparted, Sublime Text, and Spotify (via [jreese-gnome][])
	- Drivers for Intel and Nvidia GPU chipsets, as well as Apple touchpads
	- Kernel modules for ZFS

- Use the "dvorak-jreese" custom keyboard layout (provided by [jreese-core][])
  by default, both in vconsole and X11
- Set system time to the Pacific timezone
- Populate `/etc/skel` with my basic dotfiles
- Create the user 'jreese' with sudo access


Some tips for customizing the live image:

- `packages.both` and `packages.x86_64` define the base installation
- Everything in `root-image/` will get copied to `/` in the final image.
- `root-image/root/customize_root_image.sh` will get executed after packages
  are installed


build
-----

To generate an iso image:

    make build

To write the iso image to a usb drive:

    make of=/dev/sdX write

To clean up the working directory to build again:

    make clean

Or cleanu up everything:

    make dist-clean

Now put it all together for repeatable one-shot build/write:

    make of=/dev/sdX clean write


run
---

At boot, this image will drop you to a Zsh prompt as the user "jreese".
`start gdm` will get you to a graphical login; the password is "cortana".

I suggest following the [Arch installation guide][arch-install]... ;)


[arch-install]: https://wiki.archlinux.org/index.php/Installation_Guide
[noswap]: https://github.com/jreese/arch
[jreese-core]: https://github.com/jreese/arch/blob/master/jreese-core/PKGBUILD
[jreese-gnome]: https://github.com/jreese/arch/blob/master/jreese-gnome/PKGBUILD
