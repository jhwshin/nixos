{
  config,
  pkgs,
  ...
} : {
  # display manager
  services.xserver.displayManager.gdm.enable = true;

  # display server
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # desktop environment
  # programs.hyprland.enable = true;
  # programs.hyprland.xwayland.enable = true;
}