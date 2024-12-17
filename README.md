# nixos

## Remote Install

```bash
# install nixos and disko
sudo nixos-rebuild --extra-experimental-features 'nix-command flakes' run github:nix-community/disko#disko-install -- --flake github:/jhwshin/nixos#HOSTNAME -- disk /dev/<sdX>

# install nixos only
sudo nixos-rebuild --extra-experimental-features 'nix-command flakes' switch --flake github:jhwshin/#HOSTNAME

# install home-manager (using home-manager)
home-manager switch --flake github:jhwshin/nixos#USERNAME@HOSTNAME
```

## Install / Update Locally

```bash
# clone repo
git clone git@github.com:jhwshin/nixos

# rebuild nixos
sudo nixos-rebuild switch --flake .#HOSTNAME

# rebuild home-manager
home-manager switch --flake .#USERNAME@HOSTNAME
```

## Link dotfiles

```bash
# clone submodules recursively
git submodule update --init --recursive --remote

# run dotfiles install script
./dotfiles/install.py '[desktop|laptop]'
```

## Maintenance

```bash
# remove older generations and clean up packages
sudo nix-garbage-collect -d

# clear boot entries
sudo nixos-rebuild boot --flake .#HOSTNAME
```

## Debugging

```bash
# run nix repl
nix repl

# load nixos flakes
:lf .
```