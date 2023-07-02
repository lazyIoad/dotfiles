{ config, pkgs, devenv, ... }:

let
  workspace = "${config.home.homeDirectory}/Documents/workspace";
  extraPackages = with pkgs; [
    colima
    docker
    flyctl
  ] ++ [ devenv ];
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
    stateVersion = "23.05";
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
      userEmail = "git@lazyloading.net";
    };
  };

  xdg.configFile = import ../home/configFile.nix {
    inherit config workspace;
  };
}
