{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
} : {

  # import common nixos modules here
  imports = [
    ../../modules/nixos/system/audio.nix
    ../../modules/nixos/system/bootloader.nix
    ../../modules/nixos/system/graphics-environment.nix
    ../../modules/nixos/system/localization.nix
    ../../modules/nixos/system/users-groups.nix
    ../../modules/nixos/networking/networking.nix
    ../../modules/nixos/networking/ssh.nix
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

  # ??
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";

      # disable global registry
      flake-registry = "";

      # work around for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };

    # disable channels
    channel.enable = false;

    # make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # packages from nixos
  programs.zsh.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "SourceCodePro"
      "Terminus"
    ];})
    noto-fonts-cjk-sans
  ];

  # packages
  environment.systemPackages = with pkgs; [
    # ui
    bitwarden-desktop
    vscode
    firefox
    discord
    spotify

    # system app
    home-manager
    wofi
    pavucontrol
    wev
    pyprland
    python3
    barrier

    # cli
    tmux
    stow
    kitty
    neovim
    bat
    fd
    ripgrep
    fzf
    lsd
    ranger
    rsync
    htop
    btop
    mtr
  ];

  # disable indexing for btrfs snapshots
  services.locate.pruneNames = [ ".snapshots" ];

  system.stateVersion = "24.11";
}