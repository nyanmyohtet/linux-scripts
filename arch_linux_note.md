# Arch Installation steps

## Installation(UEFI Mode)

Download ISO from [Arch Linux website](https://www.archlinux.org/download/)

## Check network connection

Lunch `iwctl` prompt.

`iwctl`

List available devices:

```sh
station wlan0 # no output
station wlan0 get networks
```

Then, connect to WiFI network:

`station wlan0 connect wifi_name`

Check network: 

`ping -c 3 archlinux.org`

## Partition

List the available disks and partitions:

`lsblk`

To check size of multiple disks:

`fdisk -l`

To create a new partition:

```sh
cfdisk /dev/sda #nvme0n1 for nvme ssd
```

Select lavel type: `gpt`

Then create 2 partitions:

- /dev/nvme0n1p1 - with 521Mb for UEFI
- /dev/nvme0n1p2 - with all the left space for (root: with nested swapfile and home)

Format the UEFI partition as FAT32:

`mkfs.fat -F32 /dev/nvme0n1p1`

Format the root partition as EXT4:

`mkfs.ext4 /dev/nvme0n1p2`

Then, mount the root partition and install the system:

```sh
mount /dev/nvme0n1p1 /mnt
lsblk # check mounted partitions
pacstrap -i /mnt base linux linux-firmware sudo vi vim nano
```

## After system install

### Generate fstab file:

`genfstab -U -p /mnt >> /mnt/etc/fstab`

### Chroot to installed system:

`arch-chroot /mnt /bin/bash`

### Set local:

`vim /etc/locale.gen`

go to `#en_US.UTF-8 UTF-8` and uncomment.

Then, generate local:

`locale-gen`

And create `locale.conf`:

```sh
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

## Set the timezone

```sh
ln -sf /usr/share/zoneinfo/Asia/Rangoon /etc/localtime
```

## Set local time

```sh
hwclock --systohc --utc
```

Then, check the time:

```sh
date
```

## Set hostname

```sh
echo arch > /etc/hostname
vim /etc/hosts
```

Then, the following lines:

```
127.0.0.1        localhost
::1              localhost
127.0.1.1        archPC
```

## Enable network

```sh
pacman -S networkmanager

systemctl enable NetworkManager
```

## Set root password

`passwd`

Then type password twice.

## Install GRUB

Ref: 
- https://averagelinuxuser.com/a-step-by-step-arch-linux-installation-guide
- https://itsfoss.com/install-arch-linux
- https://averagelinuxuser.com/arch-linux-after-install
