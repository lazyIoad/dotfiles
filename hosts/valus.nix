{ config, pkgs, ... }:

let
  workspace = "${config.home.homeDirectory}/workspace";
  extraPackages = with pkgs; [
  ];
in
{
  home = {
    username = "areeb";
    homeDirectory = "/home/areeb";
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
