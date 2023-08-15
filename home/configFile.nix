{ config, workspace, ... }:

{
  helix = {
    source = config.lib.file.mkOutOfStoreSymlink "${workspace}/dotfiles/programs/helix";
  };
  nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${workspace}/dotfiles/programs/nvim";
  };
  wezterm = {
    source = config.lib.file.mkOutOfStoreSymlink "${workspace}/dotfiles/programs/wezterm";
  };
}
