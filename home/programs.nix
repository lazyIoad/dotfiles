{ pkgs, extraFishAbbrs ? { }, ... }:

{
  bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };

  direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  exa = {
    enable = true;
    enableAliases = true;
  };

  fish = import ./fish.nix { inherit pkgs; extraAbbrs = extraFishAbbrs; };

  fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  home-manager.enable = true;

  starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      package.disabled = true;
    };
  };

  zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
