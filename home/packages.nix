{ pkgs, ... }:

with pkgs; [
  cachix
  fd
  lazygit
  helix
  luajit
  neovim
  ripgrep
  tree-sitter
  wget
]
