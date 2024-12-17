{
  inputs,
  lib,
  config,
  pkgs,
  ...
} : {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/system/bluetooth.nix
  ];

  # bootloader
  boot.loader.grub.device = "nodev";          # nodev for EFI
  boot.loader.grub.useOSProber = true;
  #boot.loader.grub.enableCryptodisk = true;

  # networking
  networking.hostName = "tassadar";
}
