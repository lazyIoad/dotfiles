# Areeb's dotfiles & related setup

## Prerequisites:
- A [nerd font](https://www.nerdfonts.com/font-downloads), like Fira Code

## Nix
On first run:
```shell
nix run . switch -- --flake .#{USER}
```
i.e.
```shell
nix run . switch -- --flake .#lazyload
```

Afterwards:
```shell
home-manager switch --flake .#{USER}
```
i.e.
```shell
home-manager switch --flake .#lazyload
```

Other commands:
```shell
nix flake update
nix-collect-garbage -d
```

## Etc
Set fish as shell
```
echo "$HOME/.nix-profile/bin/fish" | sudo tee -a /etc/shells
chsh -s $HOME/.nix-profile/bin/fish
```

## TODO:
- [x] Packer -> lazy
- [x] Refactor nix stuff
