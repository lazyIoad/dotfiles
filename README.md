# Areeb's dotfiles & related setup

## Nix
On first run:
```shell
nix run . switch -- --flake .#{USER}"
```
i.e. 
```shell
nix run . switch -- --flake .#lazyload"
```

Afterwards:
```shell
home-manager switch --flake .#{USER}
```

Set fish as shell
```
echo "$HOME/.nix-profile/bin/fish" | sudo tee -a /etc/shells
chsh -s $HOME/.nix-profile/bin/fish
```

## TODO:
- [ ] Packer -> lazy
- [ ] Refactor nix stuff