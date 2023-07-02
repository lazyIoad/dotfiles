{
  description = "my personal system flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv.url = "github:cachix/devenv/latest";
  };

  outputs = { nixpkgs, home-manager, devenv, ... }:
  {
    homeConfigurations = {
      "lazyload" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        modules = [ ./hosts/lazyload.nix ];
        extraSpecialArgs = {
          devenv = devenv.packages.x86_64-darwin.devenv;
        };
      };
    };
  };
}
