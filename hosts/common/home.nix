# replaces '~/.config/nixpkgs/home.nix'
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
} : {

  # import common home modules here
  imports = [
    ../../modules/home-manager/mpv.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    
    # enable proprietary packages
    config.allowUnfree = true;
  };

  home = {
    username = "hws";
    homeDirectory = "/home/hws";
  };

  # packages
  # home-manager.enable = true;

  # home.packages = with pkgs; [
    
  # ];

  # reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}