homeDirectory:
{ config, pkgs, ... }:

{
  home = {
    username = "areeb";
    homeDirectory = homeDirectory;
    packages = with pkgs; [
      colima
      docker
      fd
      gnumake
      inetutils
      neovim
      ripgrep
      rust-analyzer
      tree-sitter
      wget
    ];
    sessionVariables = {
      EDITOR = "nvim";
      WORKSPACE = homeDirectory + "/Documents/workspace";
    };
    stateVersion = "22.11";
  };

  programs = {
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

    fish = {
      enable = true;
      functions = {
        mkcd = {
          description = "Make a directory and enter it";
          body = "mkdir -p $argv[1]; and cd $argv[1]";
        };
      };
      plugins = [
        {
          name = "fzf";
          src = pkgs.fetchFromGitHub {
            owner = "PatrickF1";
            repo = "fzf.fish";
            rev = "63c8f8e65761295da51029c5b6c9e601571837a1";
            sha256 = "sha256-i9FcuQdmNlJnMWQp7myF3N0tMD/2I0CaMs/PlD8o1gw=";
          };
        }
        {
          name = "nix-env";
          src = pkgs.fetchFromGitHub {
            owner = "lilyball";
            repo = "nix-env.fish";
            rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
            sha256 = "069ybzdj29s320wzdyxqjhmpm9ir5815yx6n522adav0z2nz8vs4";
          };
        }
      ];
      shellAbbrs = {
        e = "nvim";
        ga = "git add";
        gc- = "git checkout -";
        gcb = "git checkout -b";
        gcm = "git checkout master";
        gcom = "git commit -m ";
        gp = "git pull --rebase";
        grem = "git rebase master";
        n = "nvim";
        ws = "cd $WORKSPACE";
      };
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

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

    home-manager.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/workspace/dotfiles/profiles/nvim";
    };
  };
}
