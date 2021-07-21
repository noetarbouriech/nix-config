# Installin NixOS

- Download minimal iso from nixos.org

- `sudo passwd root && su`

- `wpa_passphrase {SSID} | sudo tee /etc/wpa_supplicant.conf` then enter your password

- `systemctl restart wpa_supplicant` to restart network manager

- (OPTIONAL) continue using ssh by connecting to `root@{ip_address}` (`ifconfig` to check ip)

- Manager partitions using *cfdisk* which is a TUI version of *fdisk* `cfdisk /dev/{disk}`

- Add 3 partitions GPT:
  - 512M - EFI System
  - everything left minus swap - Linux filesystem
  - 8G - Linux swap (depends on memory available)

- `mount /dev/disk/nixos /mnt`

- `mkdir -p /mnt/boot`

- `mount /dev/disk/boot /mnt/boot`

- `nixos-generate-config --root /mnt`
