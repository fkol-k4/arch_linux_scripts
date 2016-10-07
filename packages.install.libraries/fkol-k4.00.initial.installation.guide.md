### Arch Linux installation guide

- **Test if you are booted in EFI mode**
`# efivar -l`
If there is output, then the LiveCD has booted in EFI mode.

- **Disable IPv6**
`# echo 'noipv6rs' >> /etc/dhcpcd.conf`
or
`sudo nano /etc/dhcpcd.conf`
and add `noipv6rs` to its end.

- **Set mirrorlist**
`# nano /etc/pacman.d/mirrorlist`

- **Update repos (optional)**
`# pacman -Syy` (update repo info) **++or++**
`# pacman -Syyvu` (update packages too).

- **Mount install partitions**
`# mount -o discard,ssd,compress=lzo,subvol-$subvolume /dev/sdxy /mnt`
if in EFI mode:
`# mkdir -p /mnt/boot/efi`
`# mount -t vfat /dev/sdxz /mnt/boot/efi`
if we want separate '/home' partition:
`# mount /dev/sdxv /mnt/home`

- **Install the base system**
`# pacstrap -i /mnt base base-devel xorg`

- **Generate fstab file**
`# genfstab -U -p /mnt >> /mnt/etc/fstab`
and edit it with
`# nano /mnt/etc/fstab`

- **Chroot into the mounted system**
`# arch-chroot /mnt /bin/bash`

- **Download install scripts**
`# cd /root`
`# git clone https://github.com/fkol-k4/fkol-k4.archlinux.extras.git`
If neede, install 'git' first with
`# pacman -S --needed git`

- **Run secondary install script**
`# . path/to/file`
