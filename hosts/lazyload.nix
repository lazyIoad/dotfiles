{ config, pkgs, ... }:

let
  workspace = "${config.home.homeDirectory}/Documents/workspace";
in
{
  home = {
    username = "areeb";
    homeDirectory = "/Users/areeb";
    packages = (import ../home/packages.nix pkgs).core ++ [
      colima
      docker
      flyctl
    ];
    sessionVariables = {
      EDITOR = "nvim";
      WORKSPACE = workspace;
    };
    stateVersion = "22.11";
  };

  programs = (import ../home/programs.nix {
    inherit pkgs;

    extraFishAbbrs = (import ../home/lnkd.nix).shellAbbrs
  }) // {
    git = {
      enable = true;
      extraConfig = {
        core = {
          editor = "nvim";
        };
        init = {
          defaultBranch = "master";
        };
      };
      ignores = [
        ".DS_Store"
      ];
      userName = "lazyload";
      userEmail = "git@arb.computer";
    };
  };

  xdg.configFile = import ../home/configFile.nix {
    inherit config workspace;
  };
}
