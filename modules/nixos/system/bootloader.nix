{
  config,
  pkgs,
  ...
} : {
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
}