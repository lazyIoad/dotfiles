{ config, pkgs, ... }:

let
  workspace = "${config.home.homeDirectory}/Documents/workspace";
  extraPackages = with pkgs; [
    colima
    docker
    flyctl
  ];
in
{
  home = {
    username = "areeb";
    homeDirectory = "/Users/areeb";
    packages = (import ../home/packages.nix pkgs) ++ extraPackages;
    sessionVariables = {
      EDITOR = "nvim";
      WORKSPACE = workspace;
    };
    stateVersion = "22.11";
  };

  programs = (import ../home/programs.nix {
    inherit pkgs;
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
