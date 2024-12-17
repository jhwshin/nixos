{
  config,
  pkgs,
  ...
} : {
  users.users = {
    hws = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
    };
  };
}