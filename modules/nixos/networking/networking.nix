{
  config,
  pkgs,
  ...
} : {
  networking.networkmanager.enable = true;
  # networking.hosts = {
  #   "" = [ "" ];
  #   "" = [ "" ];
  # };
  # networking.wireless.enable = true;
}