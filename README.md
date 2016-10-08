arch_linux_scrpits
==================

####Scripts and files i use for managing my Arch Linux installation.

This set of files and scripts is for managing and updating an Arch Linux installation, **installed inside a subvolume of a BTRFS partition**.
This type of installation provides an easy way to always have a complete backup of our installed system, so that it is very easy to restore the system to a previous state if something goes wrong.

---

###Arch Linux installation guide

####Edit Live CD boot options

######*Disabling IPv6 is not always needed. Check if your system works as intended with IPv6 enabled before you disable it.*

Add `ipv6.disable=1` before booting
to disable IPv6 on the kernel

####Disable IPv6 in dhcp

######*Disabling IPv6 is not always needed. Check if your system works as intended with IPv6 enabled before you disable it.*

`# echo 'noipv6rs' >> /etc/dhcpcd.conf`

or

`sudo nano /etc/dhcpcd.conf`

and add `noipv6rs` to its end to disable IPv6 in the dhcp daemon.

####Test if you are booted in EFI mode

`# efivar -l`

If there is output, then the LiveCD has booted in EFI mode.

####Set mirrorlist

`# nano /etc/pacman.d/mirrorlist`

####Update repos (optional)

`# pacman -Syy` (update repo info) or

`# pacman -Syyvu` (update packages too).

####Mount install partitions

`# mount -o discard,ssd,compress=lzo,subvol-$subvolume /dev/sdxy /mnt`

if in EFI mode:

`# mkdir -p /mnt/boot/efi`

`# mount -t vfat /dev/sdxz /mnt/boot/efi`

if we want separate '/home' partition:

`# mount /dev/sdxv /mnt/home`

####Install the base system

`# pacstrap -i /mnt base base-devel xorg`

####Generate fstab file

`# genfstab -U -p /mnt >> /mnt/etc/fstab`

and edit it with

`# nano /mnt/etc/fstab`

####Chroot into the mounted system

`# arch-chroot /mnt /bin/bash`

####Download install scripts

`# cd /root`

`# git clone https://github.com/fkol-k4/fkol-k4.archlinux.extras.git`

If needed, install 'git' first with

`# pacman -S --needed git`

####Run secondary install script

`# . path/to/file`

