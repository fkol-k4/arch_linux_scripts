arch_linux_scrpits
==================

####Scripts and files i use for managing my Arch Linux installation.

This set of files and scripts is for managing and updating an Arch Linux installation, **installed inside a subvolume of a BTRFS partition**.
This type of installation provides an easy way to always have a complete backup of our installed system, so that it is very easy to restore the system to a previous state if something goes wrong.

In case that the system is dual (*or even multi*)-booted (such as in my case), the updates script also provides an easy way to transfer a GRUB2 entry to every other distribution of the computer (inside its **/etc/grub.d/** directory).

This is useful due to a bug in GRUB2's os-prober subsystem that fails to detect a Linux installation installed inside a BTRFS subvolume.

**_WARNING:_**
**This repository contains not only the update and subvolume handling script, but also various other things that i use, such as other scripts, custom dotfiles etc.**
If you don't need all these and just want the update and subvolume handling script, then all you have to copy from this repository to your system are the following files: 

    usr/local/bin/custom/custom_arch-updates
    usr/share/applications/custom/custom_arch-updates.desktop
    usr/share/icons/custom/arch-square.svg

_Make sure that the_ **usr/local/bin/custom/custom_arch-updates** _and_ **usr/share/applications/custom/custom_arch-updates.desktop** _files are made executable and keep the same path scheme so that the update scrpit can be launched via its launcher_

#####TODO:
* Use systemd service file for auto-transferring GRUB2 entry.
* Maybe create an 'install.sh' installer.
