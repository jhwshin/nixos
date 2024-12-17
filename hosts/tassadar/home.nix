{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
} : {
  imports = [
    ../common/home.nix
  ];
}